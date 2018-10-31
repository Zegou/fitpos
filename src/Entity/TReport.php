<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TReport
 *
 * @ORM\Table(name="t_report", uniqueConstraints={@ORM\UniqueConstraint(name="lg_REPORT_ID", columns={"lg_REPORT_ID"})}, indexes={@ORM\Index(name="lg_REPORT_GROUPE_ID", columns={"lg_REPORT_GROUPE_ID"}), @ORM\Index(name="lg_DECOUPE_ID", columns={"lg_DECOUPE_ID"})})
 * @ORM\Entity
 */
class TReport
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_REPORT_ID", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgReportId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="string", length=50, nullable=true)
     */
    private $strName;

    /**
     * @var string
     *
     * @ORM\Column(name="str_WEBSERVICE", type="text", length=65535, nullable=true)
     */
    private $strWebservice;

    /**
     * @var string
     *
     * @ORM\Column(name="str_WEBSERVICE_LEGEND", type="text", length=65535, nullable=true)
     */
    private $strWebserviceLegend;

    /**
     * @var string
     *
     * @ORM\Column(name="str_VALUE", type="string", length=50, nullable=true)
     */
    private $strValue;

    /**
     * @var string
     *
     * @ORM\Column(name="str_COULEUR", type="string", length=50, nullable=true)
     */
    private $strCouleur;

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
     * @var \TReportGroupe
     *
     * @ORM\ManyToOne(targetEntity="TReportGroupe")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_REPORT_GROUPE_ID", referencedColumnName="lg_REPORT_GROUPE_ID")
     * })
     */
    private $lgReportGroupe;

    /**
     * @var \TDecoupe
     *
     * @ORM\ManyToOne(targetEntity="TDecoupe")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_DECOUPE_ID", referencedColumnName="lg_DECOUPE_ID")
     * })
     */
    private $lgDecoupe;

    public function getLgReportId(): ?string
    {
        return $this->lgReportId;
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

    public function getStrWebservice(): ?string
    {
        return $this->strWebservice;
    }

    public function setStrWebservice(?string $strWebservice): self
    {
        $this->strWebservice = $strWebservice;

        return $this;
    }

    public function getStrWebserviceLegend(): ?string
    {
        return $this->strWebserviceLegend;
    }

    public function setStrWebserviceLegend(?string $strWebserviceLegend): self
    {
        $this->strWebserviceLegend = $strWebserviceLegend;

        return $this;
    }

    public function getStrValue(): ?string
    {
        return $this->strValue;
    }

    public function setStrValue(?string $strValue): self
    {
        $this->strValue = $strValue;

        return $this;
    }

    public function getStrCouleur(): ?string
    {
        return $this->strCouleur;
    }

    public function setStrCouleur(?string $strCouleur): self
    {
        $this->strCouleur = $strCouleur;

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

    public function getLgReportGroupe(): ?TReportGroupe
    {
        return $this->lgReportGroupe;
    }

    public function setLgReportGroupe(?TReportGroupe $lgReportGroupe): self
    {
        $this->lgReportGroupe = $lgReportGroupe;

        return $this;
    }

    public function getLgDecoupe(): ?TDecoupe
    {
        return $this->lgDecoupe;
    }

    public function setLgDecoupe(?TDecoupe $lgDecoupe): self
    {
        $this->lgDecoupe = $lgDecoupe;

        return $this;
    }


}

