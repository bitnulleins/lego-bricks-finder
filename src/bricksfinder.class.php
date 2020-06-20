<?php
require(__DIR__ . 'db.class.php');
require(__DIR__ . 'colors.class.php');
require(__DIR__ . 'sizes.class.php');

class BricksFinder {
	private $image, $thumb;
	private $bricks, $sumCosts, $sumMass, $rows, $columns = 0;
	private $result, $manual = array();

	private $legoColors, $legoSizes;

	/**
	 * Berechnet die benötigten Steine, Höhe, Breite und geschätzten Kosten aus
	 * @return Array mit benötigten Steinen einer Farbe
	 */
	public function __construct($b64, $allowed = NULL) {
        $bin = base64_decode($b64);
        $im = imageCreateFromString($bin);

        if (!$im) {
            die('Base64 value is not a valid image');
        }
		$this->image = $im;

		$this->legoColors = new LegoColors();
		$this->legoSizes = new LegoSizes($allowed);

		$last_x = 0;

		$width = imagesx($this->image);
		$height = imagesy($this->image);
		
		/* 2. Image erstellen, mit echten Farben! */
		
		$this->thumb = imagecreatetruecolor($width, $height);
			
		imagealphablending($this->thumb, false);
		$transparency = imagecolorallocatealpha($this->thumb, 0, 0, 0, 127);
		imagefill($this->thumb, 0, 0, $transparency);
		imagesavealpha($this->thumb, true);
	
		for($y = 0; $y < $height; $y++)
		{
			$counter = 1;
			$row_has_color = false;
			for ($x = 0; $x < $width; $x++)
			{	
				$current_color = imagecolorsforindex($this->image, imagecolorat($this->image, $x, $y));
				
				$color_top = imagecolorsforindex($this->image, imagecolorat($this->image, $x, $y-1));
				$color_right = imagecolorsforindex($this->image, imagecolorat($this->image, $x-1, $y)); 
				$color_bottom = imagecolorsforindex($this->image, imagecolorat($this->image, $x, $y+1));
				$color_left = imagecolorsforindex($this->image, imagecolorat($this->image, $x+1, $y)); 
				
				if ($x == 0) $prev_color = $current_color;
				
				if($prev_color['alpha'] == 0) {
					$bs = $this->legoColors->bestColor($prev_color);
					imagesetpixel ( $this->thumb , $x-1 , $y , imagecolorallocate($this->thumb, $bs->red, $bs->green, $bs->blue) );
				}

				if ($current_color['alpha'] != 0 && $prev_color['alpha'] != 0) continue;

				if ($current_color['alpha'] == 0) {
					if (!isset($first_x)) $first_x = $x;
					if ( $x < $first_x ) $first_x = $x;
					if ( $x > $last_x ) $last_x = $x;
				}

				if ($prev_color == $current_color && $x != 0) { // nicht an erster Stelle zählen
					$counter++;
				} else {
					if ($prev_color['alpha'] == 0) {
						$res_color = $this->legoColors->bestColor($prev_color);

						$row_has_color = true;

						while ($counter >= 1)
						{
							$length = $this->legoSizes->bestSize($counter);

							if (!isset($this->result[$res_color->ID][$length])) 
								$this->result[$res_color->ID][$length] = 1;
							else 
								$this->result[$res_color->ID][$length] += 1;
							
							/* Für die Anleitung! */
							$this->manual[$y][] = array('size'=>$length,'color'=>$res_color->name,'color_id'=>$res_color->ID);
							/* ----------------- */
							
							$counter -= $length; 
							
							$this->sumCosts += $this->legoSizes->getSize($length)->cost;
							$this->sumMass 	+= $this->legoSizes->getSize($length)->mass;
							$this->bricks++;
						}
					}
					
					$counter = 1;
				}
				$prev_color = $current_color;
			}
			if ($row_has_color) {
				$this->rows++;
			}
		}
		$this->columns = $last_x - $first_x + 1;

	}

	/**
	 * Gibt die jeweilige Anzahl und Farbe benötigter Steine zurück
	 */
	public function getBricks() {
		return $this->result;
	}
	/**
	* Gibt das RealColor Bild wieder...
	*/
	
	public function getRealImage() {
		return $this->thumb;	
	}

	/**
	 * Gibt die Anzahl benötigter Steine zurück
	 */
	public function getAmount() {
		return intval($this->bricks);
	}

	/**
	 * Gibt die Breite der Figur in cm wieder
	 */
	public function getWidth() {
		return $this->format($this->columns * BRICKS_WIDTH) . "cm";
	}
	
	/*
	 * Gibt die Anleitung für das aufbauen aus
	 */
	public function getManual() {
		return array_reverse($this->manual);	
	}
	
	public function getManualSize() {
		return $this->rows + $this->bricks;	
	}
	
	public function getManualAsJson() {
		return json_encode($this->getManual());	
	}

	/**
	 * Gibt die Höhe der Figur in cm wieder
	 */
	public function getHeight() {
		return $this->format($this->rows * BRICKS_HEIGHT) . "cm";
	}

	/** 
	 * Gibt die Masse der Figur in cm wieder
	 */
	public function getMass() {
		return $this->format($this->sumMass) . "g";
	}

	/**
	 * Gibt die geschätzten Kosten der Figur wieder
	 */
	public function getCosts() {
		return $this->format($this->sumCosts) . "€";
	}

	/**
	 * Wandelt ein double in ein gerundeten formatieren Wert um
	 * @param  double irgendeine Zahl
	 */
	public function format($number) {
		return number_format($number, 1, ',', '.');
	}

	/**
	 * Gibt die berechnten Daten als JSON zurück
	 */
	public function json() {
		return json_encode($result);
	}

	/**
	 * Gibt das LegoColor Objekt zurück
	 */
	public function getLegoColorObj() {
		return $this->legoColors;
	}
}