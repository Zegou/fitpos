<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TLanguage
 *
 * @ORM\Table(name="t_language")
 * @ORM\Entity
 */
class TLanguage
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_Language_ID", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgLanguageId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_Local_Cty", type="string", length=20, nullable=true)
     */
    private $strLocalCty = 'fr';

    /**
     * @var string
     *
     * @ORM\Column(name="str_Local_Lg", type="string", length=20, nullable=true)
     */
    private $strLocalLg = 'FR';

    /**
     * @var string
     *
     * @ORM\Column(name="str_Code", type="string", length=50, nullable=true)
     */
    private $strCode = 'ml_French';

    /**
     * @var string
     *
     * @ORM\Column(name="str_Description", type="string", length=100, nullable=true)
     */
    private $strDescription;

    public function getLgLanguageId(): ?string
    {
        return $this->lgLanguageId;
    }

    public function getStrLocalCty(): ?string
    {
        return $this->strLocalCty;
    }

    public function setStrLocalCty(?string $strLocalCty): self
    {
        $this->strLocalCty = $strLocalCty;

        return $this;
    }

    public function getStrLocalLg(): ?string
    {
        return $this->strLocalLg;
    }

    public function setStrLocalLg(?string $strLocalLg): self
    {
        $this->strLocalLg = $strLocalLg;

        return $this;
    }

    public function getStrCode(): ?string
    {
        return $this->strCode;
    }

    public function setStrCode(?string $strCode): self
    {
        $this->strCode = $strCode;

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


}

