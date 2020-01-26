<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Client;
use AppBundle\Entity\OperationLog;
use AppBundle\Entity\ProductBrand;
use AppBundle\Entity\ProductCategory;
use AppBundle\Entity\SessionLog;
use AppBundle\Entity\User;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/system")
 */
class DatatableController extends Controller
{
    /**
     * @return JsonResponse
     *
     * @Route("/admin/user/list/user", name="user_list")
     */
    public function userListAction()
    {
        $collection = $this->getDoctrine()->getRepository(User::class)->findAll();

        $data = array('data' => array());

        /** @var User $item */
        foreach ($collection as $item) {

            $parameters = array(
                'suffix' => 'Usuario',
                'actions' => array('show', 'edit'),
                'path' => $this->generateUrl('mjmc_crud', array('entityName' => 'User', 'id' => $item->getId())),
            );

            $btn = $this->renderView('@App/base/table_btn.html.twig', $parameters);

            $data['data'][] = array(
                $item->getLastUpdate() instanceof \DateTime ? $item->getLastUpdate()->format('Y/m/d H:i:s') : '',
                $item->getFullName(),
                $item->getUsername(),
                $item->getEmail(),
                $item->hasRole('ROLE_SUPER_ADMIN') ? 'Administrador' : 'Operador',
                $item->getStatus(),
                $btn,
            );
        }

        return new JsonResponse($data);
    }

    /**
     * @return JsonResponse
     *
     * @Route("/admin/list/sessionLog", name="session_log_list")
     */
    public function sessionLogListAction()
    {
        $collection = $this->getDoctrine()->getRepository(SessionLog::class)->findAll();

        $data = array('data' => array());

        /** @var SessionLog $item */
        foreach ($collection as $item) {
            $data['data'][] = array(
                $item->getLogin()->format('Y/m/d H:i:s'),
                $item->getLogout()->format('Y/m/d H:i:s'),
                $item->getUser()->getUsername(),
                $item->getIp(),
            );
        }

        return new JsonResponse($data);
    }

    /**
     * @return JsonResponse
     *
     * @Route("/admin/list/operationLog", name="operation_log_list")
     */
    public function operationLogListAction()
    {
        $collection = $this->getDoctrine()->getRepository(OperationLog::class)->findAll();

        $data = array('data' => array());

        /** @var OperationLog $item */
        foreach ($collection as $item) {
            $data['data'][] = array(
                $item->getDate()->format('Y/m/d H:i:s'),
                $item->getUser()->getUsername(),
                $item->getRequest(),
                $item->getMethod(),
                $item->getAction(),
                $item->getEntity(),
                $item->getEntityId(),
                json_encode($item->getChangeSet()),
            );
        }

        return new JsonResponse($data);
    }

    /**
     * @return JsonResponse
     *
     * @Route("/list/client", name="client_list")
     */
    public function clientListAction()
    {
        $collection = $this->getDoctrine()->getRepository(Client::class)->findAll();

        $data = array('data' => array());

        /** @var Client $item */
        foreach ($collection as $item) {

            $parameters = array(
                'suffix' => 'Cliente',
                'actions' => array('show', 'edit'),
                'path' => $this->generateUrl('mjmc_crud', array('entityName' => 'Client', 'id' => $item->getId())),
            );

            $btn = $this->renderView('@App/base/table_btn.html.twig', $parameters);

            $data['data'][] = array(
                $item->getLastUpdate() instanceof \DateTime ? $item->getLastUpdate()->format('Y/m/d H:i:s') : '',
                $item->getIdentificationNumber(),
                $item->getFullName(),
                $item->getStatus(),
                $btn,
            );
        }

        return new JsonResponse($data);
    }

    /**
     * @return JsonResponse
     *
     * @Route("/list/productBrand", name="productBrand_list")
     */
    public function productBrandListAction()
    {
        $collection = $this->getDoctrine()->getRepository(ProductBrand::class)->findAll();

        $data = array('data' => array());

        /** @var ProductBrand $item */
        foreach ($collection as $item) {

            $parameters = array(
                'suffix' => 'Marca',
                'actions' => array('show', 'edit', 'delete'),
                'path' => $this->generateUrl('mjmc_crud', array('entityName' => 'ProductBrand', 'id' => $item->getId())),
            );

            $btn = $this->renderView('@App/base/table_btn.html.twig', $parameters);

            $data['data'][] = array(
                $item->getName(),
                $btn,
            );
        }

        return new JsonResponse($data);
    }

    /**
     * @return JsonResponse
     *
     * @Route("/list/productCategory", name="productCategory_list")
     */
    public function productCategoryListAction()
    {
        $collection = $this->getDoctrine()->getRepository(ProductCategory::class)->findAll();

        $data = array('data' => array());

        /** @var ProductCategory $item */
        foreach ($collection as $item) {

            $parameters = array(
                'suffix' => 'Categoria',
                'actions' => array('show', 'edit', 'delete'),
                'path' => $this->generateUrl('mjmc_crud', array('entityName' => 'ProductCategory', 'id' => $item->getId())),
            );

            $btn = $this->renderView('@App/base/table_btn.html.twig', $parameters);

            $data['data'][] = array(
                $item->getName(),
                $btn,
            );
        }

        return new JsonResponse($data);
    }

    /**
     * @return JsonResponse
     *
     * @Route("/list/product", name="product_list")
     */
    public function productListAction()
    {
        $collection = $this->getDoctrine()->getRepository(ProductCategory::class)->findAll();

        $data = array('data' => array());

        /** @var  $item */
        foreach ($collection as $item) {

            $parameters = array(
                'suffix' => 'Producto',
                'actions' => array('show', 'edit', 'delete'),
                'path' => $this->generateUrl('mjmc_crud', array('entityName' => 'Product', 'id' => $item->getId())),
            );

            $btn = $this->renderView('@App/base/table_btn.html.twig', $parameters);

            $data['data'][] = array(
                $item->getName(),
                $item->getName(),
                $item->getName(),
                $btn,
            );
        }

        return new JsonResponse($data);
    }
}
