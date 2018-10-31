<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TProductItemStock
 *
 * @ORM\Table(name="t_product_item_stock", indexes={@ORM\Index(name="lg_PRODUCT_ITEM_ID", columns={"lg_PRODUCT_ITEM_ID"})})
 * @ORM\Entity
 */
class TProductItemStock
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_PRODUCT_ITEM_STOCK_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgProductItemStockId;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_NUMBER", type="integer", nullable=true)
     */
    private $intNumber;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_NUMBER_AVAILABLE", type="integer", nullable=true)
     */
    private $intNumberAvailable;

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
     * @var \TProductItem
     *
     * @ORM\ManyToOne(targetEntity="TProductItem")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_PRODUCT_ITEM_ID", referencedColumnName="lg_PRODUCT_ITEM_ID")
     * })
     */
    private $lgProductItem;

    public function getLgProductItemStockId(): ?string
    {
        return $this->lgProductItemStockId;
    }

    public function getIntNumber(): ?int
    {
        return $this->intNumber;
    }

    public function setIntNumber(?int $intNumber): self
    {
        $this->intNumber = $intNumber;

        return $this;
    }

    public function getIntNumberAvailable(): ?int
    {
        return $this->intNumberAvailable;
    }

    public function setIntNumberAvailable(?int $intNumberAvailable): self
    {
        $this->intNumberAvailable = $intNumberAvailable;

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

    public function getLgProductItem(): ?TProductItem
    {
        return $this->lgProductItem;
    }

    public function setLgProductItem(?TProductItem $lgProductItem): self
    {
        $this->lgProductItem = $lgProductItem;

        return $this;
    }


}

