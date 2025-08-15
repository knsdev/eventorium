<?php

namespace App\Form;

use App\Entity\Address;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AddressType extends AbstractType
{
  public function buildForm(FormBuilderInterface $builder, array $options): void
  {
    $fieldOptionsDefault = [
      'attr' => ['class' => 'form-control'],
      'label_attr' => ['class' => 'form-label'],
    ];

    $builder
      ->add('locationName', TextType::class, $fieldOptionsDefault)
      ->add('streetName', TextType::class, $fieldOptionsDefault)
      ->add('streetNumber', IntegerType::class, $fieldOptionsDefault)
      ->add('zipCode', IntegerType::class, $fieldOptionsDefault)
      ->add('cityName', TextType::class, $fieldOptionsDefault)
      ->add('countryName', TextType::class, $fieldOptionsDefault)
    ;
  }

  public function configureOptions(OptionsResolver $resolver): void
  {
    $resolver->setDefaults([
      'data_class' => Address::class,
    ]);
  }
}
