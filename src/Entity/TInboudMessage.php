<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TInboudMessage
 *
 * @ORM\Table(name="t_inboud_message")
 * @ORM\Entity
 */
class TInboudMessage
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_INBOUND_MESSAGE_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgInboundMessageId;

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
     * @ORM\Column(name="str_MESSAGE", type="text", length=65535, nullable=false)
     */
    private $strMessage;

    /**
     * @var string
     *
     * @ORM\Column(name="str_STATUT", type="string", length=20, nullable=true)
     */
    private $strStatut;

    /**
     * @var string
     *
     * @ORM\Column(name="str_PHONE", type="string", length=20, nullable=true)
     */
    private $strPhone;

    public function getLgInboundMessageId(): ?string
    {
        return $this->lgInboundMessageId;
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

    public function getStrMessage(): ?string
    {
        return $this->strMessage;
    }

    public function setStrMessage(string $strMessage): self
    {
        $this->strMessage = $strMessage;

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

    public function getStrPhone(): ?string
    {
        return $this->strPhone;
    }

    public function setStrPhone(?string $strPhone): self
    {
        $this->strPhone = $strPhone;

        return $this;
    }


}

