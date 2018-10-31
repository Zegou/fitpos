<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TCustomerAccount
 *
 * @ORM\Table(name="t_customer_account", uniqueConstraints={@ORM\UniqueConstraint(name="lg_CUSTOMER_ACCOUNT_ID", columns={"lg_CUSTOMER_ACCOUNT_ID"})}, indexes={@ORM\Index(name="t_customer_account_fk", columns={"lg_CUSTOMER_ID"})})
 * @ORM\Entity
 */
class TCustomerAccount
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_CUSTOMER_ACCOUNT_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgCustomerAccountId = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="int_SOLDE", type="integer", nullable=true)
     */
    private $intSolde = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="int_SOLDE_MINIMAL", type="integer", nullable=true)
     */
    private $intSoldeMinimal;

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
     * @ORM\Column(name="str_PASSWORD", type="string", length=50, nullable=true)
     */
    private $strPassword;

    /**
     * @var string
     *
     * @ORM\Column(name="str_LOGIN", type="string", length=50, nullable=true)
     */
    private $strLogin;

    /**
     * @var \TCustomer
     *
     * @ORM\ManyToOne(targetEntity="TCustomer")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_CUSTOMER_ID", referencedColumnName="lg_CUSTOMER_ID")
     * })
     */
    private $lgCustomer;

    public function getLgCustomerAccountId(): ?string
    {
        return $this->lgCustomerAccountId;
    }

    public function getIntSolde(): ?int
    {
        return $this->intSolde;
    }

    public function setIntSolde(?int $intSolde): self
    {
        $this->intSolde = $intSolde;

        return $this;
    }

    public function getIntSoldeMinimal(): ?int
    {
        return $this->intSoldeMinimal;
    }

    public function setIntSoldeMinimal(?int $intSoldeMinimal): self
    {
        $this->intSoldeMinimal = $intSoldeMinimal;

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

    public function getStrPassword(): ?string
    {
        return $this->strPassword;
    }

    public function setStrPassword(?string $strPassword): self
    {
        $this->strPassword = $strPassword;

        return $this;
    }

    public function getStrLogin(): ?string
    {
        return $this->strLogin;
    }

    public function setStrLogin(?string $strLogin): self
    {
        $this->strLogin = $strLogin;

        return $this;
    }

    public function getLgCustomer(): ?TCustomer
    {
        return $this->lgCustomer;
    }

    public function setLgCustomer(?TCustomer $lgCustomer): self
    {
        $this->lgCustomer = $lgCustomer;

        return $this;
    }


}

