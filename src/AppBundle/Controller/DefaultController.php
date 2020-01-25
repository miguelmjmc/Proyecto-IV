<?php

namespace AppBundle\Controller;

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
     * @Route("/sessionLog", name="session_log")
     */
    public function sessionLogAction()
    {
        return $this->render('system/session_log.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/operationLog", name="operation_log")
     */
    public function operationLogAction()
    {
        return $this->render('system/operation_log.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/clients", name="clients")
     */
    public function clientsAction()
    {
        return $this->render('system/clients.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/products", name="products")
     */
    public function productsAction()
    {
        return $this->render('system/products.html.twig');
    }

    /**
     * @return Response
     *
     * @Route("/users", name="users")
     */
    public function usersAction()
    {
        return $this->render('system/users.html.twig');
    }
}
