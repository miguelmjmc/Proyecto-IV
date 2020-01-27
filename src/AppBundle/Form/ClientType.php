<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ClientType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('identificationNumber', null, array('disabled' => true))
            ->add('name', null, array('disabled' => true))
            ->add('lastName', null, array('disabled' => true))
            ->add('address', TextareaType::class, array('disabled' => true))
            ->add('email', EmailType::class, array('disabled' => true))
            ->add('phone', null, array('disabled' => true))
            ->add(
                'disabled',
                ChoiceType::class,
                array('label' => 'Status', 'choices' => array('Enabled' => false, 'Disabled' => true))
            )
            ->add('comment', TextareaType::class)
        ;
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Client'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_client';
    }
}
