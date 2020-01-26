<?php

namespace AppBundle\Event;

use AppBundle\Entity\OperationLog;
use AppBundle\Entity\SessionLog;
use AppBundle\Entity\User;
use Doctrine\Common\EventSubscriber;
use Doctrine\ORM\Event\OnFlushEventArgs;
use Doctrine\ORM\Events;
use Doctrine\ORM\UnitOfWork;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;

class OperationLogSubscriber implements EventSubscriber
{
    /**
     * @var RequestStack
     */
    private $requestStack;

    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;

    /**
     * OperationLogSubscriber constructor.
     *
     * @param RequestStack $requestStack
     * @param TokenStorageInterface $tokenStorage
     */
    public function __construct(RequestStack $requestStack, TokenStorageInterface $tokenStorage)
    {
        $this->requestStack = $requestStack;
        $this->tokenStorage = $tokenStorage;
    }

    /**
     * {@inheritdoc}
     */
    public function getSubscribedEvents()
    {
        return array(
            Events::onFlush => 'onFlush',
        );
    }

    /**
     * @param OnFlushEventArgs $args
     *
     * @throws \Exception
     */
    public function onFlush(OnFlushEventArgs $args)
    {
        /** @var Request $request */
        $request = $this->requestStack->getMasterRequest();

        /** @var TokenInterface|null $token */
        $token = $this->tokenStorage->getToken();

        $user = null;

        if ($token instanceof TokenInterface) {
            /** @var User $user */
            $user = $token->getUser();
        }

        if ($request instanceof Request && $user instanceof User) {
            $em = $args->getEntityManager();

            $uow = $em->getUnitOfWork();

            /** @var User $user */
            $user = $em->find(User::class, $user->getId());

            foreach ($uow->getScheduledEntityInsertions() as $keyEntity => $entity) {
                if (!$entity instanceof SessionLog) {
                    /** @var \ReflectionClass $reflectionClass */
                    $reflectionClass = new \ReflectionClass($entity);

                    $log = (new OperationLog())
                        ->setDate(new \DateTime())
                        ->setEntity($reflectionClass->getShortName())
                        ->setEntityId($entity->getId())
                        ->setRequest($request->getPathInfo())
                        ->setMethod($request->getMethod())
                        ->setAction('Insert')
                        ->setUser($user)
                        ->setChangeSet($this->formattedChangeSet($uow, $entity));

                    $uow->persist($log);

                    $uow->computeChangeSets();
                }
            }

            foreach ($uow->getScheduledEntityUpdates() as $keyEntity => $entity) {
                if (!$entity instanceof SessionLog) {
                    if ('/login_check' !== $request->getPathInfo()) {
                        /** @var \ReflectionClass $reflectionClass */
                        $reflectionClass = new \ReflectionClass($entity);

                        $log = (new OperationLog())
                            ->setDate(new \DateTime())
                            ->setEntity($reflectionClass->getShortName())
                            ->setEntityId($entity->getId())
                            ->setRequest($request->getPathInfo())
                            ->setMethod($request->getMethod())
                            ->setAction('Update')
                            ->setUser($user)
                            ->setChangeSet($this->formattedChangeSet($uow, $entity));

                        $uow->persist($log);

                        $uow->computeChangeSets();
                    }
                }
            }

            foreach ($uow->getScheduledEntityDeletions() as $keyEntity => $entity) {
                if (!$entity instanceof SessionLog) {
                    /** @var \ReflectionClass $reflectionClass */
                    $reflectionClass = new \ReflectionClass($entity);

                    $log = (new OperationLog())
                        ->setDate(new \DateTime())
                        ->setEntity($reflectionClass->getShortName())
                        ->setEntityId($entity->getId())
                        ->setRequest($request->getPathInfo())
                        ->setMethod($request->getMethod())
                        ->setAction('Delete')
                        ->setUser($user)
                        ->setChangeSet($this->formattedChangeSet($uow, $entity));

                    $uow->persist($log);

                    $uow->computeChangeSets();
                }
            }
        }
    }

    /**
     * @param UnitOfWork $uow
     * @param object $entity
     *
     * @return array
     */
    public function formattedChangeSet(UnitOfWork $uow, $entity)
    {
        $data = array();

        foreach ($uow->getEntityChangeSet($entity) as $field => $changes) {
            if ($changes[0] instanceof \DateTime || $changes[1] instanceof \DateTime) {
                $data[$field]['from'] = $changes[0] instanceof \DateTime ? $changes[0]->format(
                    'Y-m-d H:i:s'
                ) : $changes[0];
                $data[$field]['to'] = $changes[1] instanceof \DateTime ? $changes[1]->format(
                    'Y-m-d H:i:s'
                ) : $changes[1];
            } elseif (is_object($changes[0]) || is_object($changes[1])) {
                $data[$field]['from'] = is_object($changes[0]) ? $changes[0]->getId() : $changes[0];
                $data[$field]['to'] = is_object($changes[1]) ? $changes[1]->getId() : $changes[1];
            } else {
                $data[$field]['from'] = $changes[0];
                $data[$field]['to'] = $changes[1];
            }
        }

        return $data;
    }
}
