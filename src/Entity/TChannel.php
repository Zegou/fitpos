<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TChannel
 *
 * @ORM\Table(name="t_channel", uniqueConstraints={@ORM\UniqueConstraint(name="lg_CHANNEL_ID", columns={"lg_CHANNEL_ID"})})
 * @ORM\Entity
 */
class TChannel
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_CHANNEL_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgChannelId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_LIBELLE", type="string", length=30, nullable=true)
     */
    private $strLibelle;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="string", length=20, nullable=true)
     */
    private $strDescription;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NOTIFICATION_TYPE", type="string", length=20, nullable=true)
     */
    private $strNotificationType;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NOTIFICATION_PORT", type="string", length=20, nullable=true)
     */
    private $strNotificationPort;

    public function getLgChannelId(): ?string
    {
        return $this->lgChannelId;
    }

    public function getStrLibelle(): ?string
    {
        return $this->strLibelle;
    }

    public function setStrLibelle(?string $strLibelle): self
    {
        $this->strLibelle = $strLibelle;

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

    public function getStrNotificationType(): ?string
    {
        return $this->strNotificationType;
    }

    public function setStrNotificationType(?string $strNotificationType): self
    {
        $this->strNotificationType = $strNotificationType;

        return $this;
    }

    public function getStrNotificationPort(): ?string
    {
        return $this->strNotificationPort;
    }

    public function setStrNotificationPort(?string $strNotificationPort): self
    {
        $this->strNotificationPort = $strNotificationPort;

        return $this;
    }


}

