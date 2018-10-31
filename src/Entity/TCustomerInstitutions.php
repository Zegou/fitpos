<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TCustomerInstitutions
 *
 * @ORM\Table(name="t_customer_institutions", uniqueConstraints={@ORM\UniqueConstraint(name="lg_CUSTOMER_INSTITUTIONS_ID", columns={"lg_CUSTOMER_INSTITUTIONS_ID"})}, indexes={@ORM\Index(name="lg_CUSTOMER_ID", columns={"lg_CUSTOMER_ID"}), @ORM\Index(name="t_customer_institutions_fk", columns={"lg_INSTITUTION_ID"})})
 * @ORM\Entity
 */
class TCustomerInstitutions
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_CUSTOMER_INSTITUTIONS_ID", type="string", length=50, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgCustomerInstitutionsId;

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
     * @var \TInstitutions
     *
     * @ORM\ManyToOne(targetEntity="TInstitutions")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_INSTITUTION_ID", referencedColumnName="lg_INSTITUTION_ID")
     * })
     */
    private $lgInstitution;

    /**
     * @var \TCustomer
     *
     * @ORM\ManyToOne(targetEntity="TCustomer")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_CUSTOMER_ID", referencedColumnName="lg_CUSTOMER_ID")
     * })
     */
    private $lgCustomer;

    public function getLgCustomerInstitutionsId(): ?string
    {
        return $this->lgCustomerInstitutionsId;
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

    public function getLgInstitution(): ?TInstitutions
    {
        return $this->lgInstitution;
    }

    public function setLgInstitution(?TInstitutions $lgInstitution): self
    {
        $this->lgInstitution = $lgInstitution;

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

