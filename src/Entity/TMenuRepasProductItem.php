<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TMenuRepasProductItem
 *
 * @ORM\Table(name="t_menu_repas_product_item", uniqueConstraints={@ORM\UniqueConstraint(name="lg_MENU_REPAS_PRODUCT_ITEM_ID", columns={"lg_MENU_REPAS_PRODUCT_ITEM_ID"}), @ORM\UniqueConstraint(name="lg_MENU_REPAS_ID_uk", columns={"lg_MENU_REPAS_ID", "lg_PRODUCT_ITEM_ID", "str_NAME"})}, indexes={@ORM\Index(name="lg_MENU_REPAS_ID", columns={"lg_MENU_REPAS_ID"}), @ORM\Index(name="lg_PRODUCT_ITEM_ID", columns={"lg_PRODUCT_ITEM_ID"})})
 * @ORM\Entity
 */
class TMenuRepasProductItem
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_MENU_REPAS_PRODUCT_ITEM_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgMenuRepasProductItemId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="string", length=20, nullable=true)
     */
    private $strName;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="text", length=65535, nullable=true)
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
     * @var \TMenuRepas
     *
     * @ORM\ManyToOne(targetEntity="TMenuRepas")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_MENU_REPAS_ID", referencedColumnName="lg_MENU_REPAS_ID")
     * })
     */
    private $lgMenuRepas;

    public function getLgMenuRepasProductItemId(): ?string
    {
        return $this->lgMenuRepasProductItemId;
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

    public function getLgProductItem(): ?TProductItem
    {
        return $this->lgProductItem;
    }

    public function setLgProductItem(?TProductItem $lgProductItem): self
    {
        $this->lgProductItem = $lgProductItem;

        return $this;
    }

    public function getLgMenuRepas(): ?TMenuRepas
    {
        return $this->lgMenuRepas;
    }

    public function setLgMenuRepas(?TMenuRepas $lgMenuRepas): self
    {
        $this->lgMenuRepas = $lgMenuRepas;

        return $this;
    }


}

