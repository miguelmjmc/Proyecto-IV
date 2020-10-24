<?php

namespace AppBundle\Controller;

use AppBundle\Entity\CurrencyConversion;
use AppBundle\Entity\OperationLog;
use AppBundle\Entity\Product;
use AppBundle\Entity\ProductBrand;
use AppBundle\Entity\ProductCategory;
use AppBundle\Entity\Reservation;
use AppBundle\Entity\SessionLog;
use AppBundle\Entity\User;
use AppBundle\Entity\Vehicle;
use AppBundle\Entity\VehicleBrand;
use AppBundle\Entity\VehicleCategory;
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
     * @Route("/list/reservation", name="reservation_list")
     */
    public function reservationListAction()
    {
        $collection = $this->getDoctrine()->getRepository(Reservation::class)->findAll();

        $data = array('data' => array());

        /** @var Reservation $item */
        foreach ($collection as $item) {

            $parameters = array(
                'suffix' => 'Reservación',
                'actions' => array('show', 'edit'),
                'path' => $this->generateUrl('mjmc_crud', array('entityName' => 'Reservation', 'id' => $item->getId())),
            );

            $btn = $this->renderView('@App/base/table_btn.html.twig', $parameters);

            $data['data'][] = array(
                $item->getLastUpdate() instanceof \DateTime ? $item->getLastUpdate()->format('Y/m/d H:i:s') : '',
                $item->getName(),
                $item->getEmail(),
                $item->getPhone(),
                '$'.number_format($item->getAmount(), 2, ',', '.'),
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
                'suffix' => 'Categoría',
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
        $collection = $this->getDoctrine()->getRepository(Product::class)->findAll();

        $data = array('data' => array());

        /** @var Product $item */
        foreach ($collection as $item) {

            $parameters = array(
                'suffix' => 'Producto',
                'actions' => array('show', 'edit', 'delete'),
                'path' => $this->generateUrl('mjmc_crud', array('entityName' => 'Product', 'id' => $item->getId())),
            );

            $btn = $this->renderView('@App/base/table_btn.html.twig', $parameters);

            $data['data'][] = array(
                $item->getLastUpdate() instanceof \DateTime ? $item->getLastUpdate()->format('Y/m/d H:i:s') : '',
                $item->getCode(),
                $item->getDescription(),
                $item->getProductBrand()->getName(),
                '$'.number_format($item->getPrice(), 2, ',', '.'),
                $item->getStock(),
                $btn,
            );
        }

        return new JsonResponse($data);
    }

    /**
     * @return JsonResponse
     *
     * @Route("/list/vehicleCategory", name="vehicleCategory_list")
     */
    public function vehicleCategoryListAction()
    {
        $collection = $this->getDoctrine()->getRepository(VehicleCategory::class)->findAll();

        $data = array('data' => array());

        /** @var VehicleCategory $item */
        foreach ($collection as $item) {

            $parameters = array(
                'suffix' => 'Categoría',
                'actions' => array('show', 'edit', 'delete'),
                'path' => $this->generateUrl('mjmc_crud', array('entityName' => 'VehicleCategory', 'id' => $item->getId())),
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
     * @Route("/list/vehicleBrand", name="vehicleBrand_list")
     */
    public function vehicleBrandListAction()
    {
        $collection = $this->getDoctrine()->getRepository(VehicleBrand::class)->findAll();

        $data = array('data' => array());

        /** @var VehicleBrand $item */
        foreach ($collection as $item) {

            $parameters = array(
                'suffix' => 'Marca',
                'actions' => array('show', 'edit', 'delete'),
                'path' => $this->generateUrl('mjmc_crud', array('entityName' => 'VehicleBrand', 'id' => $item->getId())),
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
     * @Route("/list/vehicle", name="vehicle_list")
     */
    public function vehicleListAction()
    {
        $collection = $this->getDoctrine()->getRepository(Vehicle::class)->findAll();

        $data = array('data' => array());

        /** @var Vehicle $item */
        foreach ($collection as $item) {

            $parameters = array(
                'suffix' => 'Vehículo',
                'actions' => array('show', 'edit', 'delete'),
                'path' => $this->generateUrl('mjmc_crud', array('entityName' => 'Vehicle', 'id' => $item->getId())),
            );

            $btn = $this->renderView('@App/base/table_btn.html.twig', $parameters);

            $data['data'][] = array(
                $item->getLastUpdate() instanceof \DateTime ? $item->getLastUpdate()->format('Y/m/d H:i:s') : '',
                $item->getName(),
                $item->getVehicleBrand()->getName(),
                $item->getSeries(),
                $item->getVehicleCategory()->getName(),
                $btn,
            );
        }

        return new JsonResponse($data);
    }

    /**
     * @return JsonResponse
     *
     * @Route("/list/currencyConversion", name="currencyConversion_list")
     */
    public function currencyConversionAction()
    {
        $collection = $this->getDoctrine()->getRepository(CurrencyConversion::class)->findAll();

        $data = array('data' => array());

        /** @var CurrencyConversion $item */
        foreach ($collection as $item) {

            $parameters = array(
                'suffix' => 'Conversion de Moneda',
                'actions' => array('show'),
                'path' => $this->generateUrl('mjmc_crud', array('entityName' => 'CurrencyConversion', 'id' => $item->getId())),
            );

            $btn = $this->renderView('@App/base/table_btn.html.twig', $parameters);

            $data['data'][] = array(
                $item->getLastUpdate() instanceof \DateTime ? $item->getLastUpdate()->format('Y/m/d H:i:s') : '',
                number_format($item->getDollarValue(), 2, ',', '.').' Bs',
                number_format($item->getEuroValue(), 2, ',', '.').' Bs',
                $btn,
            );
        }

        return new JsonResponse($data);
    }
}
