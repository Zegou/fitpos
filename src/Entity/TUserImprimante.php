<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TUserImprimante
 *
 * @ORM\Table(name="t_user_imprimante", indexes={@ORM\Index(name="lg_USER_ID", columns={"lg_USER_ID"}), @ORM\Index(name="lg_IMPRIMQNTE_ID", columns={"lg_IMPRIMANTE_ID"})})
 * @ORM\Entity
 */
class TUserImprimante
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_USER_IMPRIMQNTE_ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgUserImprimqnteId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="text", length=65535, nullable=true)
     */
    private $strName;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="text", length=65535, nullable=true)
     */
    private $strDescription;

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
     * @ORM\Column(name="str_STATUT", type="string", length=40, nullable=true)
     */
    private $strStatut;

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
     * @var \TImprimante
     *
     * @ORM\ManyToOne(targetEntity="TImprimante")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_IMPRIMANTE_ID", referencedColumnName="lg_IMPRIMANTE_ID")
     * })
     */
    private $lgImprimante;

    public function getLgUserImprimqnteId(): ?string
    {
        return $this->lgUserImprimqnteId;
    }

    public function getStrName(): ?string
    {
        return $this->strName;
    }

    public function setStrName(?string $strName): self
    {
        $this->strName = $strName;

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

    public function getLgUser(): ?TUser
    {
        return $this->lgUser;
    }

    public function setLgUser(?TUser $lgUser): self
    {
        $this->lgUser = $lgUser;

        return $this;
    }

    public function getLgImprimante(): ?TImprimante
    {
        return $this->lgImprimante;
    }

    public function setLgImprimante(?TImprimante $lgImprimante): self
    {
        $this->lgImprimante = $lgImprimante;

        return $this;
    }


}

