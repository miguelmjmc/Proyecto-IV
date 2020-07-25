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
 * @UniqueEntity({"name", "vehicleBrand", "seriesStart", "seriesEnd"})
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
     * @Assert\Range(min = 1950, max = 2020)
     *
     * @ORM\Column(name="seriesStart", type="integer")
     */
    private $seriesStart;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Range(min = 1950, max = 2020)
     *
     * @ORM\Column(name="seriesEnd", type="integer")
     */
    private $seriesEnd;

    /**
     * @var VehicleCategory
     *
     * @Assert\NotBlank
     *
     * @ORM\ManyToOne(targetEntity="VehicleCategory", inversedBy="vehicle")
     */
    private $vehicleCategory;

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
    public function getSeries()
    {
        return $this->seriesStart.' - '.$this->seriesEnd;
    }

    /**
     * @return string
     */
    public function getFullName()
    {
        return $this->vehicleBrand->getName().' '.$this->name.' ('.$this->getSeries().')';
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
     * Set seriesStart.
     *
     * @param int $seriesStart
     *
     * @return Vehicle
     */
    public function setSeriesStart($seriesStart)
    {
        $this->seriesStart = $seriesStart;

        return $this;
    }

    /**
     * Get seriesStart.
     *
     * @return int
     */
    public function getSeriesStart()
    {
        return $this->seriesStart;
    }

    /**
     * Set seriesEnd.
     *
     * @param int $seriesEnd
     *
     * @return Vehicle
     */
    public function setSeriesEnd($seriesEnd)
    {
        $this->seriesEnd = $seriesEnd;

        return $this;
    }

    /**
     * Get seriesEnd.
     *
     * @return int
     */
    public function getSeriesEnd()
    {
        return $this->seriesEnd;
    }

    /**
     * Set vehicleCategory.
     *
     * @param \AppBundle\Entity\VehicleCategory|null $vehicleCategory
     *
     * @return Vehicle
     */
    public function setVehicleCategory(\AppBundle\Entity\VehicleCategory $vehicleCategory = null)
    {
        $this->vehicleCategory = $vehicleCategory;

        return $this;
    }

    /**
     * Get vehicleCategory.
     *
     * @return \AppBundle\Entity\VehicleCategory|null
     */
    public function getVehicleCategory()
    {
        return $this->vehicleCategory;
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
