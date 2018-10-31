<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TNotification
 *
 * @ORM\Table(name="t_notification", indexes={@ORM\Index(name="lg_USER_ID_IN", columns={"lg_USER_ID_IN"}), @ORM\Index(name="lg_USER_ID_OUT", columns={"lg_USER_ID_OUT"})})
 * @ORM\Entity
 */
class TNotification
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="string", length=200, nullable=true)
     */
    private $strDescription;

    /**
     * @var string
     *
     * @ORM\Column(name="str_CONTENT", type="text", length=65535, nullable=true)
     */
    private $strContent;

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
     * @ORM\Column(name="str_TYPE", type="string", length=40, nullable=true)
     */
    private $strType;

    /**
     * @var string
     *
     * @ORM\Column(name="str_REF_RESSOURCE", type="text", length=65535, nullable=true)
     */
    private $strRefRessource;

    /**
     * @var string
     *
     * @ORM\Column(name="str_CUST_ACCOUNT_ID", type="string", length=40, nullable=true)
     */
    private $strCustAccountId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_URL_PIC", type="text", length=65535, nullable=true)
     */
    private $strUrlPic;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="string", length=40, nullable=true)
     */
    private $strName;

    /**
     * @var string
     *
     * @ORM\Column(name="str_CHANNEL", type="string", length=40, nullable=true)
     */
    private $strChannel;

    /**
     * @var string
     *
     * @ORM\Column(name="str_CHANNEL_READ", type="string", length=20, nullable=true)
     */
    private $strChannelRead;

    /**
     * @var string
     *
     * @ORM\Column(name="str_GPS", type="string", length=50, nullable=true)
     */
    private $strGps;

    /**
     * @var \TUser
     *
     * @ORM\ManyToOne(targetEntity="TUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_USER_ID_IN", referencedColumnName="lg_USER_ID")
     * })
     */
    private $lgUserIn;

    /**
     * @var \TUser
     *
     * @ORM\ManyToOne(targetEntity="TUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_USER_ID_OUT", referencedColumnName="lg_USER_ID")
     * })
     */
    private $lgUserOut;

    public function getLgId(): ?string
    {
        return $this->lgId;
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

    public function getStrContent(): ?string
    {
        return $this->strContent;
    }

    public function setStrContent(?string $strContent): self
    {
        $this->strContent = $strContent;

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

    public function getStrType(): ?string
    {
        return $this->strType;
    }

    public function setStrType(?string $strType): self
    {
        $this->strType = $strType;

        return $this;
    }

    public function getStrRefRessource(): ?string
    {
        return $this->strRefRessource;
    }

    public function setStrRefRessource(?string $strRefRessource): self
    {
        $this->strRefRessource = $strRefRessource;

        return $this;
    }

    public function getStrCustAccountId(): ?string
    {
        return $this->strCustAccountId;
    }

    public function setStrCustAccountId(?string $strCustAccountId): self
    {
        $this->strCustAccountId = $strCustAccountId;

        return $this;
    }

    public function getStrUrlPic(): ?string
    {
        return $this->strUrlPic;
    }

    public function setStrUrlPic(?string $strUrlPic): self
    {
        $this->strUrlPic = $strUrlPic;

        return $this;
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

    public function getStrChannel(): ?string
    {
        return $this->strChannel;
    }

    public function setStrChannel(?string $strChannel): self
    {
        $this->strChannel = $strChannel;

        return $this;
    }

    public function getStrChannelRead(): ?string
    {
        return $this->strChannelRead;
    }

    public function setStrChannelRead(?string $strChannelRead): self
    {
        $this->strChannelRead = $strChannelRead;

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

    public function getLgUserIn(): ?TUser
    {
        return $this->lgUserIn;
    }

    public function setLgUserIn(?TUser $lgUserIn): self
    {
        $this->lgUserIn = $lgUserIn;

        return $this;
    }

    public function getLgUserOut(): ?TUser
    {
        return $this->lgUserOut;
    }

    public function setLgUserOut(?TUser $lgUserOut): self
    {
        $this->lgUserOut = $lgUserOut;

        return $this;
    }


}

