<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\TMenu;
use App\Entity\TSousMenu;

class HomeController extends Controller
{
    /**
     * @Route("/home", name="home")
     */
    public function index()
    {
        $repository = $this->getDoctrine()->getRepository(TMenu::class);
        $TMenus = $repository->findAll();

        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
            'TMenus' => $TMenus,
        ]);
    }
}
