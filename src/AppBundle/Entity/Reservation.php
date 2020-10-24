<?php

namespace AppBundle\Entity;

use AppBundle\Utils\LogTrait;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use MJMC\Bundle\CrudBundle\Core\AbstractCrud;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Reservation
 *
 * @ORM\Table(name="reservation")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ReservationRepository")
 * @ORM\HasLifecycleCallbacks()
 */
class Reservation extends AbstractCrud
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
     * @Assert\Length(min = 10, max = 50)
     * @Assert\Email()
     *
     * @ORM\Column(name="email", type="string", length=255, unique=true)
     */
    private $email;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 10, max = 20)
     *
     * @ORM\Column(name="phone", type="string", length=255)
     */
    private $phone;

    /**
     * @var string
     *
     * @Assert\Length(min = 4, max = 2000)
     *
     * @ORM\Column(name="comment", type="text", nullable=true)
     */
    private $comment;

    /**
     * @var ReservationStatus
     *
     * @Assert\NotBlank
     *
     * @ORM\ManyToOne(targetEntity="ReservationStatus", inversedBy="reservation")
     */
    private $reservationStatus;

    /**
     * @var ArrayCollection
     *
     * @Assert\Count(min = 1)
     *
     * @ORM\OneToMany(targetEntity="ReservationJoinProduct", mappedBy="reservation")
     */
    private $reservationJoinProduct;


    /**
     * Constructor
     */
    public function __construct()
    {
        $this->reservationJoinProduct = new \Doctrine\Common\Collections\ArrayCollection();
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
     * @return Reservation
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
     * Set email.
     *
     * @param string $email
     *
     * @return Reservation
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
     * Set phone.
     *
     * @param string $phone
     *
     * @return Reservation
     */
    public function setPhone($phone)
    {
        $this->phone = $phone;

        return $this;
    }

    /**
     * Get phone.
     *
     * @return string
     */
    public function getPhone()
    {
        return $this->phone;
    }

    /**
     * Set comment.
     *
     * @param string|null $comment
     *
     * @return Reservation
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
     * Set reservationStatus.
     *
     * @param \AppBundle\Entity\ReservationStatus|null $reservationStatus
     *
     * @return Reservation
     */
    public function setReservationStatus(\AppBundle\Entity\ReservationStatus $reservationStatus = null)
    {
        $this->reservationStatus = $reservationStatus;

        return $this;
    }

    /**
     * Get reservationStatus.
     *
     * @return \AppBundle\Entity\ReservationStatus|null
     */
    public function getReservationStatus()
    {
        return $this->reservationStatus;
    }

    /**
     * Add reservationJoinProduct.
     *
     * @param \AppBundle\Entity\ReservationJoinProduct $reservationJoinProduct
     *
     * @return Reservation
     */
    public function addReservationJoinProduct(\AppBundle\Entity\ReservationJoinProduct $reservationJoinProduct)
    {
        $this->reservationJoinProduct[] = $reservationJoinProduct;

        return $this;
    }

    /**
     * Remove reservationJoinProduct.
     *
     * @param \AppBundle\Entity\ReservationJoinProduct $reservationJoinProduct
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeReservationJoinProduct(\AppBundle\Entity\ReservationJoinProduct $reservationJoinProduct)
    {
        return $this->reservationJoinProduct->removeElement($reservationJoinProduct);
    }

    /**
     * Get reservationJoinProduct.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getReservationJoinProduct()
    {
        return $this->reservationJoinProduct;
    }
}
