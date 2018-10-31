<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TLitOccupation
 *
 * @ORM\Table(name="t_lit_occupation", uniqueConstraints={@ORM\UniqueConstraint(name="lg_LIT_OCCUPATION_ID", columns={"lg_LIT_OCCUPATION_ID"})}, indexes={@ORM\Index(name="lg_LIT_ID", columns={"lg_LIT_ID"}), @ORM\Index(name="lg_CUSTOMER_ID", columns={"lg_CUSTOMER_ID"})})
 * @ORM\Entity
 */
class TLitOccupation
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_LIT_OCCUPATION_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgLitOccupationId;

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
     * @var \TLit
     *
     * @ORM\ManyToOne(targetEntity="TLit")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_LIT_ID", referencedColumnName="lg_LIT_ID")
     * })
     */
    private $lgLit;

    /**
     * @var \TCustomer
     *
     * @ORM\ManyToOne(targetEntity="TCustomer")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_CUSTOMER_ID", referencedColumnName="lg_CUSTOMER_ID")
     * })
     */
    private $lgCustomer;

    public function getLgLitOccupationId(): ?string
    {
        return $this->lgLitOccupationId;
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

    public function getLgLit(): ?TLit
    {
        return $this->lgLit;
    }

    public function setLgLit(?TLit $lgLit): self
    {
        $this->lgLit = $lgLit;

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

