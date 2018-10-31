<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TChambre
 *
 * @ORM\Table(name="t_chambre", uniqueConstraints={@ORM\UniqueConstraint(name="lg_CHAMBRE_ID", columns={"lg_CHAMBRE_ID"})}, indexes={@ORM\Index(name="lg_ETAGE_ID", columns={"lg_ETAGE_ID"}), @ORM\Index(name="lg_SERVICES_ID", columns={"lg_SERVICES_ID"})})
 * @ORM\Entity
 */
class TChambre
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_CHAMBRE_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgChambreId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="string", length=20, nullable=true)
     */
    private $strName;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="text", length=65535, nullable=true)
     */
    private $strDescription;

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
     * @ORM\Column(name="str_STATUT", type="string", length=20, nullable=true)
     */
    private $strStatut;

    /**
     * @var \TServices
     *
     * @ORM\ManyToOne(targetEntity="TServices")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_SERVICES_ID", referencedColumnName="lg_SERVICES_ID")
     * })
     */
    private $lgServices;

    /**
     * @var \TEtage
     *
     * @ORM\ManyToOne(targetEntity="TEtage")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_ETAGE_ID", referencedColumnName="lg_ETAGE_ID")
     * })
     */
    private $lgEtage;

    public function getLgChambreId(): ?string
    {
        return $this->lgChambreId;
    }

    public function getStrName(): ?string
    {
        return $this->strName;
    }

    public function setStrName(?string $strName): self
    {
        $this->strName = $strName;

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

    public function getStrStatut(): ?string
    {
        return $this->strStatut;
    }

    public function setStrStatut(?string $strStatut): self
    {
        $this->strStatut = $strStatut;

        return $this;
    }

    public function getLgServices(): ?TServices
    {
        return $this->lgServices;
    }

    public function setLgServices(?TServices $lgServices): self
    {
        $this->lgServices = $lgServices;

        return $this;
    }

    public function getLgEtage(): ?TEtage
    {
        return $this->lgEtage;
    }

    public function setLgEtage(?TEtage $lgEtage): self
    {
        $this->lgEtage = $lgEtage;

        return $this;
    }


}

