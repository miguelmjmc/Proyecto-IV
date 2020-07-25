<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * OperationLog
 *
 * @ORM\Table(name="operation_log")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\OperationLogRepository")
 */
class OperationLog
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="datetime")
     */
    private $date;

    /**
     * @var string
     *
     * @ORM\Column(name="entity", type="string", length=255)
     */
    private $entity;

    /**
     * @var string
     *
     * @ORM\Column(name="entityId", type="string", length=255, nullable=true)
     */
    private $entityId;

    /**
     * @var string
     *
     * @ORM\Column(name="request", type="string", length=255)
     */
    private $request;

    /**
     * @var string
     *
     * @ORM\Column(name="method", type="string", length=255)
     */
    private $method;

    /**
     * @var string
     *
     * @ORM\Column(name="action", type="string", length=255)
     */
    private $action;

    /**
     * @var string
     *
     * @ORM\Column(name="changeSet", type="array")
     */
    private $changeSet;

    /**
     * @var User
     *
     * @ORM\ManyToOne(targetEntity="User", inversedBy="operationLog")
     */
    private $user;


    /**
     * Get id.
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set date.
     *
     * @param \DateTime $date
     *
     * @return OperationLog
     */
    public function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date.
     *
     * @return \DateTime
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * Set entity.
     *
     * @param string $entity
     *
     * @return OperationLog
     */
    public function setEntity($entity)
    {
        $this->entity = $entity;

        return $this;
    }

    /**
     * Get entity.
     *
     * @return string
     */
    public function getEntity()
    {
        return $this->entity;
    }

    /**
     * Set entityId.
     *
     * @param string $entityId
     *
     * @return OperationLog
     */
    public function setEntityId($entityId)
    {
        $this->entityId = $entityId;

        return $this;
    }

    /**
     * Get entityId.
     *
     * @return string
     */
    public function getEntityId()
    {
        return $this->entityId;
    }

    /**
     * Set request.
     *
     * @param string $request
     *
     * @return OperationLog
     */
    public function setRequest($request)
    {
        $this->request = $request;

        return $this;
    }

    /**
     * Get request.
     *
     * @return string
     */
    public function getRequest()
    {
        return $this->request;
    }

    /**
     * Set method.
     *
     * @param string $method
     *
     * @return OperationLog
     */
    public function setMethod($method)
    {
        $this->method = $method;

        return $this;
    }

    /**
     * Get method.
     *
     * @return string
     */
    public function getMethod()
    {
        return $this->method;
    }

    /**
     * Set action.
     *
     * @param string $action
     *
     * @return OperationLog
     */
    public function setAction($action)
    {
        $this->action = $action;

        return $this;
    }

    /**
     * Get action.
     *
     * @return string
     */
    public function getAction()
    {
        return $this->action;
    }

    /**
     * Set changeSet.
     *
     * @param array $changeSet
     *
     * @return OperationLog
     */
    public function setChangeSet($changeSet)
    {
        $this->changeSet = $changeSet;

        return $this;
    }

    /**
     * Get changeSet.
     *
     * @return array
     */
    public function getChangeSet()
    {
        return $this->changeSet;
    }

    /**
     * Set user.
     *
     * @param \AppBundle\Entity\User|null $user
     *
     * @return OperationLog
     */
    public function setUser(\AppBundle\Entity\User $user = null)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user.
     *
     * @return \AppBundle\Entity\User|null
     */
    public function getUser()
    {
        return $this->user;
    }
}
