<?php

class LegoColors {
	private $db;
	private $legoColors;

	public function __construct() {
		$db = new DB();
		$db->query("SELECT ID,name,red,green,blue FROM farben WHERE active=1");

		// Füge alle Farben in ein Array zusammen
		while ($row = $db->fetchObject()) {
			$this->legoColors[$row->ID] = $row;
		}
	}
	
	/**
	 * Gibt die passenste Farbe zurück
	 * @param Farbe
	 */
	public function bestColor($color) {
		$minDiff = PHP_INT_MAX;

		foreach ($this->legoColors as $color_elem)
		{
			$diff = abs($color['red'] - $color_elem->red) +
					abs($color['green'] - $color_elem->green) +
					abs($color['blue'] - $color_elem->blue);

			if ($diff<$minDiff)
			{
				$minDiff = $diff;
				$best_color = $color_elem;
			}
		}

		return $best_color;
	}

	/**
	 * Wandelt die Farbe in ein rgb-String um
	 */
	public function toRGBString($lego_id) {
		return "rgb(" . $this->legoColors[$lego_id]->red . "," . $this->legoColors[$lego_id]->green . "," . $this->legoColors[$lego_id]->blue . ")";
	}

	/**
	 * Gibt ein Farbobjekt zurück mit allen Informationen
	 * @param  Lego Farben Nummer
	 */
	public function getColor($lego_id) {
		return $this->legoColors[$lego_id];
	}

	/**
	 * Gibt die verfügbaren LEGO-Farben als JSON String zurück
	 */
	public function json() {
		$db = new DB();
		$db->query("SELECT ID,name,red,green,blue FROM farben WHERE active=1");
		
		while ($row = $db->fetchObject()) {
			$this->jsonColors[] = $row;
		}
		return json_encode($this->jsonColors,JSON_PRETTY_PRINT);
	}
}