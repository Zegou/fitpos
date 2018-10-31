<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TInstitutions
 *
 * @ORM\Table(name="t_institutions", uniqueConstraints={@ORM\UniqueConstraint(name="lg_INSTITUTION_ID", columns={"lg_INSTITUTION_ID"}), @ORM\UniqueConstraint(name="lg_INSTITUTION_ID_2", columns={"lg_INSTITUTION_ID"})})
 * @ORM\Entity
 */
class TInstitutions
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_INSTITUTION_ID", type="string", length=50, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgInstitutionId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="string", length=50, nullable=false)
     */
    private $strName;

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
    private $strStatut;

    /**
     * @var string
     *
     * @ORM\Column(name="str_ADRESSE", type="string", length=20, nullable=true)
     */
    private $strAdresse;

    /**
     * @var string
     *
     * @ORM\Column(name="str_EMAIL", type="string", length=20, nullable=true)
     */
    private $strEmail;

    /**
     * @var string
     *
     * @ORM\Column(name="str_LOGO_LARGE", type="string", length=20, nullable=true)
     */
    private $strLogoLarge;

    /**
     * @var string
     *
     * @ORM\Column(name="str_LOGO_MIDDLE", type="string", length=20, nullable=true)
     */
    private $strLogoMiddle;

    /**
     * @var string
     *
     * @ORM\Column(name="str_LOGO_SMALL", type="string", length=20, nullable=true)
     */
    private $strLogoSmall;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NUM_CONTRIBUABLE", type="string", length=20, nullable=true)
     */
    private $strNumContribuable;

    /**
     * @var string
     *
     * @ORM\Column(name="str_PARAM_1", type="string", length=20, nullable=true)
     */
    private $strParam1;

    /**
     * @var string
     *
     * @ORM\Column(name="str_PARAM_2", type="string", length=20, nullable=true)
     */
    private $strParam2;

    /**
     * @var string
     *
     * @ORM\Column(name="str_PARAM_3", type="string", length=20, nullable=true)
     */
    private $strParam3;

    /**
     * @var string
     *
     * @ORM\Column(name="str_PHONE", type="string", length=20, nullable=true)
     */
    private $strPhone;

    /**
     * @var string
     *
     * @ORM\Column(name="str_GPS", type="string", length=100, nullable=true)
     */
    private $strGps;

    public function getLgInstitutionId(): ?string
    {
        return $this->lgInstitutionId;
    }

    public function getStrName(): ?string
    {
        return $this->strName;
    }

    public function setStrName(string $strName): self
    {
        $this->strName = $strName;

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

    public function getStrAdresse(): ?string
    {
        return $this->strAdresse;
    }

    public function setStrAdresse(?string $strAdresse): self
    {
        $this->strAdresse = $strAdresse;

        return $this;
    }

    public function getStrEmail(): ?string
    {
        return $this->strEmail;
    }

    public function setStrEmail(?string $strEmail): self
    {
        $this->strEmail = $strEmail;

        return $this;
    }

    public function getStrLogoLarge(): ?string
    {
        return $this->strLogoLarge;
    }

    public function setStrLogoLarge(?string $strLogoLarge): self
    {
        $this->strLogoLarge = $strLogoLarge;

        return $this;
    }

    public function getStrLogoMiddle(): ?string
    {
        return $this->strLogoMiddle;
    }

    public function setStrLogoMiddle(?string $strLogoMiddle): self
    {
        $this->strLogoMiddle = $strLogoMiddle;

        return $this;
    }

    public function getStrLogoSmall(): ?string
    {
        return $this->strLogoSmall;
    }

    public function setStrLogoSmall(?string $strLogoSmall): self
    {
        $this->strLogoSmall = $strLogoSmall;

        return $this;
    }

    public function getStrNumContribuable(): ?string
    {
        return $this->strNumContribuable;
    }

    public function setStrNumContribuable(?string $strNumContribuable): self
    {
        $this->strNumContribuable = $strNumContribuable;

        return $this;
    }

    public function getStrParam1(): ?string
    {
        return $this->strParam1;
    }

    public function setStrParam1(?string $strParam1): self
    {
        $this->strParam1 = $strParam1;

        return $this;
    }

    public function getStrParam2(): ?string
    {
        return $this->strParam2;
    }

    public function setStrParam2(?string $strParam2): self
    {
        $this->strParam2 = $strParam2;

        return $this;
    }

    public function getStrParam3(): ?string
    {
        return $this->strParam3;
    }

    public function setStrParam3(?string $strParam3): self
    {
        $this->strParam3 = $strParam3;

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

    public function getStrGps(): ?string
    {
        return $this->strGps;
    }

    public function setStrGps(?string $strGps): self
    {
        $this->strGps = $strGps;

        return $this;
    }


}

