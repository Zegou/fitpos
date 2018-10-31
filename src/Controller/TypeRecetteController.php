<?php

namespace App\Controller;

use App\Entity\TRole;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\TMenu;
use App\Entity\TLanguage;
use Symfony\Component\HttpFoundation\Response;
use App\Entity\TUser;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use App\Entity\TTypeRecette;
class TypeRecetteController extends Controller
{
    /**
     * @Route("/type/recette", name="type_recette")
     */
    public function index()
    {
        $repository = $this->getDoctrine()->getRepository(TMenu::class);
        $TMenus = $repository->findAll();

        return $this->render('type_recette/index.html.twig', [
            'controller_name' => 'TypeRecetteController',
            'TMenus' => $TMenus
        ]);
    }
    /**
     * @Route("/type/recette/edit", name="recette_edit")
     */
    public function edit(Request $request) {
        $repository = $this->getDoctrine()->getRepository(TMenu::class);
        $TMenus = $repository->findAll();


        $repositoryTUser = $this->getDoctrine()->getRepository(TUser::class);
        $TUser = $repositoryTUser->find($request->query->get('ID'));

        $repositoryTLanguage = $this->getDoctrine()->getRepository(TLanguage::class);
        $TLanguage = $repositoryTLanguage->findAll();


        $repositoryTRole = $this->getDoctrine()->getRepository(TRole::class);
        $TRole = $repositoryTRole->findAll();


        $repositoryTTypeRecette = $this->getDoctrine()->getRepository(TTypeRecette::class);
        $TTypeRecette = $repositoryTTypeRecette->find($request->query->get('ID'));
        //$advert = $repository->find(5);
        return $this->render('type_recette/form.html.twig', [
            'controller_name' => 'TypeDepenseController',
            'TMenus' => $TMenus,
            'TUser' => $TUser,
            'TLanguage' => $TLanguage,
            'TRole'=>$TRole,
            'TypeRecette'=>$TTypeRecette
        ]);
    }

    /**


    /**
     * @Route("/type/recette/add", name="recette_add")
     */
    public function add() {
        $repository = $this->getDoctrine()->getRepository(TMenu::class);
        $TMenus = $repository->findAll();

        $repositoryTLanguage = $this->getDoctrine()->getRepository(TLanguage::class);
        $TLanguage = $repositoryTLanguage->findAll();


        $repositoryTTypeRecette = $this->getDoctrine()->getRepository(TTypeRecette::class);
        $TRole = $repositoryTTypeRecette->findAll();
        return $this->render('type_recette/formadd.html.twig', [
            'controller_name' => 'TypeRecetteController',
            'TMenus' => $TMenus,
            'TTypeRecette' => new TTypeRecette()
        ]);
    }

    /**
     * @Route("/type/recette/delete", name="recette_delete")
     */
    public function delete(Request $request, ObjectManager $manager) {
        $repository = $this->getDoctrine()->getRepository(TMenu::class);
        $TMenus = $repository->findAll();

        $repositoryTRecette = $this->getDoctrine()->getRepository(TTypeRecette::class);
        $TRecette = $repositoryTRecette->find($request->query->get('ID'));
        $manager->remove($TRecette);
        $manager->flush();
        //return $this->index();
        return $this->redirect('/type/recette');

        /*
          $this->render('usermanager/form.html.twig', [
          'controller_name' => 'UsermanagerController',
          'TMenus' => $TMenus
          ]); */
    }


    /**
     * @Route("/api/recette/list.json", name="api.recette.typerecettelist")
     */
    public function getrecettelist() {

        $repository = $this->getDoctrine()->getRepository(TTypeRecette::class);
        $TTypeRecette = $repository->findAll();
        $serializer = $this->get('serializer');
        $response = $serializer->serialize($TTypeRecette, 'json');
        return new Response(
            '{ "aaData": ' . $response . '}'
        );
    }

}
