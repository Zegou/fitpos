<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;

class MenumanagerController extends Controller
{
    /**
     * @Route("/menumanager", name="menumanager")
     */
    public function index()
    {
        return $this->render('menumanager/index.html.twig', [
            'controller_name' => 'MenumanagerController',
        ]);
    }
}
