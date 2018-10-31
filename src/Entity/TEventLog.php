<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TEventLog
 *
 * @ORM\Table(name="t_event_log")
 * @ORM\Entity
 */
class TEventLog
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_EVENT_LOG_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgEventLogId;

    /**
     * @var string
     *
     * @ORM\Column(name="MATRICULE_ELEVE", type="string", length=20, nullable=true)
     */
    private $matriculeEleve;

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
     * @ORM\Column(name="str_DESCRIPTION", type="string", length=2000, nullable=true)
     */
    private $strDescription;

    /**
     * @var string
     *
     * @ORM\Column(name="str_CREATED_BY", type="string", length=100, nullable=true)
     */
    private $strCreatedBy;

    /**
     * @var string
     *
     * @ORM\Column(name="str_UPDATED_BY", type="string", length=20, nullable=true)
     */
    private $strUpdatedBy;

    /**
     * @var string
     *
     * @ORM\Column(name="str_STATUT", type="string", length=20, nullable=true)
     */
    private $strStatut;

    /**
     * @var string
     *
     * @ORM\Column(name="str_TABLE_CONCERN", type="string", length=40, nullable=true)
     */
    private $strTableConcern;

    /**
     * @var string
     *
     * @ORM\Column(name="str_MODULE_CONCERN", type="string", length=40, nullable=true)
     */
    private $strModuleConcern;

    public function getLgEventLogId(): ?string
    {
        return $this->lgEventLogId;
    }

    public function getMatriculeEleve(): ?string
    {
        return $this->matriculeEleve;
    }

    public function setMatriculeEleve(?string $matriculeEleve): self
    {
        $this->matriculeEleve = $matriculeEleve;

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

    public function getStrDescription(): ?string
    {
        return $this->strDescription;
    }

    public function setStrDescription(?string $strDescription): self
    {
        $this->strDescription = $strDescription;

        return $this;
    }

    public function getStrCreatedBy(): ?string
    {
        return $this->strCreatedBy;
    }

    public function setStrCreatedBy(?string $strCreatedBy): self
    {
        $this->strCreatedBy = $strCreatedBy;

        return $this;
    }

    public function getStrUpdatedBy(): ?string
    {
        return $this->strUpdatedBy;
    }

    public function setStrUpdatedBy(?string $strUpdatedBy): self
    {
        $this->strUpdatedBy = $strUpdatedBy;

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

    public function getStrTableConcern(): ?string
    {
        return $this->strTableConcern;
    }

    public function setStrTableConcern(?string $strTableConcern): self
    {
        $this->strTableConcern = $strTableConcern;

        return $this;
    }

    public function getStrModuleConcern(): ?string
    {
        return $this->strModuleConcern;
    }

    public function setStrModuleConcern(?string $strModuleConcern): self
    {
        $this->strModuleConcern = $strModuleConcern;

        return $this;
    }


}

