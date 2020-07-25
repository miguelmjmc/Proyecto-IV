<?php

namespace AppBundle\Form;

use AppBundle\Form\Events\UploadFileSubscriber;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProductBrandType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add(
            'name',
            null,
            array(
                'label' => 'productBrand_name_label',
                'attr' => array(
                    'placeholder' => 'productBrand_name_placeholder',
                    'title' => 'productBrand_name_title',
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
                'data_class' => 'AppBundle\Entity\ProductBrand',
            )
        );
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_productbrand';
    }
}
