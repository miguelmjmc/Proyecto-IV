<?php

namespace AppBundle\Controller;

use AppBundle\Entity\CompanySettings;
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
        return $this->render('system/index.html.twig');
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
     * @Route("/admin/user/", name="user")
     */
    public function userAction()
    {
        return $this->render('system/user.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/user/profile", name="user_profile")
     */
    public function userProfileAction()
    {
        $user = $this->getUser();

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
     * @Route("/admin/sessionLog", name="session_log")
     */
    public function sessionLogAction()
    {
        return $this->render('system/session_log.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/admin/operationLog", name="operation_log")
     */
    public function operationLogAction()
    {
        return $this->render('system/operation_log.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/client", name="client")
     */
    public function clientsAction()
    {
        return $this->render('system/client.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/product", name="product")
     */
    public function productsAction()
    {
        return $this->render('system/product.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/companySettings", name="company_settings")
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
     * @Route("/modal/companySettings", name="company_settings_modal")
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
}
