<?php

namespace AppBundle\Entity;

use AppBundle\Utils\LogTrait;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use MJMC\Bundle\CrudBundle\Core\AbstractCrud;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Product
 *
 * @ORM\Table(name="product")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ProductRepository")
 * @ORM\HasLifecycleCallbacks()
 * @UniqueEntity("code")
 * @UniqueEntity({"description", "productBrand"})
 */
class Product extends AbstractCrud
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
     * @ORM\Column(name="code", type="string", length=255, unique=true)
     */
    private $code;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 3, max = 50)
     *
     * @ORM\Column(name="description", type="string", length=255)
     */
    private $description;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Range(min = 0.01, max = 99999999.99)
     *
     * @ORM\Column(name="price", type="decimal", precision=10, scale=2)
     */
    private $price;

    /**
     * @var int
     *
     * @Assert\NotBlank
     * @Assert\Range(min = 0, max = 9999999999)
     *
     * @ORM\Column(name="stock", type="integer")
     */
    private $stock;

    /**
     * @var string
     *
     * @Assert\Length(min = 4, max = 2000)
     *
     * @ORM\Column(name="comment", type="text", nullable=true)
     */
    private $comment;

    /**
     * @var integer
     *
     * @ORM\Column(name="viewCounter", type="integer")
     */
    private $viewCounter = 0;

    /**
     * @var string
     *
     * @ORM\Column(name="img", type="string", length=255, nullable=true)
     */
    private $img;

    /**
     * @var ProductBrand
     *
     * @Assert\NotBlank
     *
     * @ORM\ManyToOne(targetEntity="ProductBrand", inversedBy="product")
     */
    private $productBrand;

    /**
     * @var ProductCategory
     *
     * @Assert\Count(min = 1)
     *
     * @ORM\ManyToMany(targetEntity="ProductCategory", inversedBy="product")
     */
    private $productCategory;

    /**
     * @var ArrayCollection
     *
     * @Assert\Count(min = 1)
     *
     * @ORM\ManyToMany(targetEntity="Vehicle", inversedBy="product")
     */
    private $vehicle;


    /**
     * Constructor
     */
    public function __construct()
    {
        $this->productCategory = new \Doctrine\Common\Collections\ArrayCollection();
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
     * Set code.
     *
     * @param string $code
     *
     * @return Product
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }

    /**
     * Get code.
     *
     * @return string
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Set description.
     *
     * @param string $description
     *
     * @return Product
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description.
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set price.
     *
     * @param string $price
     *
     * @return Product
     */
    public function setPrice($price)
    {
        $this->price = $price;

        return $this;
    }

    /**
     * Get price.
     *
     * @return string
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * Set stock.
     *
     * @param int $stock
     *
     * @return Product
     */
    public function setStock($stock)
    {
        $this->stock = $stock;

        return $this;
    }

    /**
     * Get stock.
     *
     * @return int
     */
    public function getStock()
    {
        return $this->stock;
    }

    /**
     * Set comment.
     *
     * @param string|null $comment
     *
     * @return Product
     */
    public function setComment($comment = null)
    {
        $this->comment = $comment;

        return $this;
    }

    /**
     * Get comment.
     *
     * @return string|null
     */
    public function getComment()
    {
        return $this->comment;
    }

    /**
     * Set viewCounter.
     *
     * @param int $viewCounter
     *
     * @return Product
     */
    public function setViewCounter($viewCounter)
    {
        $this->viewCounter = $viewCounter;

        return $this;
    }

    /**
     * Get viewCounter.
     *
     * @return int
     */
    public function getViewCounter()
    {
        return $this->viewCounter;
    }

    /**
     * Set img.
     *
     * @param string|null $img
     *
     * @return Product
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
     * Set productBrand.
     *
     * @param \AppBundle\Entity\ProductBrand|null $productBrand
     *
     * @return Product
     */
    public function setProductBrand(\AppBundle\Entity\ProductBrand $productBrand = null)
    {
        $this->productBrand = $productBrand;

        return $this;
    }

    /**
     * Get productBrand.
     *
     * @return \AppBundle\Entity\ProductBrand|null
     */
    public function getProductBrand()
    {
        return $this->productBrand;
    }

    /**
     * Add productCategory.
     *
     * @param \AppBundle\Entity\ProductCategory $productCategory
     *
     * @return Product
     */
    public function addProductCategory(\AppBundle\Entity\ProductCategory $productCategory)
    {
        $this->productCategory[] = $productCategory;

        return $this;
    }

    /**
     * Remove productCategory.
     *
     * @param \AppBundle\Entity\ProductCategory $productCategory
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeProductCategory(\AppBundle\Entity\ProductCategory $productCategory)
    {
        return $this->productCategory->removeElement($productCategory);
    }

    /**
     * Get productCategory.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getProductCategory()
    {
        return $this->productCategory;
    }

    /**
     * Add vehicle.
     *
     * @param \AppBundle\Entity\Vehicle $vehicle
     *
     * @return Product
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
