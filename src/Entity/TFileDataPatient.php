<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TFileDataPatient
 *
 * @ORM\Table(name="t_file_data_patient")
 * @ORM\Entity
 */
class TFileDataPatient
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_KEY", type="string", length=40, nullable=true)
     */
    private $strKey;

    /**
     * @var string
     *
     * @ORM\Column(name="str_FILE_NAME", type="string", length=40, nullable=true)
     */
    private $strFileName;

    /**
     * @var string
     *
     * @ORM\Column(name="LIT", type="string", length=40, nullable=true)
     */
    private $lit;

    /**
     * @var string
     *
     * @ORM\Column(name="DOSSIER", type="string", length=40, nullable=true)
     */
    private $dossier;

    /**
     * @var string
     *
     * @ORM\Column(name="PATIENT", type="string", length=40, nullable=true)
     */
    private $patient;

    /**
     * @var string
     *
     * @ORM\Column(name="MEDECIN", type="string", length=40, nullable=true)
     */
    private $medecin;

    /**
     * @var string
     *
     * @ORM\Column(name="PAYMENT", type="string", length=40, nullable=true)
     */
    private $payment;

    /**
     * @var string
     *
     * @ORM\Column(name="ORGANISME", type="string", length=40, nullable=true)
     */
    private $organisme;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="DATE_ENTREE", type="date", nullable=true)
     */
    private $dateEntree;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="DATE_SORTIE", type="date", nullable=true)
     */
    private $dateSortie;

    /**
     * @var string
     *
     * @ORM\Column(name="I_P_P", type="string", length=40, nullable=true)
     */
    private $iPP;

    /**
     * @var string
     *
     * @ORM\Column(name="SERVICES", type="string", length=40, nullable=true)
     */
    private $services;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_CREATED", type="datetime", nullable=true)
     */
    private $dtCreated;

    /**
     * @var string
     *
     * @ORM\Column(name="str_CREATED_BY", type="string", length=40, nullable=true)
     */
    private $strCreatedBy;

    /**
     * @var string
     *
     * @ORM\Column(name="KEY_CHAMBRE", type="string", length=20, nullable=true)
     */
    private $keyChambre;

    /**
     * @var string
     *
     * @ORM\Column(name="KEY_LIT", type="string", length=20, nullable=true)
     */
    private $keyLit;

    /**
     * @var string
     *
     * @ORM\Column(name="KEY_ETAGE", type="string", length=20, nullable=true)
     */
    private $keyEtage;

    public function getLgId(): ?string
    {
        return $this->lgId;
    }

    public function getStrKey(): ?string
    {
        return $this->strKey;
    }

    public function setStrKey(?string $strKey): self
    {
        $this->strKey = $strKey;

        return $this;
    }

    public function getStrFileName(): ?string
    {
        return $this->strFileName;
    }

    public function setStrFileName(?string $strFileName): self
    {
        $this->strFileName = $strFileName;

        return $this;
    }

    public function getLit(): ?string
    {
        return $this->lit;
    }

    public function setLit(?string $lit): self
    {
        $this->lit = $lit;

        return $this;
    }

    public function getDossier(): ?string
    {
        return $this->dossier;
    }

    public function setDossier(?string $dossier): self
    {
        $this->dossier = $dossier;

        return $this;
    }

    public function getPatient(): ?string
    {
        return $this->patient;
    }

    public function setPatient(?string $patient): self
    {
        $this->patient = $patient;

        return $this;
    }

    public function getMedecin(): ?string
    {
        return $this->medecin;
    }

    public function setMedecin(?string $medecin): self
    {
        $this->medecin = $medecin;

        return $this;
    }

    public function getPayment(): ?string
    {
        return $this->payment;
    }

    public function setPayment(?string $payment): self
    {
        $this->payment = $payment;

        return $this;
    }

    public function getOrganisme(): ?string
    {
        return $this->organisme;
    }

    public function setOrganisme(?string $organisme): self
    {
        $this->organisme = $organisme;

        return $this;
    }

    public function getDateEntree(): ?\DateTimeInterface
    {
        return $this->dateEntree;
    }

    public function setDateEntree(?\DateTimeInterface $dateEntree): self
    {
        $this->dateEntree = $dateEntree;

        return $this;
    }

    public function getDateSortie(): ?\DateTimeInterface
    {
        return $this->dateSortie;
    }

    public function setDateSortie(?\DateTimeInterface $dateSortie): self
    {
        $this->dateSortie = $dateSortie;

        return $this;
    }

    public function getIPP(): ?string
    {
        return $this->iPP;
    }

    public function setIPP(?string $iPP): self
    {
        $this->iPP = $iPP;

        return $this;
    }

    public function getServices(): ?string
    {
        return $this->services;
    }

    public function setServices(?string $services): self
    {
        $this->services = $services;

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

    public function getStrCreatedBy(): ?string
    {
        return $this->strCreatedBy;
    }

    public function setStrCreatedBy(?string $strCreatedBy): self
    {
        $this->strCreatedBy = $strCreatedBy;

        return $this;
    }

    public function getKeyChambre(): ?string
    {
        return $this->keyChambre;
    }

    public function setKeyChambre(?string $keyChambre): self
    {
        $this->keyChambre = $keyChambre;

        return $this;
    }

    public function getKeyLit(): ?string
    {
        return $this->keyLit;
    }

    public function setKeyLit(?string $keyLit): self
    {
        $this->keyLit = $keyLit;

        return $this;
    }

    public function getKeyEtage(): ?string
    {
        return $this->keyEtage;
    }

    public function setKeyEtage(?string $keyEtage): self
    {
        $this->keyEtage = $keyEtage;

        return $this;
    }


}

