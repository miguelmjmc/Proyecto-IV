<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use MJMC\Bundle\CrudBundle\Core\AbstractCrud;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;


/**
 * VehicleBrand
 *
 * @ORM\Table(name="vehicle_brand")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\VehicleBrandRepository")
 * @ORM\HasLifecycleCallbacks()
 * @UniqueEntity("name")
 */
class VehicleBrand extends AbstractCrud
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
     * @Assert\Length(min = 3, max = 50)
     *
     * @ORM\Column(name="name", type="string", length=255, unique=true)
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="img", type="string", length=255, nullable=true)
     */
    private $img;

    /**
     * @var ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="Vehicle", mappedBy="vehicleBrand")
     */
    private $vehicle;


    /**
     * Constructor
     */
    public function __construct()
    {
        $this->vehicle = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * @ORM\PreRemove
     */
    public function onPreRemove()
    {
        if (file_exists($this->img)) {
            unlink($this->img);
        }
    }

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
     * Set name.
     *
     * @param string $name
     *
     * @return VehicleBrand
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
     * Set img.
     *
     * @param string $img
     *
     * @return VehicleBrand
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
     * Add vehicle.
     *
     * @param \AppBundle\Entity\Vehicle $vehicle
     *
     * @return VehicleBrand
     */
    public function addVehicle(\AppBundle\Entity\Vehicle $vehicle)
    {
        $this->vehicle[] = $vehicle;

        return $this;
    }

    /**
     * Remove vehicle.
     *
     * @param \AppBundle\Entity\Vehicle $vehicle
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeVehicle(\AppBundle\Entity\Vehicle $vehicle)
    {
        return $this->vehicle->removeElement($vehicle);
    }

    /**
     * Get vehicle.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getVehicle()
    {
        return $this->vehicle;
    }
}
