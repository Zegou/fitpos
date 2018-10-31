<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TResumeCaisse
 *
 * @ORM\Table(name="t_resume_caisse", indexes={@ORM\Index(name="lg_USER_ID", columns={"lg_USER_ID"}), @ORM\Index(name="ID_COFFRE_CAISSE", columns={"ID_COFFRE_CAISSE"})})
 * @ORM\Entity
 */
class TResumeCaisse
{
    /**
     * @var string
     *
     * @ORM\Column(name="ld_CAISSE_ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $ldCaisseId;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_SOLDE_MATIN", type="integer", nullable=true)
     */
    private $intSoldeMatin;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_SOLDE_SOIR", type="integer", nullable=true)
     */
    private $intSoldeSoir;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_CREATED", type="datetime", nullable=true)
     */
    private $dtCreated;

    /**
     * @var string
     *
     * @ORM\Column(name="lg_CREATED_BY", type="string", length=40, nullable=true)
     */
    private $lgCreatedBy;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_UPDATED", type="datetime", nullable=true)
     */
    private $dtUpdated;

    /**
     * @var string
     *
     * @ORM\Column(name="lg_UPDATED_BY", type="string", length=40, nullable=true)
     */
    private $lgUpdatedBy;

    /**
     * @var string
     *
     * @ORM\Column(name="str_STATUT", type="string", length=40, nullable=true)
     */
    private $strStatut;

    /**
     * @var \TUser
     *
     * @ORM\ManyToOne(targetEntity="TUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_USER_ID", referencedColumnName="lg_USER_ID")
     * })
     */
    private $lgUser;

    /**
     * @var \TCoffreCaisse
     *
     * @ORM\ManyToOne(targetEntity="TCoffreCaisse")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="ID_COFFRE_CAISSE", referencedColumnName="ID_COFFRE_CAISSE")
     * })
     */
    private $idCoffreCaisse;

    public function getLdCaisseId(): ?string
    {
        return $this->ldCaisseId;
    }

    public function getIntSoldeMatin(): ?int
    {
        return $this->intSoldeMatin;
    }

    public function setIntSoldeMatin(?int $intSoldeMatin): self
    {
        $this->intSoldeMatin = $intSoldeMatin;

        return $this;
    }

    public function getIntSoldeSoir(): ?int
    {
        return $this->intSoldeSoir;
    }

    public function setIntSoldeSoir(?int $intSoldeSoir): self
    {
        $this->intSoldeSoir = $intSoldeSoir;

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

    public function getLgCreatedBy(): ?string
    {
        return $this->lgCreatedBy;
    }

    public function setLgCreatedBy(?string $lgCreatedBy): self
    {
        $this->lgCreatedBy = $lgCreatedBy;

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

    public function getLgUpdatedBy(): ?string
    {
        return $this->lgUpdatedBy;
    }

    public function setLgUpdatedBy(?string $lgUpdatedBy): self
    {
        $this->lgUpdatedBy = $lgUpdatedBy;

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

    public function getLgUser(): ?TUser
    {
        return $this->lgUser;
    }

    public function setLgUser(?TUser $lgUser): self
    {
        $this->lgUser = $lgUser;

        return $this;
    }

    public function getIdCoffreCaisse(): ?TCoffreCaisse
    {
        return $this->idCoffreCaisse;
    }

    public function setIdCoffreCaisse(?TCoffreCaisse $idCoffreCaisse): self
    {
        $this->idCoffreCaisse = $idCoffreCaisse;

        return $this;
    }


}

