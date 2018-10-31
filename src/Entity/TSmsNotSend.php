<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TSmsNotSend
 *
 * @ORM\Table(name="t_sms_not_send", indexes={@ORM\Index(name="ID_SMS_MASTER", columns={"ID_SMS_MASTER"})})
 * @ORM\Entity
 */
class TSmsNotSend
{
    /**
     * @var string
     *
     * @ORM\Column(name="ID_SMS", type="string", length=50, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idSms;

    /**
     * @var string
     *
     * @ORM\Column(name="EXPEDITEUR", type="string", length=40, nullable=true)
     */
    private $expediteur;

    /**
     * @var string
     *
     * @ORM\Column(name="DESTINATEUR", type="string", length=40, nullable=true)
     */
    private $destinateur;

    /**
     * @var string
     *
     * @ORM\Column(name="MESSAGES", type="text", length=65535, nullable=true)
     */
    private $messages;

    /**
     * @var string
     *
     * @ORM\Column(name="STATUT", type="string", length=20, nullable=true)
     */
    private $statut;

    /**
     * @var float
     *
     * @ORM\Column(name="CREDIT", type="float", precision=15, scale=3, nullable=true)
     */
    private $credit;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_CREATED", type="datetime", nullable=true)
     */
    private $dtCreated;

    /**
     * @var string
     *
     * @ORM\Column(name="lg_CREATED_BY", type="string", length=50, nullable=true)
     */
    private $lgCreatedBy;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_UPDATED", type="datetime", nullable=true)
     */
    private $dtUpdated;

    /**
     * @var string
     *
     * @ORM\Column(name="lg_UPDATED_BY", type="string", length=20, nullable=true)
     */
    private $lgUpdatedBy;

    /**
     * @var \TSms
     *
     * @ORM\ManyToOne(targetEntity="TSms")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="ID_SMS_MASTER", referencedColumnName="ID_SMS")
     * })
     */
    private $idSmsMaster;

    public function getIdSms(): ?string
    {
        return $this->idSms;
    }

    public function getExpediteur(): ?string
    {
        return $this->expediteur;
    }

    public function setExpediteur(?string $expediteur): self
    {
        $this->expediteur = $expediteur;

        return $this;
    }

    public function getDestinateur(): ?string
    {
        return $this->destinateur;
    }

    public function setDestinateur(?string $destinateur): self
    {
        $this->destinateur = $destinateur;

        return $this;
    }

    public function getMessages(): ?string
    {
        return $this->messages;
    }

    public function setMessages(?string $messages): self
    {
        $this->messages = $messages;

        return $this;
    }

    public function getStatut(): ?string
    {
        return $this->statut;
    }

    public function setStatut(?string $statut): self
    {
        $this->statut = $statut;

        return $this;
    }

    public function getCredit(): ?float
    {
        return $this->credit;
    }

    public function setCredit(?float $credit): self
    {
        $this->credit = $credit;

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

    public function getLgCreatedBy(): ?string
    {
        return $this->lgCreatedBy;
    }

    public function setLgCreatedBy(?string $lgCreatedBy): self
    {
        $this->lgCreatedBy = $lgCreatedBy;

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

    public function getLgUpdatedBy(): ?string
    {
        return $this->lgUpdatedBy;
    }

    public function setLgUpdatedBy(?string $lgUpdatedBy): self
    {
        $this->lgUpdatedBy = $lgUpdatedBy;

        return $this;
    }

    public function getIdSmsMaster(): ?TSms
    {
        return $this->idSmsMaster;
    }

    public function setIdSmsMaster(?TSms $idSmsMaster): self
    {
        $this->idSmsMaster = $idSmsMaster;

        return $this;
    }


}

