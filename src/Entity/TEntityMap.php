<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TEntityMap
 *
 * @ORM\Table(name="t_entity_map", uniqueConstraints={@ORM\UniqueConstraint(name="lg_ENTITY_MAP_ID", columns={"lg_ENTITY_MAP_ID"})}, indexes={@ORM\Index(name="lg_SCHEMA_CARTE_ID", columns={"lg_SCHEMA_CARTE_ID"}), @ORM\Index(name="lg_DECOUPE_ID", columns={"lg_DECOUPE_ID"})})
 * @ORM\Entity
 */
class TEntityMap
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_ENTITY_MAP_ID", type="string", length=40, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgEntityMapId;

    /**
     * @var string
     *
     * @ORM\Column(name="str_NAME", type="text", length=65535, nullable=true)
     */
    private $strName;

    /**
     * @var string
     *
     * @ORM\Column(name="str_DESCRIPTION", type="text", length=65535, nullable=true)
     */
    private $strDescription;

    /**
     * @var string
     *
     * @ORM\Column(name="lg_SCHEMA_CARTE_ID", type="string", length=20, nullable=false)
     */
    private $lgSchemaCarteId;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_LAST_AFFECTATION_DATE", type="datetime", nullable=true)
     */
    private $dtLastAffectationDate;

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
     * @ORM\Column(name="str_COORDONNE_GPS", type="string", length=20, nullable=true)
     */
    private $strCoordonneGps;

    /**
     * @var string
     *
     * @ORM\Column(name="str_SVG_DATA_IN", type="text", length=65535, nullable=true)
     */
    private $strSvgDataIn;

    /**
     * @var string
     *
     * @ORM\Column(name="str_SVG_DATA", type="text", nullable=true)
     */
    private $strSvgData;

    /**
     * @var string
     *
     * @ORM\Column(name="str_SVG_REF", type="string", length=20, nullable=true)
     */
    private $strSvgRef;

    /**
     * @var string
     *
     * @ORM\Column(name="str_SVG_DATA_TEXT", type="text", length=65535, nullable=true)
     */
    private $strSvgDataText;

    /**
     * @var string
     *
     * @ORM\Column(name="str_SVG_FONT", type="string", length=20, nullable=true)
     */
    private $strSvgFont;

    /**
     * @var string
     *
     * @ORM\Column(name="str_STROKE", type="string", length=20, nullable=true)
     */
    private $strStroke;

    /**
     * @var integer
     *
     * @ORM\Column(name="int_INDEX", type="integer", nullable=true)
     */
    private $intIndex = '20';

    /**
     * @var string
     *
     * @ORM\Column(name="str_TYPEBLOCK", type="string", length=20, nullable=true)
     */
    private $strTypeblock = 'SIMPLE';

    /**
     * @var string
     *
     * @ORM\Column(name="str_STROKE_WIDTH", type="string", length=20, nullable=true)
     */
    private $strStrokeWidth = '1';

    /**
     * @var string
     *
     * @ORM\Column(name="lg_PARENT_lg_ENTITY_MAP_ID", type="string", length=40, nullable=true)
     */
    private $lgParentLgEntityMapId;

    /**
     * @var \TDecoupe
     *
     * @ORM\ManyToOne(targetEntity="TDecoupe")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_DECOUPE_ID", referencedColumnName="lg_DECOUPE_ID")
     * })
     */
    private $lgDecoupe;

    public function getLgEntityMapId(): ?string
    {
        return $this->lgEntityMapId;
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

    public function getLgSchemaCarteId(): ?string
    {
        return $this->lgSchemaCarteId;
    }

    public function setLgSchemaCarteId(string $lgSchemaCarteId): self
    {
        $this->lgSchemaCarteId = $lgSchemaCarteId;

        return $this;
    }

    public function getDtLastAffectationDate(): ?\DateTimeInterface
    {
        return $this->dtLastAffectationDate;
    }

    public function setDtLastAffectationDate(?\DateTimeInterface $dtLastAffectationDate): self
    {
        $this->dtLastAffectationDate = $dtLastAffectationDate;

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

    public function getStrCoordonneGps(): ?string
    {
        return $this->strCoordonneGps;
    }

    public function setStrCoordonneGps(?string $strCoordonneGps): self
    {
        $this->strCoordonneGps = $strCoordonneGps;

        return $this;
    }

    public function getStrSvgDataIn(): ?string
    {
        return $this->strSvgDataIn;
    }

    public function setStrSvgDataIn(?string $strSvgDataIn): self
    {
        $this->strSvgDataIn = $strSvgDataIn;

        return $this;
    }

    public function getStrSvgData(): ?string
    {
        return $this->strSvgData;
    }

    public function setStrSvgData(?string $strSvgData): self
    {
        $this->strSvgData = $strSvgData;

        return $this;
    }

    public function getStrSvgRef(): ?string
    {
        return $this->strSvgRef;
    }

    public function setStrSvgRef(?string $strSvgRef): self
    {
        $this->strSvgRef = $strSvgRef;

        return $this;
    }

    public function getStrSvgDataText(): ?string
    {
        return $this->strSvgDataText;
    }

    public function setStrSvgDataText(?string $strSvgDataText): self
    {
        $this->strSvgDataText = $strSvgDataText;

        return $this;
    }

    public function getStrSvgFont(): ?string
    {
        return $this->strSvgFont;
    }

    public function setStrSvgFont(?string $strSvgFont): self
    {
        $this->strSvgFont = $strSvgFont;

        return $this;
    }

    public function getStrStroke(): ?string
    {
        return $this->strStroke;
    }

    public function setStrStroke(?string $strStroke): self
    {
        $this->strStroke = $strStroke;

        return $this;
    }

    public function getIntIndex(): ?int
    {
        return $this->intIndex;
    }

    public function setIntIndex(?int $intIndex): self
    {
        $this->intIndex = $intIndex;

        return $this;
    }

    public function getStrTypeblock(): ?string
    {
        return $this->strTypeblock;
    }

    public function setStrTypeblock(?string $strTypeblock): self
    {
        $this->strTypeblock = $strTypeblock;

        return $this;
    }

    public function getStrStrokeWidth(): ?string
    {
        return $this->strStrokeWidth;
    }

    public function setStrStrokeWidth(?string $strStrokeWidth): self
    {
        $this->strStrokeWidth = $strStrokeWidth;

        return $this;
    }

    public function getLgParentLgEntityMapId(): ?string
    {
        return $this->lgParentLgEntityMapId;
    }

    public function setLgParentLgEntityMapId(?string $lgParentLgEntityMapId): self
    {
        $this->lgParentLgEntityMapId = $lgParentLgEntityMapId;

        return $this;
    }

    public function getLgDecoupe(): ?TDecoupe
    {
        return $this->lgDecoupe;
    }

    public function setLgDecoupe(?TDecoupe $lgDecoupe): self
    {
        $this->lgDecoupe = $lgDecoupe;

        return $this;
    }


}

