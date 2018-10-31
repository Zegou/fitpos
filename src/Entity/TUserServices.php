<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TUserServices
 *
 * @ORM\Table(name="t_user_services", indexes={@ORM\Index(name="FK_t_user_fone_lg_USER_ID", columns={"lg_USER_ID"}), @ORM\Index(name="lg_SERVICES_ID", columns={"lg_SERVICES_ID"})})
 * @ORM\Entity
 */
class TUserServices
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_USER_SERVICES_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgUserServicesId;

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
     * @var \DateTime
     *
     * @ORM\Column(name="dt_CREATED", type="datetime", nullable=true)
     */
    private $dtCreated;

    /**
     * @var \TUser
     *
     * @ORM\ManyToOne(targetEntity="TUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_USER_ID", referencedColumnName="lg_USER_ID")
     * })
     */
    private $lgUser;

    /**
     * @var \TServices
     *
     * @ORM\ManyToOne(targetEntity="TServices")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_SERVICES_ID", referencedColumnName="lg_SERVICES_ID")
     * })
     */
    private $lgServices;

    public function getLgUserServicesId(): ?string
    {
        return $this->lgUserServicesId;
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

    public function getDtCreated(): ?\DateTimeInterface
    {
        return $this->dtCreated;
    }

    public function setDtCreated(?\DateTimeInterface $dtCreated): self
    {
        $this->dtCreated = $dtCreated;

        return $this;
    }

    public function getLgUser(): ?TUser
    {
        return $this->lgUser;
    }

    public function setLgUser(?TUser $lgUser): self
    {
        $this->lgUser = $lgUser;

        return $this;
    }

    public function getLgServices(): ?TServices
    {
        return $this->lgServices;
    }

    public function setLgServices(?TServices $lgServices): self
    {
        $this->lgServices = $lgServices;

        return $this;
    }


}

