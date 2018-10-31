<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\TMenu;
use App\Entity\TSousMenu;

class DashboardController extends Controller
{
    /**   
     * @Route("/dashboard", name="dashboard")
     */
    public function index()
    {
      $repository = $this->getDoctrine()->getRepository(TMenu::class);
      $TMenus = $repository->findAll();

     //  $repository = $this->getDoctrine()->getRepository(TSousMenu::class);
      // $TSousMenus = $repository->findAll();
       


         return $this->render('dashboard/index.html.twig', array(
                    'controller_name' => 'DashboardController',
                    'TMenus' => $TMenus,
                  //  'TSousMenus' => $TSousMenus,
        ));
    }
    public function recentArticles($max = 3)
    {
        // make a database call or other logic
        // to get the "$max" most recent articles
       /* $articles = ...; 

        return $this->render(
            'dashboard/index.html.twig',
            array('articles' => $articles)
        );*/
    }
}
