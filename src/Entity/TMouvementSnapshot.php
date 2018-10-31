<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TMouvementSnapshot
 *
 * @ORM\Table(name="t_mouvement_snapshot", indexes={@ORM\Index(name="FK_t_mouvement_snapshot_t_famille", columns={"lg_FAMILLE_ID"})})
 * @ORM\Entity
 */
class TMouvementSnapshot
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_MOUVEMENT_SNAPSHOT_ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgMouvementSnapshotId;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_DAY", type="date", nullable=true)
     */
    private $dtDay;

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
     * @ORM\Column(name="int_STOCK_JOUR", type="integer", nullable=true)
     */
    private $intStockJour = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="int_NUMBERTRANSACTION", type="integer", nullable=true)
     */
    private $intNumbertransaction = '0';

    /**
     * @var \TFamille
     *
     * @ORM\ManyToOne(targetEntity="TFamille")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_FAMILLE_ID", referencedColumnName="lg_FAMILLE_ID")
     * })
     */
    private $lgFamille;

    public function getLgMouvementSnapshotId(): ?string
    {
        return $this->lgMouvementSnapshotId;
    }

    public function getDtDay(): ?\DateTimeInterface
    {
        return $this->dtDay;
    }

    public function setDtDay(?\DateTimeInterface $dtDay): self
    {
        $this->dtDay = $dtDay;

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

    public function getIntStockJour(): ?int
    {
        return $this->intStockJour;
    }

    public function setIntStockJour(?int $intStockJour): self
    {
        $this->intStockJour = $intStockJour;

        return $this;
    }

    public function getIntNumbertransaction(): ?int
    {
        return $this->intNumbertransaction;
    }

    public function setIntNumbertransaction(?int $intNumbertransaction): self
    {
        $this->intNumbertransaction = $intNumbertransaction;

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

