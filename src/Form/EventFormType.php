<?php

namespace App\Form;

use App\Entity\Address;
use App\Entity\Event;
use App\Entity\EventType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Translation\TranslatableMessage;

class EventFormType extends AbstractType
{
  public function buildForm(FormBuilderInterface $builder, array $options): void
  {
    $fieldOptionsDefault = [
      'attr' => ['class' => 'form-control'],
      'label_attr' => ['class' => 'form-label'],
    ];

    $builder
      ->add('name', null, $fieldOptionsDefault)
      ->add('description', null, $fieldOptionsDefault)
      ->add('startTime', null, $fieldOptionsDefault)
      ->add('endTime', null, $fieldOptionsDefault)
      ->add('image', null, $fieldOptionsDefault)
      ->add('capacity', null, $fieldOptionsDefault)
      ->add('contactEmail', null, $fieldOptionsDefault)
      ->add('contactPhoneNumber', null, $fieldOptionsDefault)
      ->add('url', null, $fieldOptionsDefault)
      ->add('address', AddressType::class) // embedded form AddressType
      ->add('type', EntityType::class, [
        'class' => EventType::class,
        'choice_label' => 'name',
        'attr' => ['class' => 'form-control'],
        'label_attr' => ['class' => 'form-label']
      ])
    ;
  }

  public function configureOptions(OptionsResolver $resolver): void
  {
    $resolver->setDefaults([
      'data_class' => Event::class,
    ]);
  }
}
