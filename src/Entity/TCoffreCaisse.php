<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TCoffreCaisse
 *
 * @ORM\Table(name="t_coffre_caisse", indexes={@ORM\Index(name="lg_USER_ID", columns={"lg_USER_ID"})})
 * @ORM\Entity
 */
class TCoffreCaisse
{
    /**
     * @var string
     *
     * @ORM\Column(name="ID_COFFRE_CAISSE", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idCoffreCaisse;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_AMOUNT", type="integer", nullable=true)
     */
    private $intAmount;

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
     * @ORM\Column(name="ld_CREATED_BY", type="string", length=40, nullable=true)
     */
    private $ldCreatedBy;

    /**
     * @var string
     *
     * @ORM\Column(name="ld_UPDATED_BY", type="string", length=40, nullable=true)
     */
    private $ldUpdatedBy;

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

    public function getIdCoffreCaisse(): ?string
    {
        return $this->idCoffreCaisse;
    }

    public function getIntAmount(): ?int
    {
        return $this->intAmount;
    }

    public function setIntAmount(?int $intAmount): self
    {
        $this->intAmount = $intAmount;

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

    public function getLdCreatedBy(): ?string
    {
        return $this->ldCreatedBy;
    }

    public function setLdCreatedBy(?string $ldCreatedBy): self
    {
        $this->ldCreatedBy = $ldCreatedBy;

        return $this;
    }

    public function getLdUpdatedBy(): ?string
    {
        return $this->ldUpdatedBy;
    }

    public function setLdUpdatedBy(?string $ldUpdatedBy): self
    {
        $this->ldUpdatedBy = $ldUpdatedBy;

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


}

