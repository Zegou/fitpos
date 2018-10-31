<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TTourneeLivraison
 *
 * @ORM\Table(name="t_tournee_livraison", uniqueConstraints={@ORM\UniqueConstraint(name="lg_TOURNEE_LIVRAISON_ID", columns={"lg_TOURNEE_LIVRAISON_ID"})}, indexes={@ORM\Index(name="lg_USER_ID", columns={"lg_USER_ID"})})
 * @ORM\Entity
 */
class TTourneeLivraison
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_TOURNEE_LIVRAISON_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgTourneeLivraisonId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="string", length=20, nullable=true)
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
     * @ORM\Column(name="str_STATUT", type="string", length=20, nullable=true)
     */
    private $strStatut;

    /**
     * @var string
     *
     * @ORM\Column(name="ZONNE", type="string", length=50, nullable=true)
     */
    private $zonne;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_DATE_TOURNEE", type="date", nullable=true)
     */
    private $dtDateTournee;

    /**
     * @var string
     *
     * @ORM\Column(name="str_GPS", type="string", length=40, nullable=true)
     */
    private $strGps;

    /**
     * @var string
     *
     * @ORM\Column(name="str_LAT", type="string", length=40, nullable=true)
     */
    private $strLat;

    /**
     * @var string
     *
     * @ORM\Column(name="str_LONG", type="string", length=40, nullable=true)
     */
    private $strLong;

    /**
     * @var string
     *
     * @ORM\Column(name="str_CONTACT", type="string", length=40, nullable=true)
     */
    private $strContact;

    /**
     * @var string
     *
     * @ORM\Column(name="str_REF_CODE", type="string", length=20, nullable=true)
     */
    private $strRefCode;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_START_DATE", type="datetime", nullable=true)
     */
    private $dtStartDate;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_END_DATE", type="datetime", nullable=true)
     */
    private $dtEndDate;

    /**
     * @var float
     *
     * @ORM\Column(name="int_PERCENT_PROCESS", type="float", precision=15, scale=3, nullable=true)
     */
    private $intPercentProcess;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_TOTAL", type="integer", nullable=true)
     */
    private $intTotal = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="int_TO_DO", type="integer", nullable=true)
     */
    private $intToDo = '0';

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_LAST_DATE_ACTIVITY", type="datetime", nullable=true)
     */
    private $dtLastDateActivity;

    /**
     * @var \TUser
     *
     * @ORM\ManyToOne(targetEntity="TUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_USER_ID", referencedColumnName="lg_USER_ID")
     * })
     */
    private $lgUser;

    public function getLgTourneeLivraisonId(): ?string
    {
        return $this->lgTourneeLivraisonId;
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

    public function getZonne(): ?string
    {
        return $this->zonne;
    }

    public function setZonne(?string $zonne): self
    {
        $this->zonne = $zonne;

        return $this;
    }

    public function getDtDateTournee(): ?\DateTimeInterface
    {
        return $this->dtDateTournee;
    }

    public function setDtDateTournee(?\DateTimeInterface $dtDateTournee): self
    {
        $this->dtDateTournee = $dtDateTournee;

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

    public function getStrLat(): ?string
    {
        return $this->strLat;
    }

    public function setStrLat(?string $strLat): self
    {
        $this->strLat = $strLat;

        return $this;
    }

    public function getStrLong(): ?string
    {
        return $this->strLong;
    }

    public function setStrLong(?string $strLong): self
    {
        $this->strLong = $strLong;

        return $this;
    }

    public function getStrContact(): ?string
    {
        return $this->strContact;
    }

    public function setStrContact(?string $strContact): self
    {
        $this->strContact = $strContact;

        return $this;
    }

    public function getStrRefCode(): ?string
    {
        return $this->strRefCode;
    }

    public function setStrRefCode(?string $strRefCode): self
    {
        $this->strRefCode = $strRefCode;

        return $this;
    }

    public function getDtStartDate(): ?\DateTimeInterface
    {
        return $this->dtStartDate;
    }

    public function setDtStartDate(?\DateTimeInterface $dtStartDate): self
    {
        $this->dtStartDate = $dtStartDate;

        return $this;
    }

    public function getDtEndDate(): ?\DateTimeInterface
    {
        return $this->dtEndDate;
    }

    public function setDtEndDate(?\DateTimeInterface $dtEndDate): self
    {
        $this->dtEndDate = $dtEndDate;

        return $this;
    }

    public function getIntPercentProcess(): ?float
    {
        return $this->intPercentProcess;
    }

    public function setIntPercentProcess(?float $intPercentProcess): self
    {
        $this->intPercentProcess = $intPercentProcess;

        return $this;
    }

    public function getIntTotal(): ?int
    {
        return $this->intTotal;
    }

    public function setIntTotal(?int $intTotal): self
    {
        $this->intTotal = $intTotal;

        return $this;
    }

    public function getIntToDo(): ?int
    {
        return $this->intToDo;
    }

    public function setIntToDo(?int $intToDo): self
    {
        $this->intToDo = $intToDo;

        return $this;
    }

    public function getDtLastDateActivity(): ?\DateTimeInterface
    {
        return $this->dtLastDateActivity;
    }

    public function setDtLastDateActivity(?\DateTimeInterface $dtLastDateActivity): self
    {
        $this->dtLastDateActivity = $dtLastDateActivity;

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

