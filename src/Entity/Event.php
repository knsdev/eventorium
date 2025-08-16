<?php

namespace App\Entity;

use App\Repository\EventRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: EventRepository::class)]
class Event
{
  #[ORM\Id]
  #[ORM\GeneratedValue]
  #[ORM\Column]
  private ?int $id = null;

  #[ORM\Column(length: 100)]
  private ?string $name = null;

  #[ORM\Column]
  private ?\DateTime $startTime = null;

  #[ORM\Column(length: 255, nullable: true)]
  private ?string $image = null;

  #[ORM\Column]
  private ?int $capacity = null;

  #[ORM\Column(length: 100)]
  private ?string $contactEmail = null;

  #[ORM\Column(length: 50, nullable: true)]
  private ?string $contactPhoneNumber = null;

  #[ORM\Column(length: 255)]
  private ?string $url = null;

  #[ORM\ManyToOne]
  #[ORM\JoinColumn(nullable: true, onDelete: "SET NULL")]
  private ?Address $address = null;

  #[ORM\ManyToOne]
  #[ORM\JoinColumn(nullable: true, onDelete: "SET NULL")]
  private ?EventType $type = null;

  #[ORM\Column(type: Types::TEXT)]
  private ?string $description = null;

  #[ORM\Column]
  private ?\DateTime $endTime = null;

  public function getId(): ?int
  {
    return $this->id;
  }

  public function getName(): ?string
  {
    return $this->name;
  }

  public function setName(string $name): static
  {
    $this->name = $name;

    return $this;
  }

  public function getStartTime(): ?\DateTime
  {
    return $this->startTime;
  }

  public function setStartTime(\DateTime $startTime): static
  {
    $this->startTime = $startTime;

    return $this;
  }

  public function getImage(): ?string
  {
    return $this->image;
  }

  public function setImage(?string $image): static
  {
    $this->image = $image;

    return $this;
  }

  public function getCapacity(): ?int
  {
    return $this->capacity;
  }

  public function setCapacity(int $capacity): static
  {
    $this->capacity = $capacity;

    return $this;
  }

  public function getContactEmail(): ?string
  {
    return $this->contactEmail;
  }

  public function setContactEmail(string $contactEmail): static
  {
    $this->contactEmail = $contactEmail;

    return $this;
  }

  public function getContactPhoneNumber(): ?string
  {
    return $this->contactPhoneNumber;
  }

  public function setContactPhoneNumber(?string $contactPhoneNumber): static
  {
    $this->contactPhoneNumber = $contactPhoneNumber;

    return $this;
  }

  public function getUrl(): ?string
  {
    return $this->url;
  }

  public function setUrl(string $url): static
  {
    $this->url = $url;

    return $this;
  }

  public function getAddress(): ?Address
  {
    return $this->address;
  }

  public function setAddress(?Address $address): static
  {
    $this->address = $address;

    return $this;
  }

  public function getType(): ?EventType
  {
    return $this->type;
  }

  public function setType(?EventType $type): static
  {
    $this->type = $type;

    return $this;
  }

  public function getDescription(): ?string
  {
    return $this->description;
  }

  public function setDescription(string $description): static
  {
    $this->description = $description;

    return $this;
  }

  public function getEndTime(): ?\DateTime
  {
    return $this->endTime;
  }

  public function setEndTime(\DateTime $endTime): static
  {
    $this->endTime = $endTime;

    return $this;
  }
}
