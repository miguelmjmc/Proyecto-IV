<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CurrencyConversionType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add(
                'dollarValue',
                null,
                array(
                    'grouping' => true,
                    'scale' => 2,
                    'label' => 'currencyConversion_dollarValue_label',
                    'attr' => array(
                        'placeholder' => 'currencyConversion_dollarValue_placeholder',
                        'title' => 'currencyConversion_dollarValue_title',
                        'class' => 'money',
                    ),
                )
            )
            ->add(
                'euroValue',
                null,
                array(
                    'grouping' => true,
                    'scale' => 2,
                    'label' => 'currencyConversion_euroValue_label',
                    'attr' => array(
                        'placeholder' => 'currencyConversion_euroValue_placeholder',
                        'title' => 'currencyConversion_euroValue_title',
                        'class' => 'money',
                    ),
                )
            );
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(
            array(
                'data_class' => 'AppBundle\Entity\CurrencyConversion',
            )
        );
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_currencyconversion';
    }
}
