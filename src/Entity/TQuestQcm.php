<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TQuestQcm
 *
 * @ORM\Table(name="t_quest_qcm")
 * @ORM\Entity
 */
class TQuestQcm
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_QUEST_QCM_ID", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgQuestQcmId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="string", length=20, nullable=true)
     */
    private $strName;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="string", length=20, nullable=true)
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
     * @ORM\Column(name="dt_UPDATE", type="datetime", nullable=true)
     */
    private $dtUpdate;

    public function getLgQuestQcmId(): ?string
    {
        return $this->lgQuestQcmId;
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

    public function getDtUpdate(): ?\DateTimeInterface
    {
        return $this->dtUpdate;
    }

    public function setDtUpdate(?\DateTimeInterface $dtUpdate): self
    {
        $this->dtUpdate = $dtUpdate;

        return $this;
    }


}

