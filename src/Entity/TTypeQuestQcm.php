<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TTypeQuestQcm
 *
 * @ORM\Table(name="t_type_quest_qcm", indexes={@ORM\Index(name="lg_QUEST_QCM_ID", columns={"lg_QUEST_QCM_ID"})})
 * @ORM\Entity
 */
class TTypeQuestQcm
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_TYPE_QUEST_QCM_ID", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgTypeQuestQcmId;

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

    public function getLgTypeQuestQcmId(): ?string
    {
        return $this->lgTypeQuestQcmId;
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

