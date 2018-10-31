<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TAlertEvent
 *
 * @ORM\Table(name="t_alert_event", uniqueConstraints={@ORM\UniqueConstraint(name="str_Event", columns={"str_Event"})})
 * @ORM\Entity
 */
class TAlertEvent
{
    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_Date_Envoi", type="datetime", nullable=true)
     */
    private $dtDateEnvoi;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_Max_Messages", type="integer", nullable=true)
     */
    private $intMaxMessages;

    /**
     * @var string
     *
     * @ORM\Column(name="str_Event", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $strEvent;

    /**
     * @var boolean
     *
     * @ORM\Column(name="b_IsCommand", type="boolean", nullable=true)
     */
    private $bIscommand = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="str_SMS_English_Text", type="text", length=65535, nullable=true)
     */
    private $strSmsEnglishText;

    /**
     * @var string
     *
     * @ORM\Column(name="dec_Num_Percent", type="decimal", precision=15, scale=6, nullable=true)
     */
    private $decNumPercent;

    /**
     * @var string
     *
     * @ORM\Column(name="str_MAIL_English_Text", type="text", length=65535, nullable=true)
     */
    private $strMailEnglishText;

    /**
     * @var boolean
     *
     * @ORM\Column(name="b_Row_Active", type="boolean", nullable=true)
     */
    private $bRowActive = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="str_SMS_French_Text", type="text", length=65535, nullable=true)
     */
    private $strSmsFrenchText;

    /**
     * @var string
     *
     * @ORM\Column(name="lg_UID_Who_New", type="string", length=20, nullable=true)
     */
    private $lgUidWhoNew;

    /**
     * @var string
     *
     * @ORM\Column(name="lg_UID_Who_Last_Update", type="string", length=20, nullable=true)
     */
    private $lgUidWhoLastUpdate;

    /**
     * @var string
     *
     * @ORM\Column(name="str_MAIL_French_Text", type="text", length=65535, nullable=true)
     */
    private $strMailFrenchText;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_Last_Enter_Date", type="datetime", nullable=true)
     */
    private $dtLastEnterDate;

    /**
     * @var string
     *
     * @ORM\Column(name="str_ERROR_CODE", type="string", length=20, nullable=true)
     */
    private $strErrorCode;

    public function getDtDateEnvoi(): ?\DateTimeInterface
    {
        return $this->dtDateEnvoi;
    }

    public function setDtDateEnvoi(?\DateTimeInterface $dtDateEnvoi): self
    {
        $this->dtDateEnvoi = $dtDateEnvoi;

        return $this;
    }

    public function getIntMaxMessages(): ?int
    {
        return $this->intMaxMessages;
    }

    public function setIntMaxMessages(?int $intMaxMessages): self
    {
        $this->intMaxMessages = $intMaxMessages;

        return $this;
    }

    public function getStrEvent(): ?string
    {
        return $this->strEvent;
    }

    public function getBIscommand(): ?bool
    {
        return $this->bIscommand;
    }

    public function setBIscommand(?bool $bIscommand): self
    {
        $this->bIscommand = $bIscommand;

        return $this;
    }

    public function getStrSmsEnglishText(): ?string
    {
        return $this->strSmsEnglishText;
    }

    public function setStrSmsEnglishText(?string $strSmsEnglishText): self
    {
        $this->strSmsEnglishText = $strSmsEnglishText;

        return $this;
    }

    public function getDecNumPercent()
    {
        return $this->decNumPercent;
    }

    public function setDecNumPercent($decNumPercent): self
    {
        $this->decNumPercent = $decNumPercent;

        return $this;
    }

    public function getStrMailEnglishText(): ?string
    {
        return $this->strMailEnglishText;
    }

    public function setStrMailEnglishText(?string $strMailEnglishText): self
    {
        $this->strMailEnglishText = $strMailEnglishText;

        return $this;
    }

    public function getBRowActive(): ?bool
    {
        return $this->bRowActive;
    }

    public function setBRowActive(?bool $bRowActive): self
    {
        $this->bRowActive = $bRowActive;

        return $this;
    }

    public function getStrSmsFrenchText(): ?string
    {
        return $this->strSmsFrenchText;
    }

    public function setStrSmsFrenchText(?string $strSmsFrenchText): self
    {
        $this->strSmsFrenchText = $strSmsFrenchText;

        return $this;
    }

    public function getLgUidWhoNew(): ?string
    {
        return $this->lgUidWhoNew;
    }

    public function setLgUidWhoNew(?string $lgUidWhoNew): self
    {
        $this->lgUidWhoNew = $lgUidWhoNew;

        return $this;
    }

    public function getLgUidWhoLastUpdate(): ?string
    {
        return $this->lgUidWhoLastUpdate;
    }

    public function setLgUidWhoLastUpdate(?string $lgUidWhoLastUpdate): self
    {
        $this->lgUidWhoLastUpdate = $lgUidWhoLastUpdate;

        return $this;
    }

    public function getStrMailFrenchText(): ?string
    {
        return $this->strMailFrenchText;
    }

    public function setStrMailFrenchText(?string $strMailFrenchText): self
    {
        $this->strMailFrenchText = $strMailFrenchText;

        return $this;
    }

    public function getDtLastEnterDate(): ?\DateTimeInterface
    {
        return $this->dtLastEnterDate;
    }

    public function setDtLastEnterDate(?\DateTimeInterface $dtLastEnterDate): self
    {
        $this->dtLastEnterDate = $dtLastEnterDate;

        return $this;
    }

    public function getStrErrorCode(): ?string
    {
        return $this->strErrorCode;
    }

    public function setStrErrorCode(?string $strErrorCode): self
    {
        $this->strErrorCode = $strErrorCode;

        return $this;
    }


}

