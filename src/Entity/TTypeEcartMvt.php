<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TTypeEcartMvt
 *
 * @ORM\Table(name="t_type_ecart_mvt", uniqueConstraints={@ORM\UniqueConstraint(name="lg_TYPE_ECART_MVT", columns={"lg_TYPE_ECART_MVT"})})
 * @ORM\Entity
 */
class TTypeEcartMvt
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_TYPE_ECART_MVT", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgTypeEcartMvt;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="string", length=40, nullable=true)
     */
    private $strName;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="string", length=40, nullable=true)
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

    public function getLgTypeEcartMvt(): ?string
    {
        return $this->lgTypeEcartMvt;
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


}

