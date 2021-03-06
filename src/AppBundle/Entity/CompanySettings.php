<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use MJMC\Bundle\CrudBundle\Core\AbstractCrud;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * CompanySettings
 *
 * @ORM\Table(name="company_settings")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\CompanySettingsRepository")
 */
class CompanySettings
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
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 12, max = 12)
     *
     * @ORM\Column(name="identificationNumber", type="string", length=255)
     */
    private $identificationNumber;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 4, max = 50)
     *
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 4, max = 50)
     *
     * @ORM\Column(name="slogan", type="string", length=255)
     */
    private $slogan;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 10, max = 200)
     *
     * @ORM\Column(name="address", type="string", length=255)
     */
    private $address;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Range(min = "-90", max = "90")
     *
     * @ORM\Column(name="latitude", type="decimal", precision=8, scale=6)
     */
    private $latitude;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Range(min = "-180", max = "180")
     *
     * @ORM\Column(name="longitude", type="decimal", precision=9, scale=6)
     */
    private $longitude;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 10, max = 50)
     * @Assert\Email()
     *
     * @ORM\Column(name="email", type="string", length=255)
     */
    private $email;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 10, max = 20)
     *
     * @ORM\Column(name="phone1", type="string", length=255)
     */
    private $phone1;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 10, max = 20)
     *
     * @ORM\Column(name="phone2", type="string", length=255)
     */
    private $phone2;

    /**
     * @var string
     *
     * @ORM\Column(name="img", type="string", length=255, nullable=true)
     */
    private $img;

    /**
     * @var string
     *
     * @Assert\Url
     *
     * @ORM\Column(name="facebook", type="string", length=255, nullable=true)
     */
    private $facebook;

    /**
     * @var string
     *
     * @Assert\Url
     *
     * @ORM\Column(name="twitter", type="string", length=255, nullable=true)
     */
    private $twitter;

    /**
     * @var string
     *
     * @Assert\Url
     *
     * @ORM\Column(name="instagram", type="string", length=255, nullable=true)
     */
    private $instagram;

    /**
     * @var string
     *
     * @Assert\Url
     *
     * @ORM\Column(name="youtube", type="string", length=255, nullable=true)
     */
    private $youtube;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 10, max = 400)
     *
     * @ORM\Column(name="mission", type="text")
     */
    private $mission;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 10, max = 400)
     *
     * @ORM\Column(name="vision", type="text")
     */
    private $vision;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 10, max = 1200)
     *
     * @ORM\Column(name="history", type="text")
     */
    private $history;



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
     * Set identificationNumber.
     *
     * @param string $identificationNumber
     *
     * @return CompanySettings
     */
    public function setIdentificationNumber($identificationNumber)
    {
        $this->identificationNumber = $identificationNumber;

        return $this;
    }

    /**
     * Get identificationNumber.
     *
     * @return string
     */
    public function getIdentificationNumber()
    {
        return $this->identificationNumber;
    }

    /**
     * Set name.
     *
     * @param string $name
     *
     * @return CompanySettings
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name.
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set slogan.
     *
     * @param string $slogan
     *
     * @return CompanySettings
     */
    public function setSlogan($slogan)
    {
        $this->slogan = $slogan;

        return $this;
    }

    /**
     * Get slogan.
     *
     * @return string
     */
    public function getSlogan()
    {
        return $this->slogan;
    }

    /**
     * Set address.
     *
     * @param string $address
     *
     * @return CompanySettings
     */
    public function setAddress($address)
    {
        $this->address = $address;

        return $this;
    }

    /**
     * Get address.
     *
     * @return string
     */
    public function getAddress()
    {
        return $this->address;
    }

    /**
     * Set latitude.
     *
     * @param string $latitude
     *
     * @return CompanySettings
     */
    public function setLatitude($latitude)
    {
        $this->latitude = $latitude;

        return $this;
    }

    /**
     * Get latitude.
     *
     * @return string
     */
    public function getLatitude()
    {
        return $this->latitude;
    }

    /**
     * Set longitude.
     *
     * @param string $longitude
     *
     * @return CompanySettings
     */
    public function setLongitude($longitude)
    {
        $this->longitude = $longitude;

        return $this;
    }

    /**
     * Get longitude.
     *
     * @return string
     */
    public function getLongitude()
    {
        return $this->longitude;
    }

    /**
     * Set email.
     *
     * @param string $email
     *
     * @return CompanySettings
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email.
     *
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set phone1.
     *
     * @param string $phone1
     *
     * @return CompanySettings
     */
    public function setPhone1($phone1)
    {
        $this->phone1 = $phone1;

        return $this;
    }

    /**
     * Get phone1.
     *
     * @return string
     */
    public function getPhone1()
    {
        return $this->phone1;
    }

    /**
     * Set phone2.
     *
     * @param string $phone2
     *
     * @return CompanySettings
     */
    public function setPhone2($phone2)
    {
        $this->phone2 = $phone2;

        return $this;
    }

    /**
     * Get phone2.
     *
     * @return string
     */
    public function getPhone2()
    {
        return $this->phone2;
    }

    /**
     * Set img.
     *
     * @param string $img
     *
     * @return CompanySettings
     */
    public function setImg($img)
    {
        $this->img = $img;

        return $this;
    }

    /**
     * Get img.
     *
     * @return string
     */
    public function getImg()
    {
        return $this->img;
    }

    /**
     * Set facebook.
     *
     * @param string $facebook
     *
     * @return CompanySettings
     */
    public function setFacebook($facebook)
    {
        $this->facebook = $facebook;

        return $this;
    }

    /**
     * Get facebook.
     *
     * @return string
     */
    public function getFacebook()
    {
        return $this->facebook;
    }

    /**
     * Set twitter.
     *
     * @param string $twitter
     *
     * @return CompanySettings
     */
    public function setTwitter($twitter)
    {
        $this->twitter = $twitter;

        return $this;
    }

    /**
     * Get twitter.
     *
     * @return string
     */
    public function getTwitter()
    {
        return $this->twitter;
    }

    /**
     * Set instagram.
     *
     * @param string $instagram
     *
     * @return CompanySettings
     */
    public function setInstagram($instagram)
    {
        $this->instagram = $instagram;

        return $this;
    }

    /**
     * Get instagram.
     *
     * @return string
     */
    public function getInstagram()
    {
        return $this->instagram;
    }

    /**
     * Set youtube.
     *
     * @param string $youtube
     *
     * @return CompanySettings
     */
    public function setYoutube($youtube)
    {
        $this->youtube = $youtube;

        return $this;
    }

    /**
     * Get youtube.
     *
     * @return string
     */
    public function getYoutube()
    {
        return $this->youtube;
    }

    /**
     * Set mission.
     *
     * @param string $mission
     *
     * @return CompanySettings
     */
    public function setMission($mission)
    {
        $this->mission = $mission;

        return $this;
    }

    /**
     * Get mission.
     *
     * @return string
     */
    public function getMission()
    {
        return $this->mission;
    }

    /**
     * Set vision.
     *
     * @param string $vision
     *
     * @return CompanySettings
     */
    public function setVision($vision)
    {
        $this->vision = $vision;

        return $this;
    }

    /**
     * Get vision.
     *
     * @return string
     */
    public function getVision()
    {
        return $this->vision;
    }

    /**
     * Set history.
     *
     * @param string $history
     *
     * @return CompanySettings
     */
    public function setHistory($history)
    {
        $this->history = $history;

        return $this;
    }

    /**
     * Get history.
     *
     * @return string
     */
    public function getHistory()
    {
        return $this->history;
    }
}
