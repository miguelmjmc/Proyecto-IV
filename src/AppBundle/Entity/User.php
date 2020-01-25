<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use FOS\UserBundle\Model\User as BaseUser;

/**
 * User
 *
 * @ORM\Table(name="user")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\UserRepository")
 */
class User extends BaseUser
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

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
