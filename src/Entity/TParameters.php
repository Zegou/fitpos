<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TParameters
 *
 * @ORM\Table(name="t_parameters", uniqueConstraints={@ORM\UniqueConstraint(name="str_KEY", columns={"str_KEY"})})
 * @ORM\Entity
 */
class TParameters
{
    /**
     * @var string
     *
     * @ORM\Column(name="str_KEY", type="string", length=50, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $strKey;

    /**
     * @var string
     *
     * @ORM\Column(name="str_VALUE", type="text", length=65535, nullable=true)
     */
    private $strValue;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="string", length=50, nullable=true)
     */
    private $strDescription;

    /**
     * @var string
     *
     * @ORM\Column(name="str_STATUT", type="string", length=20, nullable=true)
     */
    private $strStatut = 'enable';

    /**
     * @var string
     *
     * @ORM\Column(name="str_IS_EN_KRYPTED", type="string", length=50, nullable=true)
     */
    private $strIsEnKrypted;

    /**
     * @var string
     *
     * @ORM\Column(name="str_SECTION_KEY", type="string", length=50, nullable=true)
     */
    private $strSectionKey;

    /**
     * @var string
     *
     * @ORM\Column(name="str_TYPE", type="string", length=20, nullable=true)
     */
    private $strType;

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

    public function getStrKey(): ?string
    {
        return $this->strKey;
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

    public function getStrStatut(): ?string
    {
        return $this->strStatut;
    }

    public function setStrStatut(?string $strStatut): self
    {
        $this->strStatut = $strStatut;

        return $this;
    }

    public function getStrIsEnKrypted(): ?string
    {
        return $this->strIsEnKrypted;
    }

    public function setStrIsEnKrypted(?string $strIsEnKrypted): self
    {
        $this->strIsEnKrypted = $strIsEnKrypted;

        return $this;
    }

    public function getStrSectionKey(): ?string
    {
        return $this->strSectionKey;
    }

    public function setStrSectionKey(?string $strSectionKey): self
    {
        $this->strSectionKey = $strSectionKey;

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

