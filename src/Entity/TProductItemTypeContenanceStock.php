<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TProductItemTypeContenanceStock
 *
 * @ORM\Table(name="t_product_item_type_contenance_stock", indexes={@ORM\Index(name="lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID", columns={"lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID"})})
 * @ORM\Entity
 */
class TProductItemTypeContenanceStock
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_PRODUCT_ITEM_TYPE_CONTENANCE_STOCK_ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgProductItemTypeContenanceStockId;

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
     * @var \TProductIemTypeContenance
     *
     * @ORM\ManyToOne(targetEntity="TProductIemTypeContenance")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID", referencedColumnName="lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID")
     * })
     */
    private $lgProductItemTypeContenance;

    public function getLgProductItemTypeContenanceStockId(): ?string
    {
        return $this->lgProductItemTypeContenanceStockId;
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

    public function getLgProductItemTypeContenance(): ?TProductIemTypeContenance
    {
        return $this->lgProductItemTypeContenance;
    }

    public function setLgProductItemTypeContenance(?TProductIemTypeContenance $lgProductItemTypeContenance): self
    {
        $this->lgProductItemTypeContenance = $lgProductItemTypeContenance;

        return $this;
    }


}

