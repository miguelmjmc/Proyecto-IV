<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class VehicleType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add(
                'name',
                null,
                array(
                    'label' => 'vehicle_name_label',
                    'attr' => array(
                        'placeholder' => 'vehicle_name_placeholder',
                        'title' => 'vehicle_name_title',
                    ),
                )
            )
            ->add(
                'vehicleBrand',
                null,
                array(
                    'choice_label' => 'name',
                    'label' => 'vehicle_vehicleBrand_label',
                    'placeholder' => 'vehicle_vehicleBrand_placeholder',
                    'attr' => array(
                        'title' => 'vehicle_vehicleBrand_title',
                        'class' => 'selectpicker',
                    ),
                )
            )
            ->add(
                'vehicleCategory',
                null,
                array(
                    'choice_label' => 'name',
                    'label' => 'vehicle_vehicleCategory_label',
                    'placeholder' => 'vehicle_vehicleCategory_placeholder',
                    'attr' => array(
                        'title' => 'vehicle_vehicleCategory_title',
                        'class' => 'selectpicker',
                    ),
                )
            )
            ->add(
                'seriesStart',
                null,
                array(
                    'label' => 'vehicle_seriesStart_label',
                    'attr' => array(
                        'placeholder' => 'vehicle_seriesStart_placeholder',
                        'title' => 'vehicle_seriesStart_title',
                    ),
                )
            )
            ->add(
                'seriesEnd',
                null,
                array(
                    'label' => 'vehicle_seriesEnd_label',
                    'attr' => array(
                        'placeholder' => 'vehicle_seriesEnd_placeholder',
                        'title' => 'vehicle_seriesEnd_title',
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
                'data_class' => 'AppBundle\Entity\Vehicle',
            )
        );
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_vehicle';
    }
}
