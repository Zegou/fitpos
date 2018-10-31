<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TSms
 *
 * @ORM\Table(name="t_sms")
 * @ORM\Entity
 */
class TSms
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
     * @ORM\Column(name="MESSAGE", type="string", length=200, nullable=true)
     */
    private $message;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_CREATED", type="datetime", nullable=true)
     */
    private $dtCreated;

    /**
     * @var string
     *
     * @ORM\Column(name="lg_CREATED_BY", type="string", length=20, nullable=true)
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
     * @var string
     *
     * @ORM\Column(name="STATUT", type="string", length=20, nullable=true)
     */
    private $statut;

    public function getIdSms(): ?string
    {
        return $this->idSms;
    }

    public function getMessage(): ?string
    {
        return $this->message;
    }

    public function setMessage(?string $message): self
    {
        $this->message = $message;

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

    public function getStatut(): ?string
    {
        return $this->statut;
    }

    public function setStatut(?string $statut): self
    {
        $this->statut = $statut;

        return $this;
    }


}

