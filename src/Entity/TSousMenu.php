<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TSousMenu
 *
 * @ORM\Table(name="t_sous_menu", uniqueConstraints={@ORM\UniqueConstraint(name="lg_SOUS_MENU_ID", columns={"lg_SOUS_MENU_ID"})}, indexes={@ORM\Index(name="lg_MENU_ID", columns={"lg_MENU_ID"})})
 * @ORM\Entity
 */
class TSousMenu
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_SOUS_MENU_ID", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgSousMenuId = '';

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
     * @var string
     *
     * @ORM\Column(name="str_COMPOSANT", type="string", length=40, nullable=false)
     */
    private $strComposant;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_PRIORITY", type="integer", nullable=true)
     */
    private $intPriority = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="str_URL", type="string", length=50, nullable=true)
     */
    private $strUrl;

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
     * @var \TMenu
     *
     * @ORM\ManyToOne(targetEntity="TMenu")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_MENU_ID", referencedColumnName="lg_MENU_ID")
     * })
     */
    private $lgMenu;

    public function getLgSousMenuId(): ?string
    {
        return $this->lgSousMenuId;
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

    public function getStrComposant(): ?string
    {
        return $this->strComposant;
    }

    public function setStrComposant(string $strComposant): self
    {
        $this->strComposant = $strComposant;

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

    public function getStrUrl(): ?string
    {
        return $this->strUrl;
    }

    public function setStrUrl(?string $strUrl): self
    {
        $this->strUrl = $strUrl;

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

    public function getLgMenu(): ?TMenu
    {
        return $this->lgMenu;
    }

    public function setLgMenu(?TMenu $lgMenu): self
    {
        $this->lgMenu = $lgMenu;

        return $this;
    }

  
}

