<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TTypeRecette
 *
 * @ORM\Table(name="t_type_recette")
 * @ORM\Entity
 */
class TTypeRecette
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_TYPE_RECETTE_ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgTypeRecetteId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_TYPE_RECETTE", type="string", length=40, nullable=true)
     */
    private $strTypeRecette;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NUMERO_COMPTE", type="string", length=20, nullable=true)
     */
    private $strNumeroCompte;

    /**
     * @var boolean
     *
     * @ORM\Column(name="is_USE_TVA", type="boolean", nullable=true)
     */
    private $isUseTva = '0';

    public function getLgTypeRecetteId(): ?string
    {
        return $this->lgTypeRecetteId;
    }

    public function getStrTypeRecette(): ?string
    {
        return $this->strTypeRecette;
    }

    public function setStrTypeRecette(?string $strTypeRecette): self
    {
        $this->strTypeRecette = $strTypeRecette;

        return $this;
    }

    public function getStrNumeroCompte(): ?string
    {
        return $this->strNumeroCompte;
    }

    public function setStrNumeroCompte(?string $strNumeroCompte): self
    {
        $this->strNumeroCompte = $strNumeroCompte;

        return $this;
    }

    public function getIsUseTva(): ?bool
    {
        return $this->isUseTva;
    }

    public function setIsUseTva(?bool $isUseTva): self
    {
        $this->isUseTva = $isUseTva;

        return $this;
    }



    private $stractionEDIT;
    public function getstractionEDIT()
    {
    $stractionEDIT = "<td data-value='1'><a href='../type/recette/edit?ID=".$this->lgTypeRecetteId."'    class='md-btn md-raised m-b-sm w-xs green'>Modifier</a></td>";

    return $stractionEDIT; //array('ROLE_USER');
    }

    private $stractionDELETE;
    public function getstractionDELETE()
    {
    $stractionDELETE= "<td data-value='1'><a href='../type/recette/delete?ID=".$this->lgTypeRecetteId."'  class='md-btn md-raised m-b-sm w-xs red' onClick='return confirmation();'>Supprimer</a></td>";

    return $stractionDELETE; //array('ROLE_USER');
    }


}

