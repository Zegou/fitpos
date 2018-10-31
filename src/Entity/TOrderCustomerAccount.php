<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TOrderCustomerAccount
 *
 * @ORM\Table(name="t_order_customer_account", uniqueConstraints={@ORM\UniqueConstraint(name="lg_ORDER_CUSTOMER_ACCOUNT_ID", columns={"lg_ORDER_CUSTOMER_ACCOUNT_ID"})}, indexes={@ORM\Index(name="lg_CUSTOMER_ACCOUNT_ID", columns={"lg_CUSTOMER_ACCOUNT_ID"}), @ORM\Index(name="lg_ORDER_ID", columns={"lg_ORDER_ID"}), @ORM\Index(name="lg_LIT_OCCUPATION_ID", columns={"lg_LIT_OCCUPATION_ID"}), @ORM\Index(name="lg_MENU_REPAS_ID", columns={"lg_MENU_REPAS_ID"})})
 * @ORM\Entity
 */
class TOrderCustomerAccount
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_ORDER_CUSTOMER_ACCOUNT_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgOrderCustomerAccountId;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_AMOUNT_DEMANDE", type="integer", nullable=true)
     */
    private $intAmountDemande;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_AMOUNT_RECU", type="integer", nullable=true)
     */
    private $intAmountRecu;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_AMOUNT_DIFFERENCE", type="integer", nullable=true)
     */
    private $intAmountDifference;

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
     * @var string
     *
     * @ORM\Column(name="lg_PARENT_ID", type="string", length=30, nullable=true)
     */
    private $lgParentId = '';

    /**
     * @var string
     *
     * @ORM\Column(name="lg_TYPE_MENU_ID", type="string", length=20, nullable=true)
     */
    private $lgTypeMenuId;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_DATE_ORDER", type="date", nullable=true)
     */
    private $dtDateOrder;

    /**
     * @var string
     *
     * @ORM\Column(name="str_GPS", type="text", length=65535, nullable=true)
     */
    private $strGps;

    /**
     * @var string
     *
     * @ORM\Column(name="str_PAYEMENT_METHODE", type="string", length=40, nullable=true)
     */
    private $strPayementMethode;

    /**
     * @var string
     *
     * @ORM\Column(name="str_ZONNE_1", type="text", length=65535, nullable=true)
     */
    private $strZonne1;

    /**
     * @var string
     *
     * @ORM\Column(name="str_ZONNE_2", type="text", length=65535, nullable=true)
     */
    private $strZonne2;

    /**
     * @var string
     *
     * @ORM\Column(name="str_ZONNE_3", type="text", length=65535, nullable=true)
     */
    private $strZonne3;

    /**
     * @var string
     *
     * @ORM\Column(name="str_ZONNE_4", type="text", length=65535, nullable=true)
     */
    private $strZonne4;

    /**
     * @var string
     *
     * @ORM\Column(name="str_ZONNE_5", type="text", length=65535, nullable=true)
     */
    private $strZonne5;

    /**
     * @var string
     *
     * @ORM\Column(name="str_ZONNE_6", type="text", length=65535, nullable=true)
     */
    private $strZonne6;

    /**
     * @var string
     *
     * @ORM\Column(name="str_ZONNE_7", type="text", length=65535, nullable=true)
     */
    private $strZonne7;

    /**
     * @var string
     *
     * @ORM\Column(name="str_REF_TOURNNEE", type="string", length=40, nullable=true)
     */
    private $strRefTournnee;

    /**
     * @var \TLitOccupation
     *
     * @ORM\ManyToOne(targetEntity="TLitOccupation")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_LIT_OCCUPATION_ID", referencedColumnName="lg_LIT_OCCUPATION_ID")
     * })
     */
    private $lgLitOccupation;

    /**
     * @var \TMenuRepas
     *
     * @ORM\ManyToOne(targetEntity="TMenuRepas")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_MENU_REPAS_ID", referencedColumnName="lg_MENU_REPAS_ID")
     * })
     */
    private $lgMenuRepas;

    /**
     * @var \TCustomerAccount
     *
     * @ORM\ManyToOne(targetEntity="TCustomerAccount")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_CUSTOMER_ACCOUNT_ID", referencedColumnName="lg_CUSTOMER_ACCOUNT_ID")
     * })
     */
    private $lgCustomerAccount;

    /**
     * @var \TOrder
     *
     * @ORM\ManyToOne(targetEntity="TOrder")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_ORDER_ID", referencedColumnName="lg_ORDER_ID")
     * })
     */
    private $lgOrder;

    public function getLgOrderCustomerAccountId(): ?string
    {
        return $this->lgOrderCustomerAccountId;
    }

    public function getIntAmountDemande(): ?int
    {
        return $this->intAmountDemande;
    }

    public function setIntAmountDemande(?int $intAmountDemande): self
    {
        $this->intAmountDemande = $intAmountDemande;

        return $this;
    }

    public function getIntAmountRecu(): ?int
    {
        return $this->intAmountRecu;
    }

    public function setIntAmountRecu(?int $intAmountRecu): self
    {
        $this->intAmountRecu = $intAmountRecu;

        return $this;
    }

    public function getIntAmountDifference(): ?int
    {
        return $this->intAmountDifference;
    }

    public function setIntAmountDifference(?int $intAmountDifference): self
    {
        $this->intAmountDifference = $intAmountDifference;

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

    public function getLgParentId(): ?string
    {
        return $this->lgParentId;
    }

    public function setLgParentId(?string $lgParentId): self
    {
        $this->lgParentId = $lgParentId;

        return $this;
    }

    public function getLgTypeMenuId(): ?string
    {
        return $this->lgTypeMenuId;
    }

    public function setLgTypeMenuId(?string $lgTypeMenuId): self
    {
        $this->lgTypeMenuId = $lgTypeMenuId;

        return $this;
    }

    public function getDtDateOrder(): ?\DateTimeInterface
    {
        return $this->dtDateOrder;
    }

    public function setDtDateOrder(?\DateTimeInterface $dtDateOrder): self
    {
        $this->dtDateOrder = $dtDateOrder;

        return $this;
    }

    public function getStrGps(): ?string
    {
        return $this->strGps;
    }

    public function setStrGps(?string $strGps): self
    {
        $this->strGps = $strGps;

        return $this;
    }

    public function getStrPayementMethode(): ?string
    {
        return $this->strPayementMethode;
    }

    public function setStrPayementMethode(?string $strPayementMethode): self
    {
        $this->strPayementMethode = $strPayementMethode;

        return $this;
    }

    public function getStrZonne1(): ?string
    {
        return $this->strZonne1;
    }

    public function setStrZonne1(?string $strZonne1): self
    {
        $this->strZonne1 = $strZonne1;

        return $this;
    }

    public function getStrZonne2(): ?string
    {
        return $this->strZonne2;
    }

    public function setStrZonne2(?string $strZonne2): self
    {
        $this->strZonne2 = $strZonne2;

        return $this;
    }

    public function getStrZonne3(): ?string
    {
        return $this->strZonne3;
    }

    public function setStrZonne3(?string $strZonne3): self
    {
        $this->strZonne3 = $strZonne3;

        return $this;
    }

    public function getStrZonne4(): ?string
    {
        return $this->strZonne4;
    }

    public function setStrZonne4(?string $strZonne4): self
    {
        $this->strZonne4 = $strZonne4;

        return $this;
    }

    public function getStrZonne5(): ?string
    {
        return $this->strZonne5;
    }

    public function setStrZonne5(?string $strZonne5): self
    {
        $this->strZonne5 = $strZonne5;

        return $this;
    }

    public function getStrZonne6(): ?string
    {
        return $this->strZonne6;
    }

    public function setStrZonne6(?string $strZonne6): self
    {
        $this->strZonne6 = $strZonne6;

        return $this;
    }

    public function getStrZonne7(): ?string
    {
        return $this->strZonne7;
    }

    public function setStrZonne7(?string $strZonne7): self
    {
        $this->strZonne7 = $strZonne7;

        return $this;
    }

    public function getStrRefTournnee(): ?string
    {
        return $this->strRefTournnee;
    }

    public function setStrRefTournnee(?string $strRefTournnee): self
    {
        $this->strRefTournnee = $strRefTournnee;

        return $this;
    }

    public function getLgLitOccupation(): ?TLitOccupation
    {
        return $this->lgLitOccupation;
    }

    public function setLgLitOccupation(?TLitOccupation $lgLitOccupation): self
    {
        $this->lgLitOccupation = $lgLitOccupation;

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

    public function getLgCustomerAccount(): ?TCustomerAccount
    {
        return $this->lgCustomerAccount;
    }

    public function setLgCustomerAccount(?TCustomerAccount $lgCustomerAccount): self
    {
        $this->lgCustomerAccount = $lgCustomerAccount;

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


}

