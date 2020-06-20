<?php

class LegoSizes {
	private $db;
	private $sizes;

	public function __construct($allowed) {
		$db = new DB();
		if (isset($allowed) && !empty($allowed))
			$db->query("SELECT * FROM sizes WHERE size <= " . $allowed . " ORDER BY size DESC");
		else
			$db->query("SELECT * FROM sizes ORDER BY size DESC");

		// Füge alle Größen in ein Array zusammen
		while ( $row = $db->fetchObject() ) {
			$this->sizes[$row->size] = $row;
		}
	}

	/**
	 * Gibt die beste Größe zurück
	 */
	public function bestSize($number) {
		foreach (array_keys($this->sizes) as $a) {
			if ($a <= $number) return $a;
		}
		return 1;
	}

	public function getSize($size) {
		return $this->sizes[$size];
	}

	/**
	 * Gibt die verfügbaren Größen als JSON String zurück
	 */
	public function json() {
		return json_encode(array_keys($this->sizes));
	}
}