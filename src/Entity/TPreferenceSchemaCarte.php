<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TPreferenceSchemaCarte
 *
 * @ORM\Table(name="t_preference_schema_carte", uniqueConstraints={@ORM\UniqueConstraint(name="lg_PREFERENCE_SCHEMA_CARTE_ID", columns={"lg_PREFERENCE_SCHEMA_CARTE_ID"})}, indexes={@ORM\Index(name="lg_CUSTOMER_ID", columns={"lg_CUSTOMER_ID"}), @ORM\Index(name="lg_SCHEMA_CARTE_ID", columns={"lg_SCHEMA_CARTE_ID"}), @ORM\Index(name="lg_REPORT_ID", columns={"lg_REPORT_ID"})})
 * @ORM\Entity
 */
class TPreferenceSchemaCarte
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_PREFERENCE_SCHEMA_CARTE_ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgPreferenceSchemaCarteId;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_CREATED", type="datetime", nullable=true)
     */
    private $dtCreated;

    /**
     * @var string
     *
     * @ORM\Column(name="str_STATUT", type="string", length=40, nullable=true)
     */
    private $strStatut;

    /**
     * @var \TCustomer
     *
     * @ORM\ManyToOne(targetEntity="TCustomer")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_CUSTOMER_ID", referencedColumnName="lg_CUSTOMER_ID")
     * })
     */
    private $lgCustomer;

    /**
     * @var \TSchemaCarte
     *
     * @ORM\ManyToOne(targetEntity="TSchemaCarte")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_SCHEMA_CARTE_ID", referencedColumnName="lg_SCHEMA_CARTE_ID")
     * })
     */
    private $lgSchemaCarte;

    /**
     * @var \TReport
     *
     * @ORM\ManyToOne(targetEntity="TReport")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_REPORT_ID", referencedColumnName="lg_REPORT_ID")
     * })
     */
    private $lgReport;

    public function getLgPreferenceSchemaCarteId(): ?string
    {
        return $this->lgPreferenceSchemaCarteId;
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

    public function getStrStatut(): ?string
    {
        return $this->strStatut;
    }

    public function setStrStatut(?string $strStatut): self
    {
        $this->strStatut = $strStatut;

        return $this;
    }

    public function getLgCustomer(): ?TCustomer
    {
        return $this->lgCustomer;
    }

    public function setLgCustomer(?TCustomer $lgCustomer): self
    {
        $this->lgCustomer = $lgCustomer;

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

    public function getLgReport(): ?TReport
    {
        return $this->lgReport;
    }

    public function setLgReport(?TReport $lgReport): self
    {
        $this->lgReport = $lgReport;

        return $this;
    }


}

