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
    $builder
      ->add('name')
      ->add('startTime')
      ->add('image')
      ->add('capacity')
      ->add('contactEmail')
      ->add('contactPhoneNumber')
      ->add('url')
      ->add('address', EntityType::class, [
        'class' => Address::class,
        'choice_label' => function ($choice, string $key, mixed $value): TranslatableMessage|string {
          return $choice->getStreetName()
            . ' '
            . $choice->getStreetNumber()
            . ', '
            . $choice->getZipCode()
            . ' '
            . $choice->getCityName()
            . ', '
            . $choice->getCountryName();
        },
      ])
      ->add('type', EntityType::class, [
        'class' => EventType::class,
        'choice_label' => 'name',
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
