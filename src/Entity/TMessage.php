<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TMessage
 *
 * @ORM\Table(name="t_message", uniqueConstraints={@ORM\UniqueConstraint(name="lg_MESSAGE_ID", columns={"lg_MESSAGE_ID"})})
 * @ORM\Entity
 */
class TMessage
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_MESSAGE_ID", type="string", length=50, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgMessageId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_MESSAGE", type="text", length=65535, nullable=true)
     */
    private $strMessage;

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
    private $strStatut = 'enable';

    public function getLgMessageId(): ?string
    {
        return $this->lgMessageId;
    }

    public function getStrMessage(): ?string
    {
        return $this->strMessage;
    }

    public function setStrMessage(?string $strMessage): self
    {
        $this->strMessage = $strMessage;

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


}

