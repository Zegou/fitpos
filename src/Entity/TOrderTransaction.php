<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TOrderTransaction
 *
 * @ORM\Table(name="t_order_transaction", uniqueConstraints={@ORM\UniqueConstraint(name="lg_ORDER_TRANSACTION_ID", columns={"lg_ORDER_TRANSACTION_ID"})}, indexes={@ORM\Index(name="t_order_transaction_fk", columns={"lg_ORDER_ID"}), @ORM\Index(name="lg_PRODUCT_ITEM_ID", columns={"lg_PRODUCT_ITEM_ID"}), @ORM\Index(name="lg_ACCOMPAGNEMENT_ID", columns={"lg_ACCOMPAGNEMENT_ID"}), @ORM\Index(name="lg_COMMENTAIRE_ID", columns={"lg_COMMENTAIRE_ID"})})
 * @ORM\Entity
 */
class TOrderTransaction
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_ORDER_TRANSACTION_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgOrderTransactionId;

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
     * @ORM\Column(name="int_NUMBER", type="integer", nullable=true)
     */
    private $intNumber;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_NUMBER_UN_PAID", type="integer", nullable=true)
     */
    private $intNumberUnPaid;

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
     * @var \TCommentaire
     *
     * @ORM\ManyToOne(targetEntity="TCommentaire")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_COMMENTAIRE_ID", referencedColumnName="lg_COMMENTAIRE_ID")
     * })
     */
    private $lgCommentaire;

    /**
     * @var \TOrder
     *
     * @ORM\ManyToOne(targetEntity="TOrder")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_ORDER_ID", referencedColumnName="lg_ORDER_ID")
     * })
     */
    private $lgOrder;

    /**
     * @var \TProductItem
     *
     * @ORM\ManyToOne(targetEntity="TProductItem")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_PRODUCT_ITEM_ID", referencedColumnName="lg_PRODUCT_ITEM_ID")
     * })
     */
    private $lgProductItem;

    public function getLgOrderTransactionId(): ?string
    {
        return $this->lgOrderTransactionId;
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

    public function getIntNumber(): ?int
    {
        return $this->intNumber;
    }

    public function setIntNumber(?int $intNumber): self
    {
        $this->intNumber = $intNumber;

        return $this;
    }

    public function getIntNumberUnPaid(): ?int
    {
        return $this->intNumberUnPaid;
    }

    public function setIntNumberUnPaid(?int $intNumberUnPaid): self
    {
        $this->intNumberUnPaid = $intNumberUnPaid;

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

    public function getLgCommentaire(): ?TCommentaire
    {
        return $this->lgCommentaire;
    }

    public function setLgCommentaire(?TCommentaire $lgCommentaire): self
    {
        $this->lgCommentaire = $lgCommentaire;

        return $this;
    }

    public function getLgOrder(): ?TOrder
    {
        return $this->lgOrder;
    }

    public function setLgOrder(?TOrder $lgOrder): self
    {
        $this->lgOrder = $lgOrder;

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

