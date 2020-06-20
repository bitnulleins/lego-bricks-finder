<p align="center"><img src="https://www.bit01.de/wp-content/uploads/2017/02/bit01_logo_bricksfinder.png" /></p>

<p align="center"><img src="https://img.shields.io/maintenance/no/2019" /> <img src="https://img.shields.io/github/v/release/bitnulleins/lego-bricks-finder" /></p>

# What is Bricksfinder?

Algorithm that calculate the optimial amount and size of LEGO bricks to build a 3D figure or mosaic image with lego bricks.

* Calculate optimal brick amount
* Prefere bigger size for lower cost
* Calculate price, weight and size of finished figure
* Transform true color to LEGO bricks color

## Online service

A full service of this algorithm (with frontend) can be bound <a href="http://bricksfinder.bit01.de" target="_blank">here</a> (German).

## Installation

1. Fill out [config.php](config_example.php)
2. Import SQL to MySQL with [init_install.sql](init_install.sql)
3. Call main function with base64 coded image:
```php
<?php
require(__DIR__ . '/src/bricksfinder.class.php');

$bricksfinder = new Bricksfinder(B64_STRING_HERE);
$bricksfinder->getBricks(); // return array of bricks configuration
```

## Result

For example 3D figure of "Megaman":

**Input:**

![Megaman small gif](https://www.bit01.de/wp-content/uploads/2020/06/Mega_Man_sprite_Left.png)

**(Builded) Output:**

<img src="https://www.bit01.de/wp-content/uploads/2020/06/Figure.gif" />

# Licence

MIT Licence
