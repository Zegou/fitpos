<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TSkin
 *
 * @ORM\Table(name="t_skin")
 * @ORM\Entity
 */
class TSkin
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_SKIN_ID", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgSkinId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_RESOURCE", type="string", length=50, nullable=true)
     */
    private $strResource;

    /**
     * @var string
     *
     * @ORM\Column(name="str_STATUT", type="string", length=20, nullable=true)
     */
    private $strStatut;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="string", length=40, nullable=true)
     */
    private $strDescription;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DETAIL_PATH", type="string", length=50, nullable=true)
     */
    private $strDetailPath;

    public function getLgSkinId(): ?string
    {
        return $this->lgSkinId;
    }

    public function getStrResource(): ?string
    {
        return $this->strResource;
    }

    public function setStrResource(?string $strResource): self
    {
        $this->strResource = $strResource;

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

    public function getStrDescription(): ?string
    {
        return $this->strDescription;
    }

    public function setStrDescription(?string $strDescription): self
    {
        $this->strDescription = $strDescription;

        return $this;
    }

    public function getStrDetailPath(): ?string
    {
        return $this->strDetailPath;
    }

    public function setStrDetailPath(?string $strDetailPath): self
    {
        $this->strDetailPath = $strDetailPath;

        return $this;
    }


}

