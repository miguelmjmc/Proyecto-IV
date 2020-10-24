<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * ReservationJoinProduct
 *
 * @ORM\Table(name="reservation_join_product")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ReservationJoinProductRepository")
 */
class ReservationJoinProduct
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
     * @var int
     *
     * @Assert\NotBlank
     * @Assert\Range(min = 1, max = 99999999)
     *
     * @ORM\Column(name="quantity", type="integer")
     */
    private $quantity;

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
     * @var Product
     *
     * @Assert\NotBlank
     *
     * @ORM\ManyToOne(targetEntity="Product", inversedBy="reservationJoinProduct")
     */
    private $product;

    /**
     * @var Reservation
     *
     * @Assert\NotBlank
     *
     * @ORM\ManyToOne(targetEntity="Reservation", inversedBy="reservationJoinProduct")
     */
    private $reservation;


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
     * Set quantity.
     *
     * @param int $quantity
     *
     * @return ReservationJoinProduct
     */
    public function setQuantity($quantity)
    {
        $this->quantity = $quantity;

        return $this;
    }

    /**
     * Get quantity.
     *
     * @return int
     */
    public function getQuantity()
    {
        return $this->quantity;
    }

    /**
     * Set price.
     *
     * @param string $price
     *
     * @return ReservationJoinProduct
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
     * Set product.
     *
     * @param \AppBundle\Entity\Product|null $product
     *
     * @return ReservationJoinProduct
     */
    public function setProduct(\AppBundle\Entity\Product $product = null)
    {
        $this->product = $product;

        return $this;
    }

    /**
     * Get product.
     *
     * @return \AppBundle\Entity\Product|null
     */
    public function getProduct()
    {
        return $this->product;
    }

    /**
     * Set reservation.
     *
     * @param \AppBundle\Entity\Reservation|null $reservation
     *
     * @return ReservationJoinProduct
     */
    public function setReservation(\AppBundle\Entity\Reservation $reservation = null)
    {
        $this->reservation = $reservation;

        return $this;
    }

    /**
     * Get reservation.
     *
     * @return \AppBundle\Entity\Reservation|null
     */
    public function getReservation()
    {
        return $this->reservation;
    }
}
