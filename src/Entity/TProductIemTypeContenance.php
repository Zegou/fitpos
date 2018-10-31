<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TProductIemTypeContenance
 *
 * @ORM\Table(name="t_product_iem_type_contenance", uniqueConstraints={@ORM\UniqueConstraint(name="lg_PRODUCT_ITEM_ID", columns={"lg_PRODUCT_ITEM_ID"})}, indexes={@ORM\Index(name="lg_TYPE_CONTENANCE_ID", columns={"lg_TYPE_CONTENANCE_ID"})})
 * @ORM\Entity
 */
class TProductIemTypeContenance
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_PRODUCT_ITEM_TYPE_CONTENANCE_ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgProductItemTypeContenanceId;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_NUMBER", type="integer", nullable=true)
     */
    private $intNumber;

    /**
     * @var string
     *
     * @ORM\Column(name="str_STATUT", type="string", length=20, nullable=true)
     */
    private $strStatut;

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

    /**
     * @var \TTypeContenance
     *
     * @ORM\ManyToOne(targetEntity="TTypeContenance")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_TYPE_CONTENANCE_ID", referencedColumnName="lg_TYPE_CONTENANCE_ID")
     * })
     */
    private $lgTypeContenance;

    public function getLgProductItemTypeContenanceId(): ?string
    {
        return $this->lgProductItemTypeContenanceId;
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

    public function getStrStatut(): ?string
    {
        return $this->strStatut;
    }

    public function setStrStatut(?string $strStatut): self
    {
        $this->strStatut = $strStatut;

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

    public function getLgTypeContenance(): ?TTypeContenance
    {
        return $this->lgTypeContenance;
    }

    public function setLgTypeContenance(?TTypeContenance $lgTypeContenance): self
    {
        $this->lgTypeContenance = $lgTypeContenance;

        return $this;
    }


}

