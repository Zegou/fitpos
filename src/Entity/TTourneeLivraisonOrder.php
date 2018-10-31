<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TTourneeLivraisonOrder
 *
 * @ORM\Table(name="t_tournee_livraison_order", uniqueConstraints={@ORM\UniqueConstraint(name="lg_TOURNEE_LIVRAISON_ORDER_ID", columns={"lg_TOURNEE_LIVRAISON_ORDER_ID"})}, indexes={@ORM\Index(name="lg_ORDER_ID", columns={"lg_ORDER_ID"}), @ORM\Index(name="lg_TOURNEE_LIVRAISON_ID", columns={"lg_TOURNEE_LIVRAISON_ID"})})
 * @ORM\Entity
 */
class TTourneeLivraisonOrder
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_TOURNEE_LIVRAISON_ORDER_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgTourneeLivraisonOrderId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="string", length=40, nullable=true)
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
     * @var \DateTime
     *
     * @ORM\Column(name="dt_DATE_PROCESS", type="datetime", nullable=true)
     */
    private $dtDateProcess;

    /**
     * @var string
     *
     * @ORM\Column(name="str_GPS", type="string", length=50, nullable=true)
     */
    private $strGps;

    /**
     * @var \TTourneeLivraison
     *
     * @ORM\ManyToOne(targetEntity="TTourneeLivraison")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_TOURNEE_LIVRAISON_ID", referencedColumnName="lg_TOURNEE_LIVRAISON_ID")
     * })
     */
    private $lgTourneeLivraison;

    /**
     * @var \TOrder
     *
     * @ORM\ManyToOne(targetEntity="TOrder")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_ORDER_ID", referencedColumnName="lg_ORDER_ID")
     * })
     */
    private $lgOrder;

    public function getLgTourneeLivraisonOrderId(): ?string
    {
        return $this->lgTourneeLivraisonOrderId;
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

    public function getDtDateProcess(): ?\DateTimeInterface
    {
        return $this->dtDateProcess;
    }

    public function setDtDateProcess(?\DateTimeInterface $dtDateProcess): self
    {
        $this->dtDateProcess = $dtDateProcess;

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

    public function getLgTourneeLivraison(): ?TTourneeLivraison
    {
        return $this->lgTourneeLivraison;
    }

    public function setLgTourneeLivraison(?TTourneeLivraison $lgTourneeLivraison): self
    {
        $this->lgTourneeLivraison = $lgTourneeLivraison;

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

