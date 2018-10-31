<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TUserFone
 *
 * @ORM\Table(name="t_user_fone", indexes={@ORM\Index(name="FK_t_user_fone_lg_USER_ID", columns={"lg_USER_ID"})})
 * @ORM\Entity
 */
class TUserFone
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_USER_FONE_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgUserFoneId;

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
     * @var string
     *
     * @ORM\Column(name="str_PHONE", type="string", length=20, nullable=true)
     */
    private $strPhone;

    /**
     * @var \TUser
     *
     * @ORM\ManyToOne(targetEntity="TUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_USER_ID", referencedColumnName="lg_USER_ID")
     * })
     */
    private $lgUser;

    public function getLgUserFoneId(): ?string
    {
        return $this->lgUserFoneId;
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

    public function getStrPhone(): ?string
    {
        return $this->strPhone;
    }

    public function setStrPhone(?string $strPhone): self
    {
        $this->strPhone = $strPhone;

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


}

