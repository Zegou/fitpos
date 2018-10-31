<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TRecettes
 *
 * @ORM\Table(name="t_recettes", indexes={@ORM\Index(name="lg_TYPE_RECETTE_ID", columns={"lg_TYPE_RECETTE_ID"})})
 * @ORM\Entity
 */
class TRecettes
{
    /**
     * @var string
     *
     * @ORM\Column(name="ID_RECETTE", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idRecette;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_CREATED", type="datetime", nullable=true)
     */
    private $dtCreated;

    /**
     * @var string
     *
     * @ORM\Column(name="str_CREATED_BY", type="string", length=40, nullable=true)
     */
    private $strCreatedBy;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_UPDATED", type="datetime", nullable=true)
     */
    private $dtUpdated;

    /**
     * @var string
     *
     * @ORM\Column(name="str_UPDATED_BY", type="string", length=40, nullable=true)
     */
    private $strUpdatedBy;

    /**
     * @var float
     *
     * @ORM\Column(name="int_AMOUNT", type="float", precision=15, scale=3, nullable=true)
     */
    private $intAmount;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="string", length=2000, nullable=true)
     */
    private $strDescription;

    /**
     * @var string
     *
     * @ORM\Column(name="str_REF_FACTURE", type="string", length=40, nullable=true)
     */
    private $strRefFacture;

    /**
     * @var \TTypeRecette
     *
     * @ORM\ManyToOne(targetEntity="TTypeRecette")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_TYPE_RECETTE_ID", referencedColumnName="lg_TYPE_RECETTE_ID")
     * })
     */
    private $lgTypeRecette;

    public function getIdRecette(): ?string
    {
        return $this->idRecette;
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

    public function getStrCreatedBy(): ?string
    {
        return $this->strCreatedBy;
    }

    public function setStrCreatedBy(?string $strCreatedBy): self
    {
        $this->strCreatedBy = $strCreatedBy;

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

    public function getStrUpdatedBy(): ?string
    {
        return $this->strUpdatedBy;
    }

    public function setStrUpdatedBy(?string $strUpdatedBy): self
    {
        $this->strUpdatedBy = $strUpdatedBy;

        return $this;
    }

    public function getIntAmount(): ?float
    {
        return $this->intAmount;
    }

    public function setIntAmount(?float $intAmount): self
    {
        $this->intAmount = $intAmount;

        return $this;
    }

    public function getStrDescription(): ?string
    {
        return $this->strDescription;
    }

    public function setStrDescription(?string $strDescription): self
    {
        $this->strDescription = $strDescription;

        return $this;
    }

    public function getStrRefFacture(): ?string
    {
        return $this->strRefFacture;
    }

    public function setStrRefFacture(?string $strRefFacture): self
    {
        $this->strRefFacture = $strRefFacture;

        return $this;
    }

    public function getLgTypeRecette(): ?TTypeRecette
    {
        return $this->lgTypeRecette;
    }

    public function setLgTypeRecette(?TTypeRecette $lgTypeRecette): self
    {
        $this->lgTypeRecette = $lgTypeRecette;

        return $this;
    }


}

