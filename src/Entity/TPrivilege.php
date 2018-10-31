<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TPrivilege
 *
 * @ORM\Table(name="t_privilege", uniqueConstraints={@ORM\UniqueConstraint(name="lg_PRIVELEGE_ID", columns={"lg_PRIVELEGE_ID"})})
 * @ORM\Entity
 */
class TPrivilege
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_PRIVELEGE_ID", type="string", length=50, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgPrivelegeId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="string", length=80, nullable=true)
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
     * @var string
     *
     * @ORM\Column(name="lg_CREATED_BY", type="string", length=20, nullable=true)
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
     * @ORM\Column(name="lg_UPDATED_BY", type="string", length=20, nullable=true)
     */
    private $lgUpdatedBy;

    /**
     * @var string
     *
     * @ORM\Column(name="lg_PRIVELEGE_ID_DEP", type="string", length=50, nullable=true)
     */
    private $lgPrivelegeIdDep;

    /**
     * @var string
     *
     * @ORM\Column(name="str_STATUT", type="string", length=50, nullable=true)
     */
    private $strStatut = 'enable';

    public function getLgPrivelegeId(): ?string
    {
        return $this->lgPrivelegeId;
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

    public function getLgPrivelegeIdDep(): ?string
    {
        return $this->lgPrivelegeIdDep;
    }

    public function setLgPrivelegeIdDep(?string $lgPrivelegeIdDep): self
    {
        $this->lgPrivelegeIdDep = $lgPrivelegeIdDep;

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


}

