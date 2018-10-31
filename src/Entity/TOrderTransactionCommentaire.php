<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TOrderTransactionCommentaire
 *
 * @ORM\Table(name="t_order_transaction_commentaire", indexes={@ORM\Index(name="lg_ORDER_TRANSACTION_ID", columns={"lg_ORDER_TRANSACTION_ID"}), @ORM\Index(name="lg_COMMENTAIRE_ID", columns={"lg_COMMENTAIRE_ID"})})
 * @ORM\Entity
 */
class TOrderTransactionCommentaire
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_STATUT", type="string", length=20, nullable=true)
     */
    private $strStatut;

    /**
     * @var integer
     *
     * @ORM\Column(name="dt_CREATED", type="integer", nullable=true)
     */
    private $dtCreated;

    /**
     * @var integer
     *
     * @ORM\Column(name="dt_UPDATED", type="integer", nullable=true)
     */
    private $dtUpdated;

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
     * @var \TOrderTransaction
     *
     * @ORM\ManyToOne(targetEntity="TOrderTransaction")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_ORDER_TRANSACTION_ID", referencedColumnName="lg_ORDER_TRANSACTION_ID")
     * })
     */
    private $lgOrderTransaction;

    public function getLgId(): ?string
    {
        return $this->lgId;
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

    public function getDtCreated(): ?int
    {
        return $this->dtCreated;
    }

    public function setDtCreated(?int $dtCreated): self
    {
        $this->dtCreated = $dtCreated;

        return $this;
    }

    public function getDtUpdated(): ?int
    {
        return $this->dtUpdated;
    }

    public function setDtUpdated(?int $dtUpdated): self
    {
        $this->dtUpdated = $dtUpdated;

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

    public function getLgOrderTransaction(): ?TOrderTransaction
    {
        return $this->lgOrderTransaction;
    }

    public function setLgOrderTransaction(?TOrderTransaction $lgOrderTransaction): self
    {
        $this->lgOrderTransaction = $lgOrderTransaction;

        return $this;
    }


}

