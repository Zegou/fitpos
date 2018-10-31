<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TRoleUser
 *
 * @ORM\Table(name="t_role_user", uniqueConstraints={@ORM\UniqueConstraint(name="lg_USER_ROLE_ID", columns={"lg_USER_ROLE_ID"})}, indexes={@ORM\Index(name="lg_ROLE_ID", columns={"lg_ROLE_ID"}), @ORM\Index(name="lg_USER_ID", columns={"lg_USER_ID"})})
 * @ORM\Entity
 */
class TRoleUser
{
    /**
     * @var string
     *
     * @ORM\Column(name="lg_USER_ROLE_ID", type="string", length=30, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $lgUserRoleId;

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
     * @ORM\Column(name="str_CREATED_BY", type="string", length=20, nullable=true)
     */
    private $strCreatedBy;

    /**
     * @var string
     *
     * @ORM\Column(name="str_UPDATED_BY", type="string", length=20, nullable=true)
     */
    private $strUpdatedBy;

    /**
     * @var \TRole
     *
     * @ORM\ManyToOne(targetEntity="TRole")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_ROLE_ID", referencedColumnName="lg_ROLE_ID")
     * })
     */
    private $lgRole;

    /**
     * @var \TUser
     *
     * @ORM\ManyToOne(targetEntity="TUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="lg_USER_ID", referencedColumnName="lg_USER_ID")
     * })
     */
    private $lgUser;

    public function getLgUserRoleId(): ?string
    {
        return $this->lgUserRoleId;
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

    public function getStrCreatedBy(): ?string
    {
        return $this->strCreatedBy;
    }

    public function setStrCreatedBy(?string $strCreatedBy): self
    {
        $this->strCreatedBy = $strCreatedBy;

        return $this;
    }

    public function getStrUpdatedBy(): ?string
    {
        return $this->strUpdatedBy;
    }

    public function setStrUpdatedBy(?string $strUpdatedBy): self
    {
        $this->strUpdatedBy = $strUpdatedBy;

        return $this;
    }

    public function getLgRole(): ?TRole
    {
        return $this->lgRole;
    }

    public function setLgRole(?TRole $lgRole): self
    {
        $this->lgRole = $lgRole;

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

