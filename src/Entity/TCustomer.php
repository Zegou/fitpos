<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TCustomer
 *
 * @ORM\Table(name="t_customer", uniqueConstraints={@ORM\UniqueConstraint(name="lg_CUSTOMER_ID", columns={"lg_CUSTOMER_ID"}), @ORM\UniqueConstraint(name="str_LOGIN", columns={"str_LOGIN"})}, indexes={@ORM\Index(name="t_customer_fk", columns={"lg_Language_ID"}), @ORM\Index(name="t_customer_fk1", columns={"lg_SKIN_ID"})})
 * @ORM\Entity
 */
class TCustomer
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_CUSTOMER_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgCustomerId = '';

    /**
     * @var string
     *
     * @ORM\Column(name="str_LOGIN", type="string", length=208, nullable=true)
     */
    private $strLogin;

    /**
     * @var string
     *
     * @ORM\Column(name="str_PASSWORD", type="string", length=40, nullable=true)
     */
    private $strPassword;

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
     * @ORM\Column(name="str_FIRST_NAME", type="string", length=50, nullable=true)
     */
    private $strFirstName;

    /**
     * @var string
     *
     * @ORM\Column(name="str_LAST_NAME", type="string", length=40, nullable=true)
     */
    private $strLastName;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="str_LAST_CONNECTION_DATE", type="datetime", nullable=true)
     */
    private $strLastConnectionDate;

    /**
     * @var string
     *
     * @ORM\Column(name="str_STATUT", type="string", length=20, nullable=true)
     */
    private $strStatut;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_LAST_ACTIVITY", type="datetime", nullable=true)
     */
    private $dtLastActivity;

    /**
     * @var string
     *
     * @ORM\Column(name="FUNCTION", type="string", length=20, nullable=true)
     */
    private $function;

    /**
     * @var string
     *
     * @ORM\Column(name="str_PHONE", type="string", length=20, nullable=true)
     */
    private $strPhone;

    /**
     * @var string
     *
     * @ORM\Column(name="str_MAIL", type="string", length=208, nullable=true)
     */
    private $strMail;

    /**
     * @var string
     *
     * @ORM\Column(name="str_ADRESSE", type="text", length=65535, nullable=true)
     */
    private $strAdresse;

    /**
     * @var string
     *
     * @ORM\Column(name="str_GPS", type="text", length=65535, nullable=true)
     */
    private $strGps;

    /**
     * @var string
     *
     * @ORM\Column(name="str_AUTH_METHODE", type="string", length=40, nullable=true)
     */
    private $strAuthMethode = 'FLEX_COMPTA';

    /**
     * @var string
     *
     * @ORM\Column(name="str_UID_EXT", type="text", length=65535, nullable=true)
     */
    private $strUidExt;

    /**
     * @var \TLanguage
     *
     * @ORM\ManyToOne(targetEntity="TLanguage")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_Language_ID", referencedColumnName="lg_Language_ID")
     * })
     */
    private $lgLanguage;

    /**
     * @var \TSkin
     *
     * @ORM\ManyToOne(targetEntity="TSkin")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_SKIN_ID", referencedColumnName="lg_SKIN_ID")
     * })
     */
    private $lgSkin;

    public function getLgCustomerId(): ?string
    {
        return $this->lgCustomerId;
    }

    public function getStrLogin(): ?string
    {
        return $this->strLogin;
    }

    public function setStrLogin(?string $strLogin): self
    {
        $this->strLogin = $strLogin;

        return $this;
    }

    public function getStrPassword(): ?string
    {
        return $this->strPassword;
    }

    public function setStrPassword(?string $strPassword): self
    {
        $this->strPassword = $strPassword;

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

    public function getStrFirstName(): ?string
    {
        return $this->strFirstName;
    }

    public function setStrFirstName(?string $strFirstName): self
    {
        $this->strFirstName = $strFirstName;

        return $this;
    }

    public function getStrLastName(): ?string
    {
        return $this->strLastName;
    }

    public function setStrLastName(?string $strLastName): self
    {
        $this->strLastName = $strLastName;

        return $this;
    }

    public function getStrLastConnectionDate(): ?\DateTimeInterface
    {
        return $this->strLastConnectionDate;
    }

    public function setStrLastConnectionDate(?\DateTimeInterface $strLastConnectionDate): self
    {
        $this->strLastConnectionDate = $strLastConnectionDate;

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

    public function getDtLastActivity(): ?\DateTimeInterface
    {
        return $this->dtLastActivity;
    }

    public function setDtLastActivity(?\DateTimeInterface $dtLastActivity): self
    {
        $this->dtLastActivity = $dtLastActivity;

        return $this;
    }

    public function getFunction(): ?string
    {
        return $this->function;
    }

    public function setFunction(?string $function): self
    {
        $this->function = $function;

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

    public function getStrMail(): ?string
    {
        return $this->strMail;
    }

    public function setStrMail(?string $strMail): self
    {
        $this->strMail = $strMail;

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

    public function getStrGps(): ?string
    {
        return $this->strGps;
    }

    public function setStrGps(?string $strGps): self
    {
        $this->strGps = $strGps;

        return $this;
    }

    public function getStrAuthMethode(): ?string
    {
        return $this->strAuthMethode;
    }

    public function setStrAuthMethode(?string $strAuthMethode): self
    {
        $this->strAuthMethode = $strAuthMethode;

        return $this;
    }

    public function getStrUidExt(): ?string
    {
        return $this->strUidExt;
    }

    public function setStrUidExt(?string $strUidExt): self
    {
        $this->strUidExt = $strUidExt;

        return $this;
    }

    public function getLgLanguage(): ?TLanguage
    {
        return $this->lgLanguage;
    }

    public function setLgLanguage(?TLanguage $lgLanguage): self
    {
        $this->lgLanguage = $lgLanguage;

        return $this;
    }

    public function getLgSkin(): ?TSkin
    {
        return $this->lgSkin;
    }

    public function setLgSkin(?TSkin $lgSkin): self
    {
        $this->lgSkin = $lgSkin;

        return $this;
    }


}

