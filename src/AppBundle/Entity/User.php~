<?php

namespace AppBundle\Entity;

use AppBundle\Utils\LogTrait;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use FOS\UserBundle\Model\User as BaseUser;
use MJMC\Bundle\CrudBundle\Core\CrudInterface;
use MJMC\Bundle\CrudBundle\Core\CrudTrait;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * User
 *
 * @ORM\Table(name="user")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\UserRepository")
 * @ORM\HasLifecycleCallbacks()
 * @UniqueEntity("username")
 * @UniqueEntity("email")
 */
class User extends BaseUser implements CrudInterface
{
    use CrudTrait;
    use LogTrait;

    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @var string|null
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 4, max = 20)
     *
     * @ORM\Column(name="name", type="string", length=255, nullable=true)
     */
    private $name;

    /**
     * @var string|null
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 4, max = 20)
     *
     * @ORM\Column(name="lastName", type="string", length=255, nullable=true)
     */
    private $lastName;

    /**
     * @var string|null
     *
     * @Assert\File(maxSize = "2048k", mimeTypes = {"image/png", "image/jpeg"})
     *
     * @ORM\Column(name="img", type="string", length=255, nullable=true)
     */
    private $img;

    /**
     * @var ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="SessionLog", mappedBy="user")
     */
    private $sessionLog;

    /**
     * @var ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="OperationLog", mappedBy="user")
     */
    private $operationLog;


    /**
     * @return string
     */
    public function getFullName()
    {
        return $this->name . ' ' . $this->lastName;
    }

    /**
     * @return string
     */
    public function getStatus()
    {
        if ($this->isEnabled()) {
            return '<span class="label label-success" title="Habilitado">Habilitado</span>';
        }

        return '<span class="label label-danger" title="Desabilitado">Desabilitado</span>';
    }

    /**
     * Set name.
     *
     * @param string|null $name
     *
     * @return User
     */
    public function setName($name = null)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name.
     *
     * @return string|null
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set lastName.
     *
     * @param string|null $lastName
     *
     * @return User
     */
    public function setLastName($lastName = null)
    {
        $this->lastName = $lastName;

        return $this;
    }

    /**
     * Get lastName.
     *
     * @return string|null
     */
    public function getLastName()
    {
        return $this->lastName;
    }

    /**
     * Set img.
     *
     * @param string|null $img
     *
     * @return User
     */
    public function setImg($img = null)
    {
        $this->img = $img;

        return $this;
    }

    /**
     * Get img.
     *
     * @return string|null
     */
    public function getImg()
    {
        return $this->img;
    }

    /**
     * Add sessionLog.
     *
     * @param \AppBundle\Entity\SessionLog $sessionLog
     *
     * @return User
     */
    public function addSessionLog(\AppBundle\Entity\SessionLog $sessionLog)
    {
        $this->sessionLog[] = $sessionLog;

        return $this;
    }

    /**
     * Remove sessionLog.
     *
     * @param \AppBundle\Entity\SessionLog $sessionLog
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeSessionLog(\AppBundle\Entity\SessionLog $sessionLog)
    {
        return $this->sessionLog->removeElement($sessionLog);
    }

    /**
     * Get sessionLog.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getSessionLog()
    {
        return $this->sessionLog;
    }

    /**
     * Add operationLog.
     *
     * @param \AppBundle\Entity\OperationLog $operationLog
     *
     * @return User
     */
    public function addOperationLog(\AppBundle\Entity\OperationLog $operationLog)
    {
        $this->operationLog[] = $operationLog;

        return $this;
    }

    /**
     * Remove operationLog.
     *
     * @param \AppBundle\Entity\OperationLog $operationLog
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeOperationLog(\AppBundle\Entity\OperationLog $operationLog)
    {
        return $this->operationLog->removeElement($operationLog);
    }

    /**
     * Get operationLog.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getOperationLog()
    {
        return $this->operationLog;
    }
}
