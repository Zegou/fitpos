<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\TMenu;
use App\Entity\TLanguage;
use Symfony\Component\HttpFoundation\Response;
use App\Entity\TUser;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use App\Entity\TTypeDepense;

class TypeDepenseController extends Controller
{
    /**
     * @Route("/type/depense", name="type_depense")
     */
    public function index()
    {
        $repository = $this->getDoctrine()->getRepository(TMenu::class);
        $TMenus = $repository->findAll();
        return $this->render('type_depense/index.html.twig', [
            'controller_name' => 'TypeDepenseController',
            'TMenus' => $TMenus
        ]);
    }
    /**
     * @Route("/type/depense/add", name="depense_add")
     */
    public function add() {
        $repository = $this->getDoctrine()->getRepository(TMenu::class);
        $TMenus = $repository->findAll();

        $repositoryTLanguage = $this->getDoctrine()->getRepository(TLanguage::class);
        $TLanguage = $repositoryTLanguage->findAll();


        $repositoryTTypeRecette = $this->getDoctrine()->getRepository(TTypeDepense::class);
        $TRole = $repositoryTTypeRecette->findAll();
        return $this->render('type_depense/formadd.html.twig', [
            'controller_name' => 'TypeDepenseController',
            'TMenus' => $TMenus,
            'TypeDepense' => new TTypeDepense()
        ]);
    }

    /**
     * @Route("/type/depense/edit", name="depense_edit")
     */
    public function edit(Request $request) {
        $repository = $this->getDoctrine()->getRepository(TMenu::class);
        $TMenus = $repository->findAll();


        $repositoryTUser = $this->getDoctrine()->getRepository(TUser::class);
        $TUser = $repositoryTUser->find($request->query->get('ID'));

        $repositoryTLanguage = $this->getDoctrine()->getRepository(TLanguage::class);
        $TLanguage = $repositoryTLanguage->findAll();


        $repositoryTRole = $this->getDoctrine()->getRepository(TTypeDepense::class);
        $TRole = $repositoryTRole->findAll();


        $repositoryTTypeDepense = $this->getDoctrine()->getRepository(TTypeDepense::class);
        $TypeDepense = $repositoryTTypeDepense->find($request->query->get('ID'));
        //$advert = $repository->find(5);
        return $this->render('type_depense/form.html.twig', [
            'controller_name' => 'TypeDepenseController',
            'TMenus' => $TMenus,
            'TUser' => $TUser,
            'TLanguage' => $TLanguage,
            'TRole'=>$TRole,
            'TypeDepense'=>$TypeDepense
        ]);
    }
    /**
     * @Route("/type/depense/delete", name="depense_delete")
     */
    public function delete(Request $request, ObjectManager $manager) {
        $repository = $this->getDoctrine()->getRepository(TMenu::class);
        $TMenus = $repository->findAll();

        $repositoryTDepenses = $this->getDoctrine()->getRepository(TTypeDepense::class);
        $TDepenses = $repositoryTDepenses->find($request->query->get('ID'));
        $manager->remove($TDepenses);
        $manager->flush();  $message ="Supression éffectué avec Succès";
        return $this->redirect('/type/depense');
         // redirects to the "homepage" route

        /*
          $this->render('usermanager/form.html.twig', [
          'controller_name' => 'TypeDepenseController',
          'TMenus' => $TMenus
          ]); */
    }
    /**
     * @Route("/api/depense/list.json", name="api.depense.typedepenselist")
     */
    public function getdepenselist() {

        $repository = $this->getDoctrine()->getRepository(TTypeDepense::class);
        $TDepenses = $repository->findAll();
        $serializer = $this->get('serializer');
        $response = $serializer->serialize($TDepenses, 'json');
        return new Response(
            '{ "aaData": ' . $response . '}'
        );
    }
}
