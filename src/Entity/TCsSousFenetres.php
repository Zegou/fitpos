<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TCsSousFenetres
 *
 * @ORM\Table(name="t_cs_sous_fenetres", uniqueConstraints={@ORM\UniqueConstraint(name="lg_CS_SOUS_FENETRES_ID", columns={"lg_CS_SOUS_FENETRES_ID"})}, indexes={@ORM\Index(name="lg_CS_FENETRES_ID", columns={"lg_CS_FENETRES_ID"})})
 * @ORM\Entity
 */
class TCsSousFenetres
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_CS_SOUS_FENETRES_ID", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgCsSousFenetresId;

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
     * @var \TCsFenetres
     *
     * @ORM\ManyToOne(targetEntity="TCsFenetres")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_CS_FENETRES_ID", referencedColumnName="lg_CS_FENETRES_ID")
     * })
     */
    private $lgCsFenetres;

    public function getLgCsSousFenetresId(): ?string
    {
        return $this->lgCsSousFenetresId;
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

    public function getLgCsFenetres(): ?TCsFenetres
    {
        return $this->lgCsFenetres;
    }

    public function setLgCsFenetres(?TCsFenetres $lgCsFenetres): self
    {
        $this->lgCsFenetres = $lgCsFenetres;

        return $this;
    }


}

