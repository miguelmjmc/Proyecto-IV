<?php

namespace AppBundle\Form;

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
            ->add('code')
            ->add('description')
            ->add('productBrand', null, array('choice_label' => 'name', 'placeholder' => 'Select', 'attr' => array('class' => 'selectpicker')))
            ->add('productCategory', null, array('choice_label' => 'name', 'placeholder' => 'Select', 'attr' => array('class' => 'selectpicker')))
            ->add('vehicle', null, array('choice_label' => 'fullName', 'placeholder' => 'Select', 'attr' => array('class' => 'selectpicker')))
            ->add('price', null, array('attr' => array('class' => 'money')))
            ->add('stock')
            ->add('comment')
        ;
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Product'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_product';
    }
}
