<?php

namespace AppBundle\Form;

use AppBundle\Form\Events\UploadFileSubscriber;
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
            ->add(
                'identificationNumber',
                null,
                array(
                    'label' => 'companySettings_identificationNumber_label',
                    'attr' => array(
                        'placeholder' => 'companySettings_identificationNumber_placeholder',
                        'title' => 'companySettings_identificationNumber_title',
                        'class' => 'rif',
                    ),
                )
            )
            ->add(
                'name',
                null,
                array(
                    'label' => 'companySettings_name_label',
                    'attr' => array(
                        'placeholder' => 'companySettings_name_placeholder',
                        'title' => 'companySettings_name_title',
                    ),
                )
            )
            ->add(
                'slogan',
                null,
                array(
                    'label' => 'companySettings_slogan_label',
                    'attr' => array(
                        'placeholder' => 'companySettings_slogan_placeholder',
                        'title' => 'companySettings_slogan_title',
                    ),
                )
            )
            ->add(
                'address',
                TextareaType::class,
                array(
                    'label' => 'companySettings_address_label',
                    'attr' => array(
                        'placeholder' => 'companySettings_address_placeholder',
                        'title' => 'companySettings_address_title',
                    ),
                )
            )
            ->add(
                'latitude',
                null,
                array(
                    'label' => 'companySettings_latitude_label',
                    'attr' => array(
                        'placeholder' => 'companySettings_latitude_placeholder',
                        'title' => 'companySettings_latitude_title',
                        'class' => 'latitude',
                    ),
                )
            )
            ->add(
                'longitude',
                null,
                array(
                    'label' => 'companySettings_longitude_label',
                    'attr' => array(
                        'placeholder' => 'companySettings_longitude_placeholder',
                        'title' => 'companySettings_longitude_title',
                        'class' => 'longitude',
                    ),
                )
            )
            ->add(
                'email',
                EmailType::class,
                array(
                    'label' => 'companySettings_email_label',
                    'attr' => array(
                        'placeholder' => 'companySettings_email_placeholder',
                        'title' => 'companySettings_email_title',
                    ),
                )
            )
            ->add(
                'phone1',
                null,
                array(
                    'label' => 'companySettings_phone1_label',
                    'attr' => array(
                        'placeholder' => 'companySettings_phone1_placeholder',
                        'title' => 'companySettings_phone1_title',
                        'class' => 'phone',
                    ),
                )
            )
            ->add(
                'phone2',
                null,
                array(
                    'label' => 'companySettings_phone2_label',
                    'attr' => array(
                        'placeholder' => 'companySettings_phone2_placeholder',
                        'title' => 'companySettings_phone2_title',
                        'class' => 'phone',
                    ),
                )
            )
            ->add(
                'facebook',
                null,
                array(
                    'label' => 'companySettings_facebook_label',
                    'attr' => array(
                        'placeholder' => 'companySettings_facebook_placeholder',
                        'title' => 'companySettings_facebook_title',
                    ),
                )
            )
            ->add(
                'twitter',
                null,
                array(
                    'label' => 'companySettings_twitter_label',
                    'attr' => array(
                        'placeholder' => 'companySettings_twitter_placeholder',
                        'title' => 'companySettings_twitter_title',
                    ),
                )
            )
            ->add(
                'instagram',
                null,
                array(
                    'label' => 'companySettings_instagram_label',
                    'attr' => array(
                        'placeholder' => 'companySettings_instagram_placeholder',
                        'title' => 'companySettings_instagram_title',
                    ),
                )
            )
            ->add(
                'youtube',
                null,
                array(
                    'label' => 'companySettings_youtube_label',
                    'attr' => array(
                        'placeholder' => 'companySettings_youtube_placeholder',
                        'title' => 'companySettings_youtube_title',
                    ),
                )
            )
            ->add(
                'mission',
                null,
                array(
                    'label' => 'companySettings_mission_label',
                    'attr' => array(
                        'placeholder' => 'companySettings_mission_placeholder',
                        'title' => 'companySettings_mission_title',
                        'class' => 'summernote'
                    ),
                )
            )
            ->add(
                'vision',
                null,
                array(
                    'label' => 'companySettings_vision_label',
                    'attr' => array(
                        'placeholder' => 'companySettings_vision_placeholder',
                        'title' => 'companySettings_vision_title',
                        'class' => 'summernote'
                    ),
                )
            )
            ->add(
                'history',
                null,
                array(
                    'label' => 'companySettings_history_label',
                    'attr' => array(
                        'placeholder' => 'companySettings_history_placeholder',
                        'title' => 'companySettings_history_title',
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
                'data_class' => 'AppBundle\Entity\CompanySettings',
            )
        );
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_companysettings';
    }
}
