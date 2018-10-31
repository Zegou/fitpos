<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use App\Entity\TRole;
use App\Entity\TRoleUser;
use Doctrine\ORM\Mapping\ManyToOne;
use Doctrine\ORM\Mapping\JoinColumn;
use Doctrine\ORM\Mapping\ManyToMany;
use Doctrine\ORM\Mapping\JoinTable;
use Symfony\Component\Validator\Constraints\DateTime;

/**
 * TUser
 *
 * @ORM\Table(name="t_user", uniqueConstraints={@ORM\UniqueConstraint(name="str_LOGIN", columns={"str_LOGIN"})}, indexes={@ORM\Index(name="lg_SKIN_ID", columns={"lg_SKIN_ID"}), @ORM\Index(name="lg_Language_ID", columns={"lg_Language_ID"})})
 * @ORM\Entity
 */
class TUser implements UserInterface, \Serializable
{
/**
 * @var string
 *
 * @ORM\Column(name="lg_USER_ID", type="string", length=30, nullable=false)
 * @ORM\Id

 */
public $lgUserId;
// * @ORM\GeneratedValue(strategy="IDENTITY")
/**
 * @var string
 *
 * @ORM\Column(name="str_LOGIN", type="string", length=40, nullable=true)
 */
private $strLogin;

/**
 * @var string
 *
 * @ORM\Column(name="str_PASSWORD", type="string", length=40, nullable=true)
 */
// private $strPassword;

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
 * @var string
 *
 * @ORM\Column(name="str_FIRST_NAME", type="string", length=20, nullable=true)
 */
private $strFirstName;

/**
 * @var string
 *
 * @ORM\Column(name="str_LAST_NAME", type="string", length=20, nullable=true)
 */
private $strLastName;

/**
 * @var \DateTime
 *
 * @ORM\Column(name="str_LAST_CONNECTION_DATE", type="datetime", nullable=true)
 */
private $strLastConnectionDate;

/**
 * @var string
 *
 * @ORM\Column(name="str_STATUT", type="string", length=20, nullable=true)
 */
private $strStatut;

/**
 * @var \DateTime
 *
 * @ORM\Column(name="dt_LAST_ACTIVITY", type="datetime", nullable=true)
 */
private $dtLastActivity;

/**
 * @var string
 *
 * @ORM\Column(name="FUNCTION", type="string", length=20, nullable=true)
 */
private $function;

/**
 * @var string
 *
 * @ORM\Column(name="str_PHONE", type="string", length=20, nullable=true)
 */
private $strPhone;

/**
 * @var string
 *
 * @ORM\Column(name="str_MAIL", type="string", length=20, nullable=true)
 */
private $strMail;

/**
 * @var integer
 *
 * @ORM\Column(name="str_IDS", type="integer", nullable=true)
 */
private $strIds;

/**
 * @var boolean
 *
 * @ORM\Column(name="b_CHANGE_PASSWORD", type="boolean", nullable=true)
 */
private $bChangePassword;

/**
 * @var integer
 *
 * @ORM\Column(name="int_CONNEXION", type="integer", nullable=true)
 */
private $intConnexion;

/**
 * @var string
 *
 * @ORM\Column(name="str_FUNCTION", type="string", length=50, nullable=true)
 */
private $strFunction;

/**
 * @var string
 *
 * @ORM\Column(name="lg_EMPLACEMENT_ID", type="string", length=20, nullable=true)
 */
private $lgEmplacementId;

/**
 * @var boolean
 *
 * @ORM\Column(name="b_is_connected", type="boolean", nullable=true)
 */
private $bIsConnected;

/**
 * @var \TSkin
 *
 * @ORM\ManyToOne(targetEntity="TSkin")
 * @ORM\JoinColumns({
 *   @ORM\JoinColumn(name="lg_SKIN_ID", referencedColumnName="lg_SKIN_ID")
 * })
 */
private $lgSkin;

/**
 * @var \TLanguage
 *
 * @ORM\ManyToOne(targetEntity="TLanguage")
 * @ORM\JoinColumns({
 *   @ORM\JoinColumn(name="lg_Language_ID", referencedColumnName="lg_Language_ID")
 * })
 */
private $lgLanguage;

public function getLgUserId(): ?string
{
return $this->lgUserId;
}

public function getStrLogin(): ?string
{
return $this->strLogin;
}

public function setStrLogin(?string $strLogin): self
{
$this->strLogin = $strLogin;

return $this;
}

public function getStrPassword(): ?string
{
return $this->password;
}

public function setStrPassword(?string $strPassword): self
{
$this->password = $strPassword;

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

public function getStrFirstName(): ?string
{
return $this->strFirstName;
}

public function setStrFirstName(?string $strFirstName): self
{
$this->strFirstName = $strFirstName;

return $this;
}

public function getStrLastName(): ?string
{
return $this->strLastName;
}

public function setStrLastName(?string $strLastName): self
{
$this->strLastName = $strLastName;

return $this;
}

public function getStrLastConnectionDate(): ?\DateTimeInterface
{

// $this->strLastConnectionDate =  DateTime::createFromFormat('m/d/Y', $this->strLastConnectionDate);
return $this->strLastConnectionDate;
}

public function setStrLastConnectionDate(?\DateTimeInterface $strLastConnectionDate): self
{
$this->strLastConnectionDate = $strLastConnectionDate;

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

public function getDtLastActivity(): ?\DateTimeInterface
{
return $this->dtLastActivity;
}

public function setDtLastActivity(?\DateTimeInterface $dtLastActivity): self
{
$this->dtLastActivity = $dtLastActivity;

return $this;
}

public function getFunction(): ?string
{
return $this->function;
}

public function setFunction(?string $function): self
{
$this->function = $function;

return $this;
}

public function getStrPhone(): ?string
{
return $this->strPhone;
}

public function setStrPhone(?string $strPhone): self
{
$this->strPhone = $strPhone;

return $this;
}

public function getStrMail(): ?string
{
return $this->strMail;
}

public function setStrMail(?string $strMail): self
{
$this->strMail = $strMail;

return $this;
}

public function getStrIds(): ?int
{
return $this->strIds;
}

public function setStrIds(?int $strIds): self
{
$this->strIds = $strIds;

return $this;
}

public function getBChangePassword(): ?bool
{
return $this->bChangePassword;
}

public function setBChangePassword(?bool $bChangePassword): self
{
$this->bChangePassword = $bChangePassword;

return $this;
}

public function getIntConnexion(): ?int
{
return $this->intConnexion;
}

public function setIntConnexion(?int $intConnexion): self
{
$this->intConnexion = $intConnexion;

return $this;
}

public function getStrFunction(): ?string
{
return $this->strFunction;
}

public function setStrFunction(?string $strFunction): self
{
$this->strFunction = $strFunction;

return $this;
}

public function getLgEmplacementId(): ?string
{
return $this->lgEmplacementId;
}

public function setLgEmplacementId(?string $lgEmplacementId): self
{
$this->lgEmplacementId = $lgEmplacementId;

return $this;
}

public function getBIsConnected(): ?bool
{
return $this->bIsConnected;
}

public function setBIsConnected(?bool $bIsConnected): self
{
$this->bIsConnected = $bIsConnected;

return $this;
}

public function getLgSkin(): ?TSkin
{
return $this->lgSkin;
}

public function setLgSkin(?TSkin $lgSkin): self
{
$this->lgSkin = $lgSkin;

return $this;
}

public function getLgLanguage(): ?TLanguage
{
return $this->lgLanguage;
}

public function setLgLanguage(?TLanguage $lgLanguage): self
{
$this->lgLanguage = $lgLanguage;

return $this;
}



/**
 * @ORM\Column(type="string", length=25, unique=true)
 */
// private $username;

/**
 * @ORM\Column(type="string", length=64)
 */
private $password;

/**
 * @ORM\Column(type="string", length=254, unique=true)
 */
//private $email;

/**
 * @ORM\Column(name="is_active", type="boolean")
 */
private $isActive;

public function __construct()
{
$this->isActive = true;
$this->ORole = new \Doctrine\Common\Collections\ArrayCollection();
// may not be needed, see section on salt below
// $this->salt = md5(uniqid('', true));
}

public function getUsername()
{
return $this->strLogin;
}

public function getSalt()
{
// you *may* need a real salt depending on your encoder
// see section on salt below
return null;
}

public function getPassword()
{
return $this->password;
}

public function getRoles()
{
return array('ROLE_USER');
}

public function eraseCredentials()
{
}

/** @see \Serializable::serialize() */
public function serialize()
{
return serialize(array(
$this->lgUserId,
 $this->strLogin,
 $this->password,
 // see section on salt below
// $this->salt,
));
}

/** @see \Serializable::unserialize() */
public function unserialize($serialized)
{
list (
$this->lgUserId,
 $this->strLogin,
 $this->password,
 // see section on salt below
// $this->salt
) = unserialize($serialized, array('allowed_classes' => false));
}


/**
 * Many User have Many TRole.
 * @ManyToMany(targetEntity="TRole")
 * @JoinTable(name="t_role_user",
 *      joinColumns={@JoinColumn(name="lg_USER_ID", referencedColumnName="lg_USER_ID")},
 *      inverseJoinColumns={@JoinColumn(name="lg_ROLE_ID", referencedColumnName="lg_ROLE_ID", unique=true)}
 *      )
 */
private $ORole;


private $strRoleForm;
public function getStrRoleForm()
{
$output = "";
foreach($this->ORole as $event)
{
$output = $output." " . $event->getStrName().";";
}
return $output; //array('ROLE_USER');
}

private $strStrtLastConnectionDate;
public function getStrStrtLastConnectionDate()
{
$stringValue = "Jamais connecter";
// $dateImmutable = DateTime::createFromFormat('Y-m-d H:i:s', strtotime('now'));
if ($this->strLastConnectionDate instanceof \DateTime) {
$stringValue = $this->strLastConnectionDate->format('Y-m-d H:i:s');
}
//$output =format_date($this->strLastConnectionDate, 'dd-MM-yyyy, HH:mm');//date('H\hi m/d/Y', $this->strLastConnectionDate);;

return $stringValue; //array('ROLE_USER');
}

private $stractionEDIT;
public function getstractionEDIT()
{
$stractionEDIT = "<td data-value='1'><a href='../users/edit?ID=".$this->lgUserId."'    class='md-btn md-raised m-b-sm w-xs green'>Edit</a></td>";

return $stractionEDIT; //array('ROLE_USER');
}

private $stractionDELETE;
public function getstractionDELETE()
{
$stractionDELETE= "<td data-value='1'><a href='../users/delete?ID=".$this->lgUserId."'  class='md-btn md-raised m-b-sm w-xs red'>Delete</a></td>";

return $stractionDELETE; //array('ROLE_USER');
}

//<td data-value=1><span class=label success title=Active>Active</span></td>
}

