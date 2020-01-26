<?php

namespace AppBundle\Controller;

use AppBundle\Entity\CompanySettings;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class WebsiteController extends Controller
{
    /**
     * @return Response
     *
     * @Route("/", name="website_homepage")
     */
    public function indexAction()
    {
        $entityManager = $this->getDoctrine()->getManager();

        $companySettings = $entityManager->getRepository(CompanySettings::class)->find(1);

        if (!$companySettings instanceof CompanySettings) {
            $companySettings = new CompanySettings();
        }

        return $this->render('website/index.html.twig', array('companySettings' => $companySettings));
    }

    /**
     * @return Response
     *
     * @Route("/product", name="website_product")
     */
    public function productAction()
    {
        $entityManager = $this->getDoctrine()->getManager();

        $companySettings = $entityManager->getRepository(CompanySettings::class)->find(1);

        if (!$companySettings instanceof CompanySettings) {
            $companySettings = new CompanySettings();
        }

        return $this->render('website/product.html.twig', array('companySettings' => $companySettings));
    }

    /**
     * @return Response
     *
     * @Route("/blog", name="website_blog")
     */
    public function blogAction()
    {
        $entityManager = $this->getDoctrine()->getManager();

        $companySettings = $entityManager->getRepository(CompanySettings::class)->find(1);

        if (!$companySettings instanceof CompanySettings) {
            $companySettings = new CompanySettings();
        }

        return $this->render('website/blog.html.twig', array('companySettings' => $companySettings));
    }

    /**
     * @return Response
     *
     * @Route("/about", name="website_about")
     */
    public function aboutAction()
    {
        $entityManager = $this->getDoctrine()->getManager();

        $companySettings = $entityManager->getRepository(CompanySettings::class)->find(1);

        if (!$companySettings instanceof CompanySettings) {
            $companySettings = new CompanySettings();
        }

        return $this->render('website/about.html.twig', array('companySettings' => $companySettings));
    }

    /**
     * @return Response
     *
     * @Route("/contact", name="website_contact")
     */
    public function contactAction()
    {
        $entityManager = $this->getDoctrine()->getManager();

        $companySettings = $entityManager->getRepository(CompanySettings::class)->find(1);

        if (!$companySettings instanceof CompanySettings) {
            $companySettings = new CompanySettings();
        }

        return $this->render('website/contact.html.twig', array('companySettings' => $companySettings));
    }
}
