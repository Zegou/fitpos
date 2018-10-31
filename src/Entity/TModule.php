<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TModule
 *
 * @ORM\Table(name="t_module", uniqueConstraints={@ORM\UniqueConstraint(name="lg_MODULE_ID", columns={"lg_MODULE_ID"})})
 * @ORM\Entity
 */
class TModule
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_MODULE_ID", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgModuleId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_VALUE", type="string", length=30, nullable=true)
     */
    private $strValue;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="string", length=200, nullable=true)
     */
    private $strDescription;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_PRIORITY", type="integer", nullable=true)
     */
    private $intPriority = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="str_Status", type="string", length=20, nullable=true)
     */
    private $strStatus;

    /**
     * @var string
     *
     * @ORM\Column(name="P_KEY", type="string", length=100, nullable=true)
     */
    private $pKey;

    /**
     * @var string
     *
     * @ORM\Column(name="str_Link", type="string", length=100, nullable=true)
     */
    private $strLink;

    /**
     * @var string
     *
     * @ORM\Column(name="str_Icone", type="string", length=20, nullable=true)
     */
    private $strIcone;

    /**
     * @var string
     *
     * @ORM\Column(name="str_Icone_hover", type="string", length=20, nullable=true)
     */
    private $strIconeHover;

    /**
     * @var string
     *
     * @ORM\Column(name="str_Icone_out", type="string", length=20, nullable=true)
     */
    private $strIconeOut;

    /**
     * @var string
     *
     * @ORM\Column(name="str_Link_default", type="string", length=100, nullable=true)
     */
    private $strLinkDefault;

    public function getLgModuleId(): ?string
    {
        return $this->lgModuleId;
    }

    public function getStrValue(): ?string
    {
        return $this->strValue;
    }

    public function setStrValue(?string $strValue): self
    {
        $this->strValue = $strValue;

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

    public function getIntPriority(): ?int
    {
        return $this->intPriority;
    }

    public function setIntPriority(?int $intPriority): self
    {
        $this->intPriority = $intPriority;

        return $this;
    }

    public function getStrStatus(): ?string
    {
        return $this->strStatus;
    }

    public function setStrStatus(?string $strStatus): self
    {
        $this->strStatus = $strStatus;

        return $this;
    }

    public function getPKey(): ?string
    {
        return $this->pKey;
    }

    public function setPKey(?string $pKey): self
    {
        $this->pKey = $pKey;

        return $this;
    }

    public function getStrLink(): ?string
    {
        return $this->strLink;
    }

    public function setStrLink(?string $strLink): self
    {
        $this->strLink = $strLink;

        return $this;
    }

    public function getStrIcone(): ?string
    {
        return $this->strIcone;
    }

    public function setStrIcone(?string $strIcone): self
    {
        $this->strIcone = $strIcone;

        return $this;
    }

    public function getStrIconeHover(): ?string
    {
        return $this->strIconeHover;
    }

    public function setStrIconeHover(?string $strIconeHover): self
    {
        $this->strIconeHover = $strIconeHover;

        return $this;
    }

    public function getStrIconeOut(): ?string
    {
        return $this->strIconeOut;
    }

    public function setStrIconeOut(?string $strIconeOut): self
    {
        $this->strIconeOut = $strIconeOut;

        return $this;
    }

    public function getStrLinkDefault(): ?string
    {
        return $this->strLinkDefault;
    }

    public function setStrLinkDefault(?string $strLinkDefault): self
    {
        $this->strLinkDefault = $strLinkDefault;

        return $this;
    }


}

