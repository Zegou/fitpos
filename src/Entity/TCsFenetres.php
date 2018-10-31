<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TCsFenetres
 *
 * @ORM\Table(name="t_cs_fenetres", uniqueConstraints={@ORM\UniqueConstraint(name="lg_C_FENETRES_ID", columns={"lg_CS_FENETRES_ID"})}, indexes={@ORM\Index(name="lg_CS_CLAVIERS_ID", columns={"lg_CS_CLAVIERS_ID"})})
 * @ORM\Entity
 */
class TCsFenetres
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_CS_FENETRES_ID", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgCsFenetresId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="string", length=50, nullable=true)
     */
    private $strName;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="string", length=100, nullable=true)
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
     * @var \TCsClaviers
     *
     * @ORM\ManyToOne(targetEntity="TCsClaviers")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_CS_CLAVIERS_ID", referencedColumnName="lg_CS_CLAVIERS_ID")
     * })
     */
    private $lgCsClaviers;

    public function getLgCsFenetresId(): ?string
    {
        return $this->lgCsFenetresId;
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

    public function getLgCsClaviers(): ?TCsClaviers
    {
        return $this->lgCsClaviers;
    }

    public function setLgCsClaviers(?TCsClaviers $lgCsClaviers): self
    {
        $this->lgCsClaviers = $lgCsClaviers;

        return $this;
    }


}

