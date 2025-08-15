<?php

namespace App\Controller;

use App\Entity\Event;
use App\Form\EventFormType;
use App\Repository\AddressRepository;
use App\Repository\EventRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class EventController extends AbstractController
{
  #[Route('/', name: 'app_event_index', methods: ['GET'])]
  public function index(EventRepository $eventRepository): Response
  {
    return $this->render('event/index.html.twig', [
      'events' => $eventRepository->findAll(),
    ]);
  }

  #[Route('/event/new', name: 'app_event_new', methods: ['GET', 'POST'])]
  public function new(Request $request, EntityManagerInterface $entityManager, AddressRepository $addressRepository): Response
  {
    $event = new Event();
    $form = $this->createForm(EventFormType::class, $event);
    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
      // Prevent insert of duplicate address
      $newAddress = $event->getAddress();
      $existingAddress = $addressRepository->findOneBy(
        [
          'streetName' => $newAddress->getStreetName(),
          'streetNumber' => $newAddress->getStreetNumber(),
          'zipCode' => $newAddress->getZipCode(),
          'cityName' => $newAddress->getCityName(),
          'countryName' => $newAddress->getCountryName()
        ]
      );

      if ($existingAddress) {
        $event->setAddress($existingAddress);
        $newAddress = null;
      }

      $entityManager->persist($event);
      $entityManager->flush();

      return $this->redirectToRoute('app_event_index', [], Response::HTTP_SEE_OTHER);
    }

    return $this->render('event/new.html.twig', [
      'event' => $event,
      'form' => $form,
    ]);
  }

  #[Route('/event/{id}', name: 'app_event_show', methods: ['GET'])]
  public function show(Event $event): Response
  {
    return $this->render('event/show.html.twig', [
      'event' => $event,
    ]);
  }

  #[Route('/event/{id}/edit', name: 'app_event_edit', methods: ['GET', 'POST'])]
  public function edit(Request $request, Event $event, EntityManagerInterface $entityManager): Response
  {
    $form = $this->createForm(EventFormType::class, $event);
    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
      $entityManager->flush();

      return $this->redirectToRoute('app_event_index', [], Response::HTTP_SEE_OTHER);
    }

    return $this->render('event/edit.html.twig', [
      'event' => $event,
      'form' => $form,
    ]);
  }

  #[Route('/event/{id}', name: 'app_event_delete', methods: ['POST'])]
  public function delete(Request $request, Event $event, EntityManagerInterface $entityManager): Response
  {
    if ($this->isCsrfTokenValid('delete' . $event->getId(), $request->getPayload()->getString('_token'))) {
      $entityManager->remove($event);
      $entityManager->flush();
    }

    return $this->redirectToRoute('app_event_index', [], Response::HTTP_SEE_OTHER);
  }
}
