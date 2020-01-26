<?php

namespace AppBundle\Event;

use AppBundle\Entity\SessionLog;
use AppBundle\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Registry;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Http\Event\InteractiveLoginEvent;
use Symfony\Component\Security\Http\SecurityEvents;

class SessionLogSubscriber implements EventSubscriberInterface
{
    /** @var Registry */
    private $registry;

    /** @var TokenStorageInterface */
    private $tokenStorage;

    /**
     * SessionLogSubscriber constructor.
     *
     * @param Registry $registry
     * @param TokenStorageInterface $tokenStorage
     */
    public function __construct(Registry $registry, TokenStorageInterface $tokenStorage)
    {
        $this->registry = $registry;
        $this->tokenStorage = $tokenStorage;
    }

    /**
     * {@inheritdoc}
     */
    public static function getSubscribedEvents()
    {
        return array(
            SecurityEvents::INTERACTIVE_LOGIN => 'onLoginSuccess',
            KernelEvents::TERMINATE => 'onKernelTerminate',
        );
    }

    /**
     * @param InteractiveLoginEvent $event
     *
     * @throws \Exception
     */
    public function onLoginSuccess(InteractiveLoginEvent $event)
    {
        /** @var Request $request */
        $request = $event->getRequest();

        /** @var User $user */
        $user = $event->getAuthenticationToken()->getUser();

        $sessionLog = (new SessionLog())
            ->setLogin(new \DateTime())
            ->setIp($request->getClientIp())
            ->setUser($user);

        $entityManager = $this->registry->getManager();

        $entityManager->persist($sessionLog);

        $entityManager->flush();
    }

    /**
     * @throws \Exception
     */
    public function onKernelTerminate()
    {
        /** @var TokenInterface|null $token */
        $token = $this->tokenStorage->getToken();

        if ($token instanceof TokenInterface) {
            /** @var User $user */
            $user = $token->getUser();

            if ($user instanceof User) {
                /** @var EntityManagerInterface $entityManager */
                $entityManager = $this->registry->resetManager();

                $sessionLogs = $entityManager->getRepository(SessionLog::class)->findBy(
                    array('user' => $user),
                    array('login' => 'DESC'),
                    1
                );

                if (isset($sessionLogs[0])) {
                    /** @var SessionLog $sessionLog */
                    $sessionLog = $sessionLogs[0];

                    $sessionLog->setLogout(new \DateTime());

                    $entityManager->flush();
                }
            }
        }
    }
}
