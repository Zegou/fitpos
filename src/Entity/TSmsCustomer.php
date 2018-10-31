<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TSmsCustomer
 *
 * @ORM\Table(name="t_sms_customer", indexes={@ORM\Index(name="ID_SMS", columns={"ID_SMS"}), @ORM\Index(name="lg_CUSTOMER_ID", columns={"lg_CUSTOMER_ID"})})
 * @ORM\Entity
 */
class TSmsCustomer
{
    /**
     * @var string
     *
     * @ORM\Column(name="ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_CREATED", type="datetime", nullable=true)
     */
    private $dtCreated;

    /**
     * @var string
     *
     * @ORM\Column(name="str_CREATED_BY", type="string", length=40, nullable=true)
     */
    private $strCreatedBy;

    /**
     * @var string
     *
     * @ORM\Column(name="str_STATUT", type="string", length=20, nullable=true)
     */
    private $strStatut;

    /**
     * @var \TSms
     *
     * @ORM\ManyToOne(targetEntity="TSms")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="ID_SMS", referencedColumnName="ID_SMS")
     * })
     */
    private $idSms;

    /**
     * @var \TCustomer
     *
     * @ORM\ManyToOne(targetEntity="TCustomer")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_CUSTOMER_ID", referencedColumnName="lg_CUSTOMER_ID")
     * })
     */
    private $lgCustomer;

    public function getId(): ?string
    {
        return $this->id;
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

    public function getStrCreatedBy(): ?string
    {
        return $this->strCreatedBy;
    }

    public function setStrCreatedBy(?string $strCreatedBy): self
    {
        $this->strCreatedBy = $strCreatedBy;

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

    public function getIdSms(): ?TSms
    {
        return $this->idSms;
    }

    public function setIdSms(?TSms $idSms): self
    {
        $this->idSms = $idSms;

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


}

