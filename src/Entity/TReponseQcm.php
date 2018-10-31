<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TReponseQcm
 *
 * @ORM\Table(name="t_reponse_qcm", indexes={@ORM\Index(name="lg_QUEST_QCM_ID", columns={"lg_QUEST_QCM_ID"})})
 * @ORM\Entity
 */
class TReponseQcm
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_REPONSE_QCM_ID", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgReponseQcmId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_VALUE", type="string", length=20, nullable=true)
     */
    private $strValue;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="string", length=20, nullable=true)
     */
    private $strDescription;

    /**
     * @var string
     *
     * @ORM\Column(name="str_PHONE", type="string", length=20, nullable=true)
     */
    private $strPhone;

    /**
     * @var string
     *
     * @ORM\Column(name="str_EMAIL", type="string", length=20, nullable=true)
     */
    private $strEmail;

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
     * @var \TQuestQcm
     *
     * @ORM\ManyToOne(targetEntity="TQuestQcm")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_QUEST_QCM_ID", referencedColumnName="lg_QUEST_QCM_ID")
     * })
     */
    private $lgQuestQcm;

    public function getLgReponseQcmId(): ?string
    {
        return $this->lgReponseQcmId;
    }

    public function getStrValue(): ?string
    {
        return $this->strValue;
    }

    public function setStrValue(?string $strValue): self
    {
        $this->strValue = $strValue;

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

    public function getStrPhone(): ?string
    {
        return $this->strPhone;
    }

    public function setStrPhone(?string $strPhone): self
    {
        $this->strPhone = $strPhone;

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

    public function getLgQuestQcm(): ?TQuestQcm
    {
        return $this->lgQuestQcm;
    }

    public function setLgQuestQcm(?TQuestQcm $lgQuestQcm): self
    {
        $this->lgQuestQcm = $lgQuestQcm;

        return $this;
    }


}

