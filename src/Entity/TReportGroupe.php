<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TReportGroupe
 *
 * @ORM\Table(name="t_report_groupe", uniqueConstraints={@ORM\UniqueConstraint(name="lg_REPORT_GROUPE_ID", columns={"lg_REPORT_GROUPE_ID"})}, indexes={@ORM\Index(name="lg_SCHEMA_CARTE_ID", columns={"lg_SCHEMA_CARTE_ID"})})
 * @ORM\Entity
 */
class TReportGroupe
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_REPORT_GROUPE_ID", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgReportGroupeId;

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
     * @var \TSchemaCarte
     *
     * @ORM\ManyToOne(targetEntity="TSchemaCarte")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_SCHEMA_CARTE_ID", referencedColumnName="lg_SCHEMA_CARTE_ID")
     * })
     */
    private $lgSchemaCarte;

    public function getLgReportGroupeId(): ?string
    {
        return $this->lgReportGroupeId;
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

