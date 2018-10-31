<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\TMenu;

class StepbyStepController extends Controller
{
    /**
     * @Route("/stepby/step", name="stepby_step")
     */
    public function index()
    {     $repository = $this->getDoctrine()->getRepository(TMenu::class);
        $TMenus = $repository->findAll();
        return $this->render('stepby_step/index.html.twig', [
            'controller_name' => 'StepbyStepController',
            'TMenus' => $TMenus
        ]);
    }
}
