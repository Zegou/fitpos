<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TProductItemAccompagnemement
 *
 * @ORM\Table(name="t_product_item_accompagnemement", indexes={@ORM\Index(name="lg_PRODUCT_ITEM_ID", columns={"lg_PRODUCT_ITEM_ID"}), @ORM\Index(name="lg_ACCOMPAGNEMENT_ID", columns={"lg_ACCOMPAGNEMENT_ID"})})
 * @ORM\Entity
 */
class TProductItemAccompagnemement
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_PRODUCT_ITEM_ACCOMPAGNEMENT_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgProductItemAccompagnementId;

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
     * @var \TAccompagnemement
     *
     * @ORM\ManyToOne(targetEntity="TAccompagnemement")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_ACCOMPAGNEMENT_ID", referencedColumnName="lg_ACCOMPAGNEMENT_ID")
     * })
     */
    private $lgAccompagnement;

    /**
     * @var \TProductItem
     *
     * @ORM\ManyToOne(targetEntity="TProductItem")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_PRODUCT_ITEM_ID", referencedColumnName="lg_PRODUCT_ITEM_ID")
     * })
     */
    private $lgProductItem;

    public function getLgProductItemAccompagnementId(): ?string
    {
        return $this->lgProductItemAccompagnementId;
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

    public function getLgAccompagnement(): ?TAccompagnemement
    {
        return $this->lgAccompagnement;
    }

    public function setLgAccompagnement(?TAccompagnemement $lgAccompagnement): self
    {
        $this->lgAccompagnement = $lgAccompagnement;

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

