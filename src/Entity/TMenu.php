<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Entity\TSousMenu;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

/**
 * TMenu
 *
 * @ORM\Table(name="t_menu", uniqueConstraints={@ORM\UniqueConstraint(name="lg_MENU_ID", columns={"lg_MENU_ID"})}, indexes={@ORM\Index(name="lg_MODULE_ID", columns={"lg_MODULE_ID"})})
 * @ORM\Entity
 */
class TMenu
{
/**
 * @var string
 *
 * @ORM\Column(name="lg_MENU_ID", type="string", length=20, nullable=false)
 * @ORM\Id
 * @ORM\GeneratedValue(strategy="IDENTITY")
 */
private $lgMenuId;

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
 * @var \TModule
 *
 * @ORM\ManyToOne(targetEntity="TModule")
 * @ORM\JoinColumns({
 *   @ORM\JoinColumn(name="lg_MODULE_ID", referencedColumnName="lg_MODULE_ID")
 * })
 */
private $lgModule;

public function getLgMenuId(): ?string
{
return $this->lgMenuId;
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

public function getLgModule(): ?TModule
{
return $this->lgModule;
}

public function setLgModule(?TModule $lgModule): self
{
$this->lgModule = $lgModule;

return $this;
}



    /**
     * @var TSousMenu[]|ArrayCollection
     *
     * @ORM\OneToMany(
     *      targetEntity="TSousMenu",
     *      mappedBy="lgMenu",
     *      orphanRemoval=true,
     *      cascade={"persist"}
     * )
     * @ORM\OrderBy({"strDescription": "DESC"})
     */

public $sousMenu;
/**
 * @return Collection|TSousMenu[]
 */
public function getSousMenu(): Collection
{
return $this->sousMenu;
}

public function __construct()
{
$this->sousMenu = new ArrayCollection();
}

public function removeProduct()
{

}

public function addProduct()
{

}

public function show($id)
{
$OlgSousMenuId = $this->getDoctrine()
->getRepository(TSousMenu::class)
->find($id);

// ...

$categoryName = $OlgSousMenuId->getLgMenu()->getStrDescription();

// ...
}
}

