<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TWarehouseContenance
 *
 * @ORM\Table(name="t_warehouse_contenance", indexes={@ORM\Index(name="lg_USER_ID", columns={"lg_USER_ID"}), @ORM\Index(name="lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID", columns={"lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID"})})
 * @ORM\Entity
 */
class TWarehouseContenance
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_WAREHOUSE_CONTENANCE_ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgWarehouseContenanceId;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_NUMBER", type="integer", nullable=true)
     */
    private $intNumber;

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
     * @var \TUser
     *
     * @ORM\ManyToOne(targetEntity="TUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_USER_ID", referencedColumnName="lg_USER_ID")
     * })
     */
    private $lgUser;

    /**
     * @var \TProductIemTypeContenance
     *
     * @ORM\ManyToOne(targetEntity="TProductIemTypeContenance")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID", referencedColumnName="lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID")
     * })
     */
    private $lgProductItemTypeContenance;

    public function getLgWarehouseContenanceId(): ?string
    {
        return $this->lgWarehouseContenanceId;
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

    public function getLgUser(): ?TUser
    {
        return $this->lgUser;
    }

    public function setLgUser(?TUser $lgUser): self
    {
        $this->lgUser = $lgUser;

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

