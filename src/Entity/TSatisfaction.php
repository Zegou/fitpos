<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TSatisfaction
 *
 * @ORM\Table(name="t_satisfaction")
 * @ORM\Entity
 */
class TSatisfaction
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_SATISFACTION_ID", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgSatisfactionId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="string", length=20, nullable=true)
     */
    private $strName;

    /**
     * @var string
     *
     * @ORM\Column(name="str_QUESTION_1", type="string", length=20, nullable=true)
     */
    private $strQuestion1;

    /**
     * @var string
     *
     * @ORM\Column(name="str_QUESTION_2", type="string", length=20, nullable=true)
     */
    private $strQuestion2;

    /**
     * @var string
     *
     * @ORM\Column(name="str_QUESTION_3", type="string", length=20, nullable=true)
     */
    private $strQuestion3;

    /**
     * @var string
     *
     * @ORM\Column(name="str_REPONSE", type="string", length=20, nullable=true)
     */
    private $strReponse;

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

    public function getLgSatisfactionId(): ?string
    {
        return $this->lgSatisfactionId;
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

    public function getStrQuestion1(): ?string
    {
        return $this->strQuestion1;
    }

    public function setStrQuestion1(?string $strQuestion1): self
    {
        $this->strQuestion1 = $strQuestion1;

        return $this;
    }

    public function getStrQuestion2(): ?string
    {
        return $this->strQuestion2;
    }

    public function setStrQuestion2(?string $strQuestion2): self
    {
        $this->strQuestion2 = $strQuestion2;

        return $this;
    }

    public function getStrQuestion3(): ?string
    {
        return $this->strQuestion3;
    }

    public function setStrQuestion3(?string $strQuestion3): self
    {
        $this->strQuestion3 = $strQuestion3;

        return $this;
    }

    public function getStrReponse(): ?string
    {
        return $this->strReponse;
    }

    public function setStrReponse(?string $strReponse): self
    {
        $this->strReponse = $strReponse;

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


}

