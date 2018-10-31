<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TTypeContenance
 *
 * @ORM\Table(name="t_type_contenance")
 * @ORM\Entity
 */
class TTypeContenance
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_TYPE_CONTENANCE_ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgTypeContenanceId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_TYPE_CONTENANCE", type="string", length=40, nullable=true)
     */
    private $strTypeContenance;

    /**
     * @var string
     *
     * @ORM\Column(name="str_STATUT", type="string", length=20, nullable=true)
     */
    private $strStatut;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_CREATED", type="datetime", nullable=true)
     */
    private $dtCreated;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_UPDATED", type="datetime", nullable=true)
     */
    private $dtUpdated;

    public function getLgTypeContenanceId(): ?string
    {
        return $this->lgTypeContenanceId;
    }

    public function getStrTypeContenance(): ?string
    {
        return $this->strTypeContenance;
    }

    public function setStrTypeContenance(?string $strTypeContenance): self
    {
        $this->strTypeContenance = $strTypeContenance;

        return $this;
    }

    public function getStrStatut(): ?string
    {
        return $this->strStatut;
    }

    public function setStrStatut(?string $strStatut): self
    {
        $this->strStatut = $strStatut;

        return $this;
    }

    public function getDtCreated(): ?\DateTimeInterface
    {
        return $this->dtCreated;
    }

    public function setDtCreated(?\DateTimeInterface $dtCreated): self
    {
        $this->dtCreated = $dtCreated;

        return $this;
    }

    public function getDtUpdated(): ?\DateTimeInterface
    {
        return $this->dtUpdated;
    }

    public function setDtUpdated(?\DateTimeInterface $dtUpdated): self
    {
        $this->dtUpdated = $dtUpdated;

        return $this;
    }


        private $stractionEDIT;
            public function getstractionEDIT()
        {
            $stractionEDIT = "<td data-value='1'><a href='../type/contenance/edit?ID=".$this->lgTypeContenanceId."'    class='md-btn md-raised m-b-sm w-xs green' >Modifier</a></td>";

            return $stractionEDIT; //array('ROLE_USER');
        }

            private $stractionDELETE;
            public function getstractionDELETE()
        {
            $stractionDELETE= "<td data-value='1'><a href='../type/contenance/delete?ID=".$this->lgTypeContenanceId."'  class='md-btn md-raised m-b-sm w-xs red' onClick='return confirmation();'>Supprimer</a></td>";

            return $stractionDELETE; //array('ROLE_USER');
        }

}

