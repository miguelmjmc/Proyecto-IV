<?php

namespace AppBundle\Controller;

use AppBundle\Entity\CompanySettings;
use AppBundle\Entity\CurrencyConversion;
use AppBundle\Entity\Product;
use AppBundle\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Cookie;
use Symfony\Component\HttpFoundation\RedirectResponse;
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

        $currencyConversion = $entityManager->getRepository(CurrencyConversion::class)->findBy(
            array(),
            array('createdAt' => 'desc'),
            1
        );

        $currencyConversion = isset($currencyConversion[0]) ? $currencyConversion[0] : new CurrencyConversion();

        return $this->render(
            'website/index.html.twig',
            array('companySettings' => $companySettings, 'currencyConversion' => $currencyConversion)
        );
    }

    /**
     * @param  Request  $request
     * @param  int  $slug
     *
     * @return Response
     *
     * @Route("/products/{slug}", defaults={"slug": 1}, name="website_products")
     */
    public function productsAction(Request $request, $slug)
    {
        $entityManager = $this->getDoctrine()->getManager();

        $companySettings = $entityManager->getRepository(CompanySettings::class)->find(1);

        if (!$companySettings instanceof CompanySettings) {
            $companySettings = new CompanySettings();
        }

        $currencyConversion = $entityManager->getRepository(CurrencyConversion::class)->findBy(
            array(),
            array('createdAt' => 'desc'),
            1
        );

        $currencyConversion = isset($currencyConversion[0]) ? $currencyConversion[0] : new CurrencyConversion();

        $options = array(
            'orderBy' => $request->get('orderBy'),
        );

        /** @var ProductRepository $repository */
        $repository = $entityManager->getRepository(Product::class);

        $products = $repository->findAll();

        return $this->render(
            'website/products.html.twig',
            array(
                'companySettings' => $companySettings,
                'currencyConversion' => $currencyConversion,
                'products' => $products,
            )
        );
    }

    /**
     * @param  Product  $product
     *
     * @return Response
     *
     * @Route("/product/{id}", name="website_product")
     */
    public function productAction(Product $product)
    {
        $entityManager = $this->getDoctrine()->getManager();

        $product->setViewCounter($product->getViewCounter() + 1);

        $entityManager->flush();

        $companySettings = $entityManager->getRepository(CompanySettings::class)->find(1);

        if (!$companySettings instanceof CompanySettings) {
            $companySettings = new CompanySettings();
        }

        $currencyConversion = $entityManager->getRepository(CurrencyConversion::class)->findBy(
            array(),
            array('createdAt' => 'desc'),
            1
        );

        $currencyConversion = isset($currencyConversion[0]) ? $currencyConversion[0] : new CurrencyConversion();

        $products = $entityManager->getRepository(Product::class)->findBy(array(), array('viewCounter' => 'desc'), 8);

        return $this->render(
            'website/product.html.twig',
            array(
                'companySettings' => $companySettings,
                'currencyConversion' => $currencyConversion,
                'product' => $product,
                'products' => $products,
            )
        );
    }

    /**
     * @param  Request  $request
     *
     * @return Response
     *
     * @Route("/cart", name="website_cart")
     */
    public function cartAction(Request $request)
    {
        $entityManager = $this->getDoctrine()->getManager();

        $companySettings = $entityManager->getRepository(CompanySettings::class)->find(1);

        if (!$companySettings instanceof CompanySettings) {
            $companySettings = new CompanySettings();
        }

        $currencyConversion = $entityManager->getRepository(CurrencyConversion::class)->findBy(
            array(),
            array('createdAt' => 'desc'),
            1
        );

        $currencyConversion = isset($currencyConversion[0]) ? $currencyConversion[0] : new CurrencyConversion();

        $products = array();
        $quantity = array();

        if ($request->cookies->get('cart')) {
            $cart = json_decode($request->cookies->get('cart'), true);

            foreach ($cart as $item) {
                if (!isset($quantity[$item])) {
                    $quantity[$item] = 1;
                    $products[] = $entityManager->getRepository(Product::class)->find($item);
                } else {
                    $quantity[$item]++;
                }
            }
        }

        return $this->render(
            'website/cart.html.twig',
            array(
                'quantity' => $quantity,
                'products' => $products,
                'companySettings' => $companySettings,
                'currencyConversion' => $currencyConversion,
            )
        );
    }

    /**
     * @param  Request  $request
     * @param  Product  $product
     *
     * @return Response
     *
     * @Route("/cart/addProduct/{id}", name="website_cart_addProduct")
     */
    public function cartAddProductAction(Request $request, Product $product)
    {
        if ($request->cookies->get('cart')) {
            $cart = json_decode($request->cookies->get('cart'), true);
        } else {
            $cart = array();
        }

        $cart[] = $product->getId();

        $cookie = new Cookie('cart', json_encode($cart));

        $response = new RedirectResponse($this->generateUrl('website_cart'));
        $response->headers->clearCookie('cart');
        $response->headers->setCookie($cookie);

        return $response;
    }

    /**
     * @param  Request  $request
     * @param  Product  $product
     *
     * @return Response
     *
     * @Route("/cart/removeProduct/{id}", name="website_cart_removeProduct")
     */
    public function cartRemoveProductAction(Request $request, Product $product)
    {
        if ($request->cookies->get('cart')) {
            $cart = json_decode($request->cookies->get('cart'), true);
        } else {
            $cart = array();
        }

        foreach ($cart as $key => $item) {
            if ($product->getId() === $item) {
                unset($cart[$key]);

                break;
            }
        }

        $cookie = new Cookie('cart', json_encode($cart));

        $response = new RedirectResponse($this->generateUrl('website_cart'));
        $response->headers->clearCookie('cart');
        $response->headers->setCookie($cookie);

        return $response;
    }

    /**
     * @param  Request  $request
     *
     * @return Response
     *
     * @Route("/system/checkout", name="website_checkout")
     */
    public function checkoutAction(Request $request)
    {
        $entityManager = $this->getDoctrine()->getManager();

        $companySettings = $entityManager->getRepository(CompanySettings::class)->find(1);

        if (!$companySettings instanceof CompanySettings) {
            $companySettings = new CompanySettings();
        }

        $currencyConversion = $entityManager->getRepository(CurrencyConversion::class)->findBy(
            array(),
            array('createdAt' => 'desc'),
            1
        );

        $currencyConversion = isset($currencyConversion[0]) ? $currencyConversion[0] : new CurrencyConversion();

        return $this->render(
            'website/checkout.html.twig',
            array('companySettings' => $companySettings, 'currencyConversion' => $currencyConversion)
        );
    }
}
