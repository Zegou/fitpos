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
use App\Entity\TTypeContenance;
class TypeContenanceController extends Controller
{
    /**
     * @Route("/type/contenance", name="type_contenance")
     */
    public function index()
    {
        $repository = $this->getDoctrine()->getRepository(TMenu::class);
        $TMenus = $repository->findAll();
        return $this->render('type_contenance/index.html.twig', [
            'controller_name' => 'TypeContenanceController',
            'TMenus' => $TMenus

        ]);
    }

    /**
     * @Route("/type/contenance/add", name="contenance_add")
     */
    public function add() {
        $repository = $this->getDoctrine()->getRepository(TMenu::class);
        $TMenus = $repository->findAll();

        $repositoryTLanguage = $this->getDoctrine()->getRepository(TLanguage::class);
        $TLanguage = $repositoryTLanguage->findAll();


        $repositoryTTypeRecette = $this->getDoctrine()->getRepository(TTypeContenance::class);
        $TRole = $repositoryTTypeRecette->findAll();
        return $this->render('type_contenance/formadd.html.twig', [
            'controller_name' => 'TypeContenanceController',
            'TMenus' => $TMenus,
            'TTypeContenance' => new TTypeContenance()
        ]);
    }
    /**
     * @Route("/type/contenance/delete", name="contenance_delete")
     */
    public function delete(Request $request, ObjectManager $manager) {
        $repository = $this->getDoctrine()->getRepository(TMenu::class);
        $TMenus = $repository->findAll();

        $repositoryTTypeContenance = $this->getDoctrine()->getRepository(TTypeContenance::class);
        $TTypeContenance = $repositoryTTypeContenance->find($request->query->get('ID'));
        $manager->remove($TTypeContenance);
        $manager->flush();  $message ="Supression éffectué avec Succès";
        return $this->redirect('/type/contenance');
        // redirects to the "homepage" route

        /*
          $this->render('usermanager/form.html.twig', [
          'controller_name' => 'TypeDepenseController',
          'TMenus' => $TMenus
          ]); */
    }

    /**
     * @Route("/type/contenance/edit", name="contenance_edit")
     */
    public function edit(Request $request) {
        $repository = $this->getDoctrine()->getRepository(TMenu::class);
        $TMenus = $repository->findAll();


        $repositoryTUser = $this->getDoctrine()->getRepository(TUser::class);
        $TUser = $repositoryTUser->find($request->query->get('ID'));

        $repositoryTLanguage = $this->getDoctrine()->getRepository(TLanguage::class);
        $TLanguage = $repositoryTLanguage->findAll();


        $repositoryTRole = $this->getDoctrine()->getRepository(TTypeContenance::class);
        $TRole = $repositoryTRole->findAll();


        $repositoryTTypeDepense = $this->getDoctrine()->getRepository(TTypeContenance::class);
        $TTypeContenance = $repositoryTTypeDepense->find($request->query->get('ID'));
        //$advert = $repository->find(5);
        return $this->render('type_contenance/form.html.twig', [
            'controller_name' => 'TypeContenanceController',
            'TMenus' => $TMenus,
            'TUser' => $TUser,
            'TLanguage' => $TLanguage,
            'TRole'=>$TRole,
            'TTypeContenance'=>$TTypeContenance
        ]);
    }


    /**
     * @Route("/api/contenance/list.json", name="api.contenance.typecontenancelist")
     */
    public function getcontenancelist() {

        $repository = $this->getDoctrine()->getRepository(TTypeContenance::class);
        $TTypeContenance = $repository->findAll();
        $serializer = $this->get('serializer');
        $response = $serializer->serialize($TTypeContenance, 'json');
        return new Response(
            '{ "aaData": ' . $response . '}'
        );
    }
}
