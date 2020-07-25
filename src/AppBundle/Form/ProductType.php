<?php

namespace AppBundle\Form;

use AppBundle\Form\Events\UploadFileSubscriber;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProductType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add(
                'code',
                null,
                array(
                    'label' => 'product_code_label',
                    'attr' => array(
                        'placeholder' => 'product_code_placeholder',
                        'title' => 'product_code_title',
                    ),
                )
            )
            ->add(
                'description',
                null,
                array(
                    'label' => 'product_description_label',
                    'attr' => array(
                        'placeholder' => 'product_description_placeholder',
                        'title' => 'product_description_title',
                    ),
                )
            )
            ->add(
                'productBrand',
                null,
                array(
                    'choice_label' => 'name',
                    'label' => 'product_productBrand_label',
                    'placeholder' => 'product_productBrand_placeholder',
                    'attr' => array(
                        'title' => 'product_productBrand_title',
                        'class' => 'selectpicker',
                    ),
                )
            )
            ->add(
                'productCategory',
                null,
                array(
                    'choice_label' => 'name',
                    'label' => 'product_productCategory_label',
                    'attr' => array(
                        'title' => 'product_productCategory_title',
                        'class' => 'selectpicker',
                    ),
                )
            )
            ->add(
                'vehicle',
                null,
                array(
                    'choice_label' => 'fullName',
                    'label' => 'product_vehicle_label',
                    'attr' => array(
                        'title' => 'product_vehicle_title',
                        'class' => 'selectpicker',
                    ),
                )
            )
            ->add(
                'price',
                null,
                array(
                    'grouping' => true,
                    'scale' => 2,
                    'label' => 'product_price_label',
                    'attr' => array(
                        'placeholder' => 'product_price_placeholder',
                        'title' => 'product_price_title',
                        'class' => 'money',
                    ),
                )
            )
            ->add(
                'stock',
                null,
                array(
                    'grouping' => true,
                    'label' => 'product_stock_label',
                    'attr' => array(
                        'placeholder' => 'product_stock_placeholder',
                        'title' => 'product_stock_title',
                    ),
                )
            )
            ->add(
                'comment',
                null,
                array(
                    'label' => 'product_comment_label',
                    'attr' => array(
                        'placeholder' => 'product_comment_placeholder',
                        'title' => 'product_comment_title',
                        'class' => 'summernote'
                    ),
                )
            );

        $builder->addEventSubscriber(new UploadFileSubscriber());
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(
            array(
                'data_class' => 'AppBundle\Entity\Product',
            )
        );
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_product';
    }
}
