<?php

namespace App\Form;

use App\Entity\EventType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EventTypeFormType extends AbstractType
{
  public function buildForm(FormBuilderInterface $builder, array $options): void
  {
    $fieldOptionsDefault = [
      'attr' => ['class' => 'form-control'],
      'label_attr' => ['class' => 'form-label'],
    ];

    $builder
      ->add('name', null, $fieldOptionsDefault);
  }

  public function configureOptions(OptionsResolver $resolver): void
  {
    $resolver->setDefaults([
      'data_class' => EventType::class,
    ]);
  }
}
