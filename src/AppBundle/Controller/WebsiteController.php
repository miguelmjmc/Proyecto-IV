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
        $companySettings = new CompanySettings();
        return $this->render('website/index.html.twig', array('companySettings' => $companySettings));
    }
}
