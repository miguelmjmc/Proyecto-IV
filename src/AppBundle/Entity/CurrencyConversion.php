<?php

namespace AppBundle\Entity;

use AppBundle\Utils\LogTrait;
use Doctrine\ORM\Mapping as ORM;
use MJMC\Bundle\CrudBundle\Core\AbstractCrud;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * CurrencyConversion
 *
 * @ORM\Table(name="currency_conversion")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\CurrencyConversionRepository")
 * @ORM\HasLifecycleCallbacks()
 */
class CurrencyConversion extends AbstractCrud
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
     * @Assert\Range(min = 0.01, max = 99999999.99)
     *
     * @ORM\Column(name="dollarValue", type="decimal", precision=10, scale=2)
     */
    private $dollarValue;

    /**
     * @var string
     *
     * @Assert\NotBlank
     * @Assert\Range(min = 0.01, max = 99999999.99)
     *
     * @ORM\Column(name="euroValue", type="decimal", precision=10, scale=2)
     */
    private $euroValue;


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
     * Set dollarValue.
     *
     * @param string $dollarValue
     *
     * @return CurrencyConversion
     */
    public function setDollarValue($dollarValue)
    {
        $this->dollarValue = $dollarValue;

        return $this;
    }

    /**
     * Get dollarValue.
     *
     * @return string
     */
    public function getDollarValue()
    {
        return $this->dollarValue;
    }

    /**
     * Set euroValue.
     *
     * @param string $euroValue
     *
     * @return CurrencyConversion
     */
    public function setEuroValue($euroValue)
    {
        $this->euroValue = $euroValue;

        return $this;
    }

    /**
     * Get euroValue.
     *
     * @return string
     */
    public function getEuroValue()
    {
        return $this->euroValue;
    }
}
