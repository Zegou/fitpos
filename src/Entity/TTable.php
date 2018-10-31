<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TTable
 *
 * @ORM\Table(name="t_table", uniqueConstraints={@ORM\UniqueConstraint(name="lg_TABLE_ID", columns={"lg_TABLE_ID"})})
 * @ORM\Entity
 */
class TTable
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_TABLE_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgTableId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="string", length=40, nullable=true)
     */
    private $strName;

    /**
     * @var string
     *
     * @ORM\Column(name="str_PIC_ORIGINALE", type="text", length=65535, nullable=true)
     */
    private $strPicOriginale;

    /**
     * @var string
     *
     * @ORM\Column(name="str_PIC_SMALL", type="text", length=65535, nullable=true)
     */
    private $strPicSmall;

    /**
     * @var string
     *
     * @ORM\Column(name="str_PIC_MIDDLE", type="text", length=65535, nullable=true)
     */
    private $strPicMiddle;

    /**
     * @var string
     *
     * @ORM\Column(name="str_PIC_BIG", type="text", length=65535, nullable=true)
     */
    private $strPicBig;

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

    public function getLgTableId(): ?string
    {
        return $this->lgTableId;
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

    public function getStrPicOriginale(): ?string
    {
        return $this->strPicOriginale;
    }

    public function setStrPicOriginale(?string $strPicOriginale): self
    {
        $this->strPicOriginale = $strPicOriginale;

        return $this;
    }

    public function getStrPicSmall(): ?string
    {
        return $this->strPicSmall;
    }

    public function setStrPicSmall(?string $strPicSmall): self
    {
        $this->strPicSmall = $strPicSmall;

        return $this;
    }

    public function getStrPicMiddle(): ?string
    {
        return $this->strPicMiddle;
    }

    public function setStrPicMiddle(?string $strPicMiddle): self
    {
        $this->strPicMiddle = $strPicMiddle;

        return $this;
    }

    public function getStrPicBig(): ?string
    {
        return $this->strPicBig;
    }

    public function setStrPicBig(?string $strPicBig): self
    {
        $this->strPicBig = $strPicBig;

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


}

