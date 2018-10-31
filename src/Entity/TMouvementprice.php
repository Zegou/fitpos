<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TMouvementprice
 *
 * @ORM\Table(name="t_mouvementprice", indexes={@ORM\Index(name="FK_t_mouvementprice_t_famille", columns={"lg_FAMILLE_ID"}), @ORM\Index(name="FK_t_mouvementprice_t_user", columns={"lg_USER_ID"})})
 * @ORM\Entity
 */
class TMouvementprice
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_MOUVEMENTPRICE_ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgMouvementpriceId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_ACTION", type="string", length=40, nullable=false)
     */
    private $strAction;

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
     * @ORM\Column(name="int_PRICE_OLD", type="integer", nullable=true)
     */
    private $intPriceOld = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="int_PRICE_NEW", type="integer", nullable=true)
     */
    private $intPriceNew = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="int_ECART", type="integer", nullable=true)
     */
    private $intEcart = '0';

    /**
     * @var \TFamille
     *
     * @ORM\ManyToOne(targetEntity="TFamille")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_FAMILLE_ID", referencedColumnName="lg_FAMILLE_ID")
     * })
     */
    private $lgFamille;

    /**
     * @var \TUser
     *
     * @ORM\ManyToOne(targetEntity="TUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_USER_ID", referencedColumnName="lg_USER_ID")
     * })
     */
    private $lgUser;

    public function getLgMouvementpriceId(): ?string
    {
        return $this->lgMouvementpriceId;
    }

    public function getStrAction(): ?string
    {
        return $this->strAction;
    }

    public function setStrAction(string $strAction): self
    {
        $this->strAction = $strAction;

        return $this;
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

    public function getIntPriceOld(): ?int
    {
        return $this->intPriceOld;
    }

    public function setIntPriceOld(?int $intPriceOld): self
    {
        $this->intPriceOld = $intPriceOld;

        return $this;
    }

    public function getIntPriceNew(): ?int
    {
        return $this->intPriceNew;
    }

    public function setIntPriceNew(?int $intPriceNew): self
    {
        $this->intPriceNew = $intPriceNew;

        return $this;
    }

    public function getIntEcart(): ?int
    {
        return $this->intEcart;
    }

    public function setIntEcart(?int $intEcart): self
    {
        $this->intEcart = $intEcart;

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

