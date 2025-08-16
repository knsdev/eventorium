<?php

namespace App\Entity;

use App\Repository\AddressRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AddressRepository::class)]
class Address
{
  #[ORM\Id]
  #[ORM\GeneratedValue]
  #[ORM\Column]
  private ?int $id = null;

  #[ORM\Column(length: 100)]
  private ?string $streetName = null;

  #[ORM\Column(length: 5)]
  private ?string $streetNumber = null;

  #[ORM\Column(length: 5)]
  private ?string $zipCode = null;

  #[ORM\Column(length: 100)]
  private ?string $cityName = null;

  #[ORM\Column(length: 100)]
  private ?string $countryName = null;

  #[ORM\Column(length: 100, nullable: true)]
  private ?string $locationName = null;

  public function getId(): ?int
  {
    return $this->id;
  }

  public function getStreetName(): ?string
  {
    return $this->streetName;
  }

  public function setStreetName(string $streetName): static
  {
    $this->streetName = $streetName;

    return $this;
  }

  public function getStreetNumber(): ?string
  {
    return $this->streetNumber;
  }

  public function setStreetNumber(string $streetNumber): static
  {
    $this->streetNumber = $streetNumber;

    return $this;
  }

  public function getZipCode(): ?string
  {
    return $this->zipCode;
  }

  public function setZipCode(string $zipCode): static
  {
    $this->zipCode = $zipCode;

    return $this;
  }

  public function getCityName(): ?string
  {
    return $this->cityName;
  }

  public function setCityName(string $cityName): static
  {
    $this->cityName = $cityName;

    return $this;
  }

  public function getCountryName(): ?string
  {
    return $this->countryName;
  }

  public function setCountryName(string $countryName): static
  {
    $this->countryName = $countryName;

    return $this;
  }

  public function getLocationName(): ?string
  {
    return $this->locationName;
  }

  public function setLocationName(?string $locationName): static
  {
    $this->locationName = $locationName;

    return $this;
  }
}
