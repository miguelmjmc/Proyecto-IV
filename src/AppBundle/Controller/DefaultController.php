<?php

namespace AppBundle\Controller;

use AppBundle\Entity\CompanySettings;
use AppBundle\Entity\Product;
use AppBundle\Entity\Reservation;
use AppBundle\Entity\User;
use AppBundle\Form\CompanySettingsType;
use AppBundle\Form\UserType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/system")
 */
class DefaultController extends Controller
{
    /**
     * @return Response
     *
     * @Route("/", name="homepage")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $recentlyUpdatedProducts = $em->getRepository(Product::class)->findBy(array(), array('updatedAt' => 'desc'), 4);
        $mostVisitedProducts = $em->getRepository(Product::class)->findBy(array(), array('viewCounter' => 'desc'), 4);

        $users = $em->getRepository(User::class)->findBy(array(), array('lastLogin' => 'desc'), 12);

        $reservations = $em->getRepository(Reservation::class)->findAll();

        $reservationAll = count($reservations);
        $reservationFinished = 0;
        $reservationInProgress = 0;
        $reservationCanceled = 0;

        /** @var Reservation $reservation */
        foreach ($reservations as $reservation) {
            if (5 === $reservation->getReservationStatus()->getId()) {
                $reservationCanceled++;
            } elseif (4 === $reservation->getReservationStatus()->getId()) {
                $reservationFinished++;
            } else {
                $reservationInProgress++;
            }
        }

        return $this->render(
            'system/index.html.twig',
            array(
                'reservationAll' => $reservationAll,
                'reservationFinished' => $reservationFinished,
                'reservationInProgress' => $reservationInProgress,
                'reservationCanceled' => $reservationCanceled,
                'recentlyUpdatedProducts' => $recentlyUpdatedProducts,
                'mostVisitedProducts' => $mostVisitedProducts,
                'users' => $users,
            )
        );
    }

    /**
     * @return Response
     *
     * @Route("/construction/{section}", name="under_construction", defaults={"section": null})
     */
    public function constructionAction()
    {
        return $this->render('@App/base/under_construction.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/help/", name="help")
     */
    public function helpAction()
    {
        return $this->render('system/help.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/admin/config/users", name="users")
     */
    public function userAction()
    {
        return $this->render('system/user.html.twig');
    }

    /**
     * @param User $user
     *
     * @return Response
     *
     * @Route("/user/profile/{id}", defaults={"id"=null}, name="user_profile")
     */
    public function userProfileAction(User $user = null)
    {
        if (!$user) {
            $user = $this->getUser();
        }

        $parameters = array(
            'method' => 'GET',
            'attr' => array('readonly' => true),
        );

        $form = $this->createForm(UserType::class, $user, $parameters);

        return $this->render('system/user_profile.html.twig', array('form' => $form->createView()));
    }

    /**
     * @return Response
     *
     * @Route("/admin/config/sessionLogs", name="session_logs")
     */
    public function sessionLogAction()
    {
        return $this->render('system/session_log.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/admin/config/operationLogs", name="operation_logs")
     */
    public function operationLogAction()
    {
        return $this->render('system/operation_log.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/admin/reservations", name="reservations")
     */
    public function reservationAction()
    {
        return $this->render('system/reservation.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/admin/products", name="products")
     */
    public function productAction()
    {
        return $this->render('system/product.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/admin/vehicles", name="vehicles")
     */
    public function vehicleAction()
    {
        return $this->render('system/vehicle.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/admin/slides", name="slides")
     */
    public function slideAction()
    {
        return $this->render('system/slide.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/admin/config/companySettings", name="company_settings")
     */
    public function companySettingsAction()
    {
        $companySettings = $this->getDoctrine()->getRepository(CompanySettings::class)->find(1);

        $parameters = array('method' => 'GET', 'attr' => array('readonly' => true));

        $form = $this->createForm(CompanySettingsType::class, $companySettings, $parameters);

        return $this->render('system/company_settings.html.twig', array('form' => $form->createView()));
    }

    /**
     * @param Request $request
     *
     * @return Response
     *
     * @Route("/admin/config/modal/companySettings", name="company_settings_modal")
     */
    public function companySettingsModalAction(Request $request)
    {
        $settings = $this->getDoctrine()->getRepository(CompanySettings::class)->find(1);

        if (null === $settings) {
            $method = 'POST';
        } else {
            $method = 'PUT';
        }

        $form = $this->createForm(CompanySettingsType::class, $settings, array('method' => $method));

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();

            if (null === $settings) {
                $em->persist($form->getData());
            }

            $em->flush();

            return new Response('success-reload');
        }

        $parameters = array(
            'form' => $form->createView(),
            'entityName' => 'CompanySettings',
            'action' => $this->generateUrl('company_settings_modal'),
            'method' => $method,
        );

        return $this->render('@App/base/modal.html.twig', $parameters);
    }

    /**
     * @return Response
     *
     * @Route("/admin/config/currencyConversion", name="currency_conversion")
     */
    public function currencyConversionAction()
    {
        return $this->render('system/currency_conversion.html.twig');
    }
}
