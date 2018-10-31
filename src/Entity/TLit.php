<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TLit
 *
 * @ORM\Table(name="t_lit", uniqueConstraints={@ORM\UniqueConstraint(name="lg_LIT_ID", columns={"lg_LIT_ID"})}, indexes={@ORM\Index(name="lg_CHAMBRE_ID", columns={"lg_CHAMBRE_ID"})})
 * @ORM\Entity
 */
class TLit
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_LIT_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgLitId;

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
     * @var \TChambre
     *
     * @ORM\ManyToOne(targetEntity="TChambre")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_CHAMBRE_ID", referencedColumnName="lg_CHAMBRE_ID")
     * })
     */
    private $lgChambre;

    public function getLgLitId(): ?string
    {
        return $this->lgLitId;
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

    public function getLgChambre(): ?TChambre
    {
        return $this->lgChambre;
    }

    public function setLgChambre(?TChambre $lgChambre): self
    {
        $this->lgChambre = $lgChambre;

        return $this;
    }


}

