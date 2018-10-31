<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TSchemaCarte
 *
 * @ORM\Table(name="t_schema_carte", uniqueConstraints={@ORM\UniqueConstraint(name="lg_SCHEMA_CARTE_ID", columns={"lg_SCHEMA_CARTE_ID"})}, indexes={@ORM\Index(name="lg_INSTITUTION_ID", columns={"lg_INSTITUTION_ID"})})
 * @ORM\Entity
 */
class TSchemaCarte
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_SCHEMA_CARTE_ID", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgSchemaCarteId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="string", length=100, nullable=true)
     */
    private $strDescription;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="string", length=50, nullable=true)
     */
    private $strName;

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
     * @var \TInstitutions
     *
     * @ORM\ManyToOne(targetEntity="TInstitutions")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_INSTITUTION_ID", referencedColumnName="lg_INSTITUTION_ID")
     * })
     */
    private $lgInstitution;

    public function getLgSchemaCarteId(): ?string
    {
        return $this->lgSchemaCarteId;
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

    public function getStrName(): ?string
    {
        return $this->strName;
    }

    public function setStrName(?string $strName): self
    {
        $this->strName = $strName;

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

    public function getLgInstitution(): ?TInstitutions
    {
        return $this->lgInstitution;
    }

    public function setLgInstitution(?TInstitutions $lgInstitution): self
    {
        $this->lgInstitution = $lgInstitution;

        return $this;
    }


}

