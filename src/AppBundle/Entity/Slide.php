<?php

namespace AppBundle\Entity;

use AppBundle\Utils\LogTrait;
use Doctrine\ORM\Mapping as ORM;
use MJMC\Bundle\CrudBundle\Core\AbstractCrud;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Slide
 *
 * @ORM\Table(name="slide")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\SlideRepository")
 * @ORM\HasLifecycleCallbacks()
 */
class Slide extends AbstractCrud
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
     * @Assert\Length(min = 4, max = 25)
     *
     * @ORM\Column(name="description", type="string", length=255)
     */
    private $description;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 4, max = 30)
     *
     * @ORM\Column(name="title1", type="string", length=255)
     */
    private $title1;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 4, max = 20)
     *
     * @ORM\Column(name="title2", type="string", length=255)
     */
    private $title2;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Length(min = 2, max = 10)
     *
     * @ORM\Column(name="buttonText", type="string", length=255)
     */
    private $buttonText;

    /**
     * @var string
     *
     * @Assert\NotBlank
     *
     * @ORM\Column(name="buttonLink", type="string", length=255)
     */
    private $buttonLink;

    /**
     * @var string
     *
     * @ORM\Column(name="img", type="string", length=255, nullable=true)
     */
    private $img;


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
     * Set description.
     *
     * @param string $description
     *
     * @return Slide
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
     * Set title1.
     *
     * @param string $title1
     *
     * @return Slide
     */
    public function setTitle1($title1)
    {
        $this->title1 = $title1;

        return $this;
    }

    /**
     * Get title1.
     *
     * @return string
     */
    public function getTitle1()
    {
        return $this->title1;
    }

    /**
     * Set title2.
     *
     * @param string $title2
     *
     * @return Slide
     */
    public function setTitle2($title2)
    {
        $this->title2 = $title2;

        return $this;
    }

    /**
     * Get title2.
     *
     * @return string
     */
    public function getTitle2()
    {
        return $this->title2;
    }

    /**
     * Set buttonText.
     *
     * @param string $buttonText
     *
     * @return Slide
     */
    public function setButtonText($buttonText)
    {
        $this->buttonText = $buttonText;

        return $this;
    }

    /**
     * Get buttonText.
     *
     * @return string
     */
    public function getButtonText()
    {
        return $this->buttonText;
    }

    /**
     * Set buttonLink.
     *
     * @param string $buttonLink
     *
     * @return Slide
     */
    public function setButtonLink($buttonLink)
    {
        $this->buttonLink = $buttonLink;

        return $this;
    }

    /**
     * Get buttonLink.
     *
     * @return string
     */
    public function getButtonLink()
    {
        return $this->buttonLink;
    }

    /**
     * Set img.
     *
     * @param string|null $img
     *
     * @return Slide
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
}
