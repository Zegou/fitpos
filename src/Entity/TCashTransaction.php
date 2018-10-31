<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TCashTransaction
 *
 * @ORM\Table(name="t_cash_transaction")
 * @ORM\Entity
 */
class TCashTransaction
{
    /**
     * @var string
     *
     * @ORM\Column(name="ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="str_TRANSACTION_REF", type="string", length=20, nullable=true)
     */
    private $strTransactionRef;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_AMOUNT", type="integer", nullable=true)
     */
    private $intAmount;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_CREATED", type="datetime", nullable=true)
     */
    private $dtCreated;

    /**
     * @var string
     *
     * @ORM\Column(name="lg_CREATED_BY", type="string", length=40, nullable=true)
     */
    private $lgCreatedBy;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_UPDATED", type="datetime", nullable=true)
     */
    private $dtUpdated;

    /**
     * @var string
     *
     * @ORM\Column(name="lg_UPDATED_BY", type="string", length=40, nullable=true)
     */
    private $lgUpdatedBy;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="string", length=2000, nullable=true)
     */
    private $strDescription;

    /**
     * @var string
     *
     * @ORM\Column(name="lg_USER_ID", type="string", length=40, nullable=true)
     */
    private $lgUserId;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_AMOUNT_DEBIT", type="integer", nullable=true)
     */
    private $intAmountDebit = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="int_AMOUNT_CREDIT", type="integer", nullable=true)
     */
    private $intAmountCredit = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="str_NUMERO_COMPTE", type="string", length=20, nullable=true)
     */
    private $strNumeroCompte = '0000001';

    public function getId(): ?string
    {
        return $this->id;
    }

    public function getStrTransactionRef(): ?string
    {
        return $this->strTransactionRef;
    }

    public function setStrTransactionRef(?string $strTransactionRef): self
    {
        $this->strTransactionRef = $strTransactionRef;

        return $this;
    }

    public function getIntAmount(): ?int
    {
        return $this->intAmount;
    }

    public function setIntAmount(?int $intAmount): self
    {
        $this->intAmount = $intAmount;

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

    public function getLgCreatedBy(): ?string
    {
        return $this->lgCreatedBy;
    }

    public function setLgCreatedBy(?string $lgCreatedBy): self
    {
        $this->lgCreatedBy = $lgCreatedBy;

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

    public function getLgUpdatedBy(): ?string
    {
        return $this->lgUpdatedBy;
    }

    public function setLgUpdatedBy(?string $lgUpdatedBy): self
    {
        $this->lgUpdatedBy = $lgUpdatedBy;

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

    public function getLgUserId(): ?string
    {
        return $this->lgUserId;
    }

    public function setLgUserId(?string $lgUserId): self
    {
        $this->lgUserId = $lgUserId;

        return $this;
    }

    public function getIntAmountDebit(): ?int
    {
        return $this->intAmountDebit;
    }

    public function setIntAmountDebit(?int $intAmountDebit): self
    {
        $this->intAmountDebit = $intAmountDebit;

        return $this;
    }

    public function getIntAmountCredit(): ?int
    {
        return $this->intAmountCredit;
    }

    public function setIntAmountCredit(?int $intAmountCredit): self
    {
        $this->intAmountCredit = $intAmountCredit;

        return $this;
    }

    public function getStrNumeroCompte(): ?string
    {
        return $this->strNumeroCompte;
    }

    public function setStrNumeroCompte(?string $strNumeroCompte): self
    {
        $this->strNumeroCompte = $strNumeroCompte;

        return $this;
    }


}

