<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;

class TvaController extends Controller
{
    /**
     * @Route("/tva", name="tva")
     */
    public function index()
    {
        return $this->render('tva/index.html.twig', [
            'controller_name' => 'TvaController',
        ]);
    }
}
