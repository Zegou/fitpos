<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TProductItem
 *
 * @ORM\Table(name="t_product_item", uniqueConstraints={@ORM\UniqueConstraint(name="lg_PRODUCT_ITEM_ID", columns={"lg_PRODUCT_ITEM_ID"})}, indexes={@ORM\Index(name="lg_FAMILLE_ID", columns={"lg_FAMILLE_ID"})})
 * @ORM\Entity
 */
class TProductItem
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_PRODUCT_ITEM_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgProductItemId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="string", length=50, nullable=true)
     */
    private $strName;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="string", length=50, nullable=true)
     */
    private $strDescription;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_PRICE", type="integer", nullable=true)
     */
    private $intPrice;

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
     * @ORM\Column(name="str_STATUT", type="string", length=20, nullable=false)
     */
    private $strStatut;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_STOCK_MINIMAL", type="integer", nullable=true)
     */
    private $intStockMinimal = '0';

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
     * @var boolean
     *
     * @ORM\Column(name="b_IS_COMMENTAIRE", type="boolean", nullable=true)
     */
    private $bIsCommentaire = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="b_IS_COMPILATION", type="boolean", nullable=true)
     */
    private $bIsCompilation = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="b_IS_FOR_SALE", type="boolean", nullable=true)
     */
    private $bIsForSale = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="b_IS_IN_CA", type="boolean", nullable=true)
     */
    private $bIsInCa;

    /**
     * @var boolean
     *
     * @ORM\Column(name="b_IS_PROGRAMMABLE_PRICE", type="boolean", nullable=true)
     */
    private $bIsProgrammablePrice;

    /**
     * @var boolean
     *
     * @ORM\Column(name="b_IS_REMISED", type="boolean", nullable=true)
     */
    private $bIsRemised = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="int_PRIX_ACHAT", type="integer", nullable=true)
     */
    private $intPrixAchat = '0';

    /**
     * @var \TFamille
     *
     * @ORM\ManyToOne(targetEntity="TFamille")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_FAMILLE_ID", referencedColumnName="lg_FAMILLE_ID")
     * })
     */
    private $lgFamille;

    public function getLgProductItemId(): ?string
    {
        return $this->lgProductItemId;
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

    public function getIntPrice(): ?int
    {
        return $this->intPrice;
    }

    public function setIntPrice(?int $intPrice): self
    {
        $this->intPrice = $intPrice;

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

    public function setStrStatut(string $strStatut): self
    {
        $this->strStatut = $strStatut;

        return $this;
    }

    public function getIntStockMinimal(): ?int
    {
        return $this->intStockMinimal;
    }

    public function setIntStockMinimal(?int $intStockMinimal): self
    {
        $this->intStockMinimal = $intStockMinimal;

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

    public function getBIsCommentaire(): ?bool
    {
        return $this->bIsCommentaire;
    }

    public function setBIsCommentaire(?bool $bIsCommentaire): self
    {
        $this->bIsCommentaire = $bIsCommentaire;

        return $this;
    }

    public function getBIsCompilation(): ?bool
    {
        return $this->bIsCompilation;
    }

    public function setBIsCompilation(?bool $bIsCompilation): self
    {
        $this->bIsCompilation = $bIsCompilation;

        return $this;
    }

    public function getBIsForSale(): ?bool
    {
        return $this->bIsForSale;
    }

    public function setBIsForSale(?bool $bIsForSale): self
    {
        $this->bIsForSale = $bIsForSale;

        return $this;
    }

    public function getBIsInCa(): ?bool
    {
        return $this->bIsInCa;
    }

    public function setBIsInCa(?bool $bIsInCa): self
    {
        $this->bIsInCa = $bIsInCa;

        return $this;
    }

    public function getBIsProgrammablePrice(): ?bool
    {
        return $this->bIsProgrammablePrice;
    }

    public function setBIsProgrammablePrice(?bool $bIsProgrammablePrice): self
    {
        $this->bIsProgrammablePrice = $bIsProgrammablePrice;

        return $this;
    }

    public function getBIsRemised(): ?bool
    {
        return $this->bIsRemised;
    }

    public function setBIsRemised(?bool $bIsRemised): self
    {
        $this->bIsRemised = $bIsRemised;

        return $this;
    }

    public function getIntPrixAchat(): ?int
    {
        return $this->intPrixAchat;
    }

    public function setIntPrixAchat(?int $intPrixAchat): self
    {
        $this->intPrixAchat = $intPrixAchat;

        return $this;
    }

    public function getLgFamille(): ?TFamille
    {
        return $this->lgFamille;
    }

    public function setLgFamille(?TFamille $lgFamille): self
    {
        $this->lgFamille = $lgFamille;

        return $this;
    }


}

