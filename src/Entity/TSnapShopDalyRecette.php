<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TSnapShopDalyRecette
 *
 * @ORM\Table(name="t_snap_shop_daly_recette", indexes={@ORM\Index(name="lg_TYPE_RECETTE_ID", columns={"lg_TYPE_RECETTE_ID"})})
 * @ORM\Entity
 */
class TSnapShopDalyRecette
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_ID", type="string", length=50, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgId;

    /**
     * @var float
     *
     * @ORM\Column(name="int_AMOUNT", type="float", precision=15, scale=3, nullable=true)
     */
    private $intAmount;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_DAY", type="date", nullable=true)
     */
    private $dtDay;

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
     * @var integer
     *
     * @ORM\Column(name="int_NUMBER_TRANSACTION", type="integer", nullable=true)
     */
    private $intNumberTransaction;

    /**
     * @var \TTypeRecette
     *
     * @ORM\ManyToOne(targetEntity="TTypeRecette")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_TYPE_RECETTE_ID", referencedColumnName="lg_TYPE_RECETTE_ID")
     * })
     */
    private $lgTypeRecette;

    public function getLgId(): ?string
    {
        return $this->lgId;
    }

    public function getIntAmount(): ?float
    {
        return $this->intAmount;
    }

    public function setIntAmount(?float $intAmount): self
    {
        $this->intAmount = $intAmount;

        return $this;
    }

    public function getDtDay(): ?\DateTimeInterface
    {
        return $this->dtDay;
    }

    public function setDtDay(?\DateTimeInterface $dtDay): self
    {
        $this->dtDay = $dtDay;

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

    public function getIntNumberTransaction(): ?int
    {
        return $this->intNumberTransaction;
    }

    public function setIntNumberTransaction(?int $intNumberTransaction): self
    {
        $this->intNumberTransaction = $intNumberTransaction;

        return $this;
    }

    public function getLgTypeRecette(): ?TTypeRecette
    {
        return $this->lgTypeRecette;
    }

    public function setLgTypeRecette(?TTypeRecette $lgTypeRecette): self
    {
        $this->lgTypeRecette = $lgTypeRecette;

        return $this;
    }


}

