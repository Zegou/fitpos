<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TEtage
 *
 * @ORM\Table(name="t_etage", uniqueConstraints={@ORM\UniqueConstraint(name="lg_ETAGE_ID", columns={"lg_ETAGE_ID"})}, indexes={@ORM\Index(name="lg_BATIMENT_ID", columns={"lg_BATIMENT_ID"})})
 * @ORM\Entity
 */
class TEtage
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_ETAGE_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgEtageId;

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
     * @var \TBatiment
     *
     * @ORM\ManyToOne(targetEntity="TBatiment")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_BATIMENT_ID", referencedColumnName="lg_BATIMENT_ID")
     * })
     */
    private $lgBatiment;

    public function getLgEtageId(): ?string
    {
        return $this->lgEtageId;
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

    public function getLgBatiment(): ?TBatiment
    {
        return $this->lgBatiment;
    }

    public function setLgBatiment(?TBatiment $lgBatiment): self
    {
        $this->lgBatiment = $lgBatiment;

        return $this;
    }


}

