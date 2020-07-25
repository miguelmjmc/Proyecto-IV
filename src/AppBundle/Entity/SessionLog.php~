<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * SessionLog
 *
 * @ORM\Table(name="session_log")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\SessionLogRepository")
 */
class SessionLog
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
     * @ORM\Column(name="login", type="datetime")
     */
    private $login;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="logout", type="datetime", nullable=true)
     */
    private $logout;

    /**
     * @var string
     *
     * @ORM\Column(name="ip", type="string", length=255)
     */
    private $ip;

    /**
     * @var User
     *
     * @ORM\ManyToOne(targetEntity="User", inversedBy="sessionLog")
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
     * Set login.
     *
     * @param \DateTime $login
     *
     * @return SessionLog
     */
    public function setLogin($login)
    {
        $this->login = $login;

        return $this;
    }

    /**
     * Get login.
     *
     * @return \DateTime
     */
    public function getLogin()
    {
        return $this->login;
    }

    /**
     * Set logout.
     *
     * @param \DateTime $logout
     *
     * @return SessionLog
     */
    public function setLogout($logout)
    {
        $this->logout = $logout;

        return $this;
    }

    /**
     * Get logout.
     *
     * @return \DateTime
     */
    public function getLogout()
    {
        return $this->logout;
    }

    /**
     * Set ip.
     *
     * @param string $ip
     *
     * @return SessionLog
     */
    public function setIp($ip)
    {
        $this->ip = $ip;

        return $this;
    }

    /**
     * Get ip.
     *
     * @return string
     */
    public function getIp()
    {
        return $this->ip;
    }

    /**
     * Set user.
     *
     * @param \AppBundle\Entity\User|null $user
     *
     * @return SessionLog
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
