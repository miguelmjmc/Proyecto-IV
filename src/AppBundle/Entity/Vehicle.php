<?php

namespace AppBundle\Entity;

use AppBundle\Utils\LogTrait;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use MJMC\Bundle\CrudBundle\Core\AbstractCrud;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Vehicle
 *
 * @ORM\Table(name="vehicle")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\VehicleRepository")
 * @ORM\HasLifecycleCallbacks()
 * @UniqueEntity({"name", "vehicleBrand", "years"})
 */
class Vehicle extends AbstractCrud
{
    use LogTrait;

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
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 3, max = 50)
     *
     * @ORM\Column(name="serie", type="string", length=255)
     */
    private $years;

    /**
     * @var VehicleType
     *
     * @Assert\NotBlank
     *
     * @ORM\ManyToOne(targetEntity="VehicleType", inversedBy="vehicle")
     */
    private $vehicleType;

    /**
     * @var VehicleBrand
     *
     * @Assert\NotBlank
     *
     * @ORM\ManyToOne(targetEntity="VehicleBrand", inversedBy="vehicle")
     */
    private $vehicleBrand;

    /**
     * @var ArrayCollection
     *
     * @ORM\ManyToMany(targetEntity="Product", mappedBy="vehicle")
     */
    private $product;


    /**
     * Constructor
     */
    public function __construct()
    {
        $this->product = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * @return string
     */
    public function fullName()
    {
        return $this->vehicleBrand->getName() . ' ' . $this->name . ' (' . $this->years . ')';
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
     * @return Vehicle
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
     * Set years.
     *
     * @param string $years
     *
     * @return Vehicle
     */
    public function setYears($years)
    {
        $this->years = $years;

        return $this;
    }

    /**
     * Get years.
     *
     * @return string
     */
    public function getYears()
    {
        return $this->years;
    }

    /**
     * Set vehicleType.
     *
     * @param \AppBundle\Entity\VehicleType|null $vehicleType
     *
     * @return Vehicle
     */
    public function setVehicleType(\AppBundle\Entity\VehicleType $vehicleType = null)
    {
        $this->vehicleType = $vehicleType;

        return $this;
    }

    /**
     * Get vehicleType.
     *
     * @return \AppBundle\Entity\VehicleType|null
     */
    public function getVehicleType()
    {
        return $this->vehicleType;
    }

    /**
     * Set vehicleBrand.
     *
     * @param \AppBundle\Entity\VehicleBrand|null $vehicleBrand
     *
     * @return Vehicle
     */
    public function setVehicleBrand(\AppBundle\Entity\VehicleBrand $vehicleBrand = null)
    {
        $this->vehicleBrand = $vehicleBrand;

        return $this;
    }

    /**
     * Get vehicleBrand.
     *
     * @return \AppBundle\Entity\VehicleBrand|null
     */
    public function getVehicleBrand()
    {
        return $this->vehicleBrand;
    }

    /**
     * Add product.
     *
     * @param \AppBundle\Entity\Product $product
     *
     * @return Vehicle
     */
    public function addProduct(\AppBundle\Entity\Product $product)
    {
        $this->product[] = $product;

        return $this;
    }

    /**
     * Remove product.
     *
     * @param \AppBundle\Entity\Product $product
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeProduct(\AppBundle\Entity\Product $product)
    {
        return $this->product->removeElement($product);
    }

    /**
     * Get product.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getProduct()
    {
        return $this->product;
    }
}
