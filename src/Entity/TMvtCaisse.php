<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TMvtCaisse
 *
 * @ORM\Table(name="t_mvt_caisse", indexes={@ORM\Index(name="lg_TYPE_MVT_CAISSE_ID", columns={"lg_TYPE_MVT_CAISSE_ID"}), @ORM\Index(name="lg_MODE_REGLEMENT_ID", columns={"lg_MODE_REGLEMENT_ID"}), @ORM\Index(name="str_CREATED_BY", columns={"str_CREATED_BY"})})
 * @ORM\Entity
 */
class TMvtCaisse
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_MVT_CAISSE_ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgMvtCaisseId;

    /**
     * @var string
     *
     * @ORM\Column(name="lg_USER_ID", type="string", length=40, nullable=true)
     */
    private $lgUserId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NUM_COMPTE", type="string", length=100, nullable=true)
     */
    private $strNumCompte;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NUM_PIECE_COMPTABLE", type="text", length=65535, nullable=true)
     */
    private $strNumPieceComptable;

    /**
     * @var float
     *
     * @ORM\Column(name="int_AMOUNT", type="float", precision=15, scale=3, nullable=true)
     */
    private $intAmount;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_DATE_MVT", type="datetime", nullable=true)
     */
    private $dtDateMvt;

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

    /**
     * @var string
     *
     * @ORM\Column(name="str_UPDATED_BY", type="string", length=40, nullable=true)
     */
    private $strUpdatedBy;

    /**
     * @var string
     *
     * @ORM\Column(name="str_STATUT", type="string", length=20, nullable=true)
     */
    private $strStatut;

    /**
     * @var \TTypeMvtCaisse
     *
     * @ORM\ManyToOne(targetEntity="TTypeMvtCaisse")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_TYPE_MVT_CAISSE_ID", referencedColumnName="lg_TYPE_MVT_CAISSE_ID")
     * })
     */
    private $lgTypeMvtCaisse;

    /**
     * @var \TModeReglement
     *
     * @ORM\ManyToOne(targetEntity="TModeReglement")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_MODE_REGLEMENT_ID", referencedColumnName="lg_MODE_REGLEMENT_ID")
     * })
     */
    private $lgModeReglement;

    /**
     * @var \TUser
     *
     * @ORM\ManyToOne(targetEntity="TUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="str_CREATED_BY", referencedColumnName="lg_USER_ID")
     * })
     */
    private $strCreatedBy;

    public function getLgMvtCaisseId(): ?string
    {
        return $this->lgMvtCaisseId;
    }

    public function getLgUserId(): ?string
    {
        return $this->lgUserId;
    }

    public function setLgUserId(?string $lgUserId): self
    {
        $this->lgUserId = $lgUserId;

        return $this;
    }

    public function getStrNumCompte(): ?string
    {
        return $this->strNumCompte;
    }

    public function setStrNumCompte(?string $strNumCompte): self
    {
        $this->strNumCompte = $strNumCompte;

        return $this;
    }

    public function getStrNumPieceComptable(): ?string
    {
        return $this->strNumPieceComptable;
    }

    public function setStrNumPieceComptable(?string $strNumPieceComptable): self
    {
        $this->strNumPieceComptable = $strNumPieceComptable;

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

    public function getDtDateMvt(): ?\DateTimeInterface
    {
        return $this->dtDateMvt;
    }

    public function setDtDateMvt(?\DateTimeInterface $dtDateMvt): self
    {
        $this->dtDateMvt = $dtDateMvt;

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

    public function getStrUpdatedBy(): ?string
    {
        return $this->strUpdatedBy;
    }

    public function setStrUpdatedBy(?string $strUpdatedBy): self
    {
        $this->strUpdatedBy = $strUpdatedBy;

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

    public function getLgTypeMvtCaisse(): ?TTypeMvtCaisse
    {
        return $this->lgTypeMvtCaisse;
    }

    public function setLgTypeMvtCaisse(?TTypeMvtCaisse $lgTypeMvtCaisse): self
    {
        $this->lgTypeMvtCaisse = $lgTypeMvtCaisse;

        return $this;
    }

    public function getLgModeReglement(): ?TModeReglement
    {
        return $this->lgModeReglement;
    }

    public function setLgModeReglement(?TModeReglement $lgModeReglement): self
    {
        $this->lgModeReglement = $lgModeReglement;

        return $this;
    }

    public function getStrCreatedBy(): ?TUser
    {
        return $this->strCreatedBy;
    }

    public function setStrCreatedBy(?TUser $strCreatedBy): self
    {
        $this->strCreatedBy = $strCreatedBy;

        return $this;
    }


}

