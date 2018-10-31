<?php
// src/Controller/LuckyController.php
namespace App\Controller;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use App\Entity\TUser;



class LuckyController
{
     
    public function number(ObjectManager $manager,UserPasswordEncoderInterface $encoder)
    {
       
        $number = random_int(0, 100);
         

         $oObject = new TUser();
         $oObject->lgUserId = "478";
         $oObject->setStrLogin("admin1"); 
       
         $oObject->setStrPassword($encoder->encodePassword($oObject, "0000")); 
         $manager->persist($oObject);

        $manager->flush();


        return new Response(
            '<html><body>Lucky number: '.$number.'</body></html>'
        );
    }
}