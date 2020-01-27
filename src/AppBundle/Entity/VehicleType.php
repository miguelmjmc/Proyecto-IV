<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use MJMC\Bundle\CrudBundle\Core\AbstractCrud;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;


/**
 * VehicleType
 *
 * @ORM\Table(name="vehicle_type")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\VehicleTypeRepository")
 * @UniqueEntity("name")
 */
class VehicleType extends AbstractCrud
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
     * @var ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="Vehicle", mappedBy="vehicleType")
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
     * @return VehicleType
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
     * Add vehicle.
     *
     * @param \AppBundle\Entity\Vehicle $vehicle
     *
     * @return VehicleType
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
