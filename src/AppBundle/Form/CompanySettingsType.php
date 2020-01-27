<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CompanySettingsType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('identificationNumber')
            ->add('name')
            ->add('slogan')
            ->add('address', TextareaType::class)
            ->add('latitude')
            ->add('longitude')
            ->add('email', EmailType::class)
            ->add('phone1')
            ->add('phone2')
            ->add('facebook')
            ->add('twitter')
            ->add('instagram')
            ->add('youtube')
            ->add('whatsapp')
            ->add('telegram')
            ->add('skype')
            ->add('mission')
            ->add('vision')
            ->add('history')
        ;
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\CompanySettings'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_companysettings';
    }
}
