<?php

namespace App\Form;

use App\Entity\Address;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints as Assert;

class AddressType extends AbstractType
{
  public function buildForm(FormBuilderInterface $builder, array $options): void
  {
    $fieldOptionsDefault = [
      'attr' => ['class' => 'form-control mb-3'],
      'label_attr' => ['class' => 'form-label'],
    ];

    $builder
      ->add('locationName', TextType::class, $fieldOptionsDefault)
      ->add('streetName', TextType::class, $fieldOptionsDefault)
      ->add(
        'streetNumber',
        IntegerType::class,
        array_merge(
          $fieldOptionsDefault,
          [
            'constraints' => [
              new Assert\Length([
                'max' => 5,
                'maxMessage' => 'Street number cannot be longer than 5 digits.',
              ]),
              new Assert\GreaterThanOrEqual([
                'value' => 0,
                'message' => 'Street number must be greater than or equal to zero.',
              ]),
            ]
          ]
        )
      )
      ->add('zipCode', TextType::class, array_merge($fieldOptionsDefault, [
        'constraints' => [
          new Assert\Length([
            'max' => 5,
            'maxMessage' => 'Zip code cannot be longer than 5 digits.',
          ]),
          new Assert\Type([
            'type' => 'digit',
            'message' => 'Zip code must contain only numbers.',
          ]),
        ],
      ]))
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
