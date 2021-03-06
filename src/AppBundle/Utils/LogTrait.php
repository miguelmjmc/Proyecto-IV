<?php

namespace AppBundle\Utils;

use Doctrine\Common\Persistence\Event\LifecycleEventArgs;

trait LogTrait
{
    /**
     * @var \DateTime
     *
     * @ORM\Column(name="createdAt", type="datetime", nullable=true)
     */
    private $createdAt;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="updatedAt", type="datetime", nullable=true)
     */
    private $updatedAt;

    /**
     * @return \DateTime
     */
    public function getLastUpdate()
    {
        return $this->updatedAt;
    }

    /**
     * Set createdAt
     *
     * @param \DateTime $createdAt
     *
     * @return $this
     */
    public function setCreatedAt(\DateTime $createdAt)
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    /**
     * @return \DateTime
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * Set updatedAt
     *
     * @param \DateTime $updatedAt
     *
     * @return $this
     */
    public function setUpdatedAt(\DateTime $updatedAt)
    {
        $this->createdAt = $updatedAt;

        return $this;
    }

    /**
     * @return \DateTime
     */
    public function getUpdatedAt()
    {
        return $this->updatedAt;
    }

    /**
     * @param LifecycleEventArgs $event
     *
     * @throws \Exception
     *
     * @ORM\PrePersist
     */
    public function onPrePersist(LifecycleEventArgs $event)
    {
        $date = new \DateTime();

        $this->createdAt = $date;
        $this->updatedAt = $date;
    }

    /**
     * @param LifecycleEventArgs $event
     *
     * @throws \Exception
     *
     * @ORM\PreUpdate
     */
    public function onPreUpdate(LifecycleEventArgs $event)
    {
        $this->updatedAt = new \DateTime();
    }
}
