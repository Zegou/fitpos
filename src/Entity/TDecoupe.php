<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TDecoupe
 *
 * @ORM\Table(name="t_decoupe", uniqueConstraints={@ORM\UniqueConstraint(name="lg_DECOUPE_ID", columns={"lg_DECOUPE_ID"})}, indexes={@ORM\Index(name="lg_SCHEMA_CARTE_ID", columns={"lg_SCHEMA_CARTE_ID"})})
 * @ORM\Entity
 */
class TDecoupe
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_DECOUPE_ID", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgDecoupeId;

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
     * @var string
     *
     * @ORM\Column(name="str_CENTER", type="string", length=20, nullable=true)
     */
    private $strCenter;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_INDEX", type="integer", nullable=true)
     */
    private $intIndex;

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
     * @var \TSchemaCarte
     *
     * @ORM\ManyToOne(targetEntity="TSchemaCarte")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_SCHEMA_CARTE_ID", referencedColumnName="lg_SCHEMA_CARTE_ID")
     * })
     */
    private $lgSchemaCarte;

    public function getLgDecoupeId(): ?string
    {
        return $this->lgDecoupeId;
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

    public function getStrCenter(): ?string
    {
        return $this->strCenter;
    }

    public function setStrCenter(?string $strCenter): self
    {
        $this->strCenter = $strCenter;

        return $this;
    }

    public function getIntIndex(): ?int
    {
        return $this->intIndex;
    }

    public function setIntIndex(?int $intIndex): self
    {
        $this->intIndex = $intIndex;

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

    public function getLgSchemaCarte(): ?TSchemaCarte
    {
        return $this->lgSchemaCarte;
    }

    public function setLgSchemaCarte(?TSchemaCarte $lgSchemaCarte): self
    {
        $this->lgSchemaCarte = $lgSchemaCarte;

        return $this;
    }


}

