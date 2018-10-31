<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TAlertEventUserFone
 *
 * @ORM\Table(name="t_alert_event_user_fone", indexes={@ORM\Index(name="str_Event", columns={"str_Event"}), @ORM\Index(name="lg_USER_FONE_ID", columns={"lg_USER_FONE_ID"})})
 * @ORM\Entity
 */
class TAlertEventUserFone
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_ID", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_STATUT", type="string", length=20, nullable=true)
     */
    private $strStatut;

    /**
     * @var string
     *
     * @ORM\Column(name="dt_CREATED", type="string", length=20, nullable=true)
     */
    private $dtCreated;

    /**
     * @var \TAlertEvent
     *
     * @ORM\ManyToOne(targetEntity="TAlertEvent")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="str_Event", referencedColumnName="str_Event")
     * })
     */
    private $strEvent;

    /**
     * @var \TUserFone
     *
     * @ORM\ManyToOne(targetEntity="TUserFone")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_USER_FONE_ID", referencedColumnName="lg_USER_FONE_ID")
     * })
     */
    private $lgUserFone;

    public function getLgId(): ?string
    {
        return $this->lgId;
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

    public function getDtCreated(): ?string
    {
        return $this->dtCreated;
    }

    public function setDtCreated(?string $dtCreated): self
    {
        $this->dtCreated = $dtCreated;

        return $this;
    }

    public function getStrEvent(): ?TAlertEvent
    {
        return $this->strEvent;
    }

    public function setStrEvent(?TAlertEvent $strEvent): self
    {
        $this->strEvent = $strEvent;

        return $this;
    }

    public function getLgUserFone(): ?TUserFone
    {
        return $this->lgUserFone;
    }

    public function setLgUserFone(?TUserFone $lgUserFone): self
    {
        $this->lgUserFone = $lgUserFone;

        return $this;
    }


}

