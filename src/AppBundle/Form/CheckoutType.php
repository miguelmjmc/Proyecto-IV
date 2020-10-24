<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\NotBlank;

class CheckoutType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name',
                null,
                array(
                    'label' => 'checkout_name_label',
                    'constraints' => array(
                        new NotBlank(),
                    ),
                    'attr' => array(
                        'placeholder' => 'checkout_name_placeholder',
                        'title' => 'checkout_name_title',
                    ),
                ))
            ->add(
                'email',
                EmailType::class,
                array(
                    'label' => 'checkout_email_label',
                    'constraints' => array(
                        new NotBlank(),
                    ),
                    'attr' => array(
                        'placeholder' => 'checkout_email_placeholder',
                        'title' => 'checkout_email_title',
                    ),
                )
            )
            ->add(
                'phone',
                null,
                array(
                    'label' => 'checkout_phone_label',
                    'constraints' => array(
                        new NotBlank(),
                    ),
                    'attr' => array(
                        'placeholder' => 'checkout_phone_placeholder',
                        'title' => 'checkout_phone_title',
                        'class' => 'phone',
                    ),
                )
            )
            ->add('submit', SubmitType::class, array('label' => 'checkout_submit', 'attr' => array('class' => 'btn btn-primary')))
        ;
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Reservation'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_checkout';
    }
}
