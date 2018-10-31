<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class TUserFixture extends Fixture
{
    private  $encoding; 

    public function _construct(UserPasswordEncoderInterface $encoder){
         $plainPassword = '0000';
         $encoding = $encoder->encodePassword($user, $plainPassword);
    }
    public function load(ObjectManager $manager)
    {
         $oObject = new TUser();
         $oObject->setStrLogin("admin"); 
       
         $oObject->setStrPassword($encoding); 
         $manager->persist($oObject);

        $manager->flush();
    }
}
