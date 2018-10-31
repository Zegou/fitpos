<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TCaisse
 *
 * @ORM\Table(name="t_caisse", indexes={@ORM\Index(name="lg_USER_ID", columns={"lg_USER_ID"})})
 * @ORM\Entity
 */
class TCaisse
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_CAISSE_ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgCaisseId;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_SOLDE", type="integer", nullable=true)
     */
    private $intSolde;

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
     * @var \TUser
     *
     * @ORM\ManyToOne(targetEntity="TUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_USER_ID", referencedColumnName="lg_USER_ID")
     * })
     */
    private $lgUser;

    public function getLgCaisseId(): ?string
    {
        return $this->lgCaisseId;
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

