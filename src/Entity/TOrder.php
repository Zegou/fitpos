<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TOrder
 *
 * @ORM\Table(name="t_order", uniqueConstraints={@ORM\UniqueConstraint(name="lg_ORDER_ID", columns={"lg_ORDER_ID"})}, indexes={@ORM\Index(name="lg_TABLE_ID", columns={"lg_TABLE_ID"}), @ORM\Index(name="lg_USER_ID", columns={"lg_USER_ID"})})
 * @ORM\Entity
 */
class TOrder
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_ORDER_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgOrderId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="string", length=20, nullable=true)
     */
    private $strName;

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
     * @ORM\Column(name="dt_VALIDATED", type="datetime", nullable=true)
     */
    private $dtValidated;

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
     * @var string
     *
     * @ORM\Column(name="str_REF", type="string", length=30, nullable=true)
     */
    private $strRef;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_PRICE_UN_PAID", type="integer", nullable=true)
     */
    private $intPriceUnPaid;

    /**
     * @var \TTable
     *
     * @ORM\ManyToOne(targetEntity="TTable")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_TABLE_ID", referencedColumnName="lg_TABLE_ID")
     * })
     */
    private $lgTable;

    /**
     * @var \TUser
     *
     * @ORM\ManyToOne(targetEntity="TUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_USER_ID", referencedColumnName="lg_USER_ID")
     * })
     */
    private $lgUser;

    public function getLgOrderId(): ?string
    {
        return $this->lgOrderId;
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

    public function getDtValidated(): ?\DateTimeInterface
    {
        return $this->dtValidated;
    }

    public function setDtValidated(?\DateTimeInterface $dtValidated): self
    {
        $this->dtValidated = $dtValidated;

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

    public function getStrRef(): ?string
    {
        return $this->strRef;
    }

    public function setStrRef(?string $strRef): self
    {
        $this->strRef = $strRef;

        return $this;
    }

    public function getIntPriceUnPaid(): ?int
    {
        return $this->intPriceUnPaid;
    }

    public function setIntPriceUnPaid(?int $intPriceUnPaid): self
    {
        $this->intPriceUnPaid = $intPriceUnPaid;

        return $this;
    }

    public function getLgTable(): ?TTable
    {
        return $this->lgTable;
    }

    public function setLgTable(?TTable $lgTable): self
    {
        $this->lgTable = $lgTable;

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


}

