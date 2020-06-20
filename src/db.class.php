<?php

require(__DIR__ . '../config.php');

class DB {
	private $connection 	= NULL;
	private $result 		= NULL;
	private $counter		= NULL;

	/**
	 * Stellt die SQL-Verbindung her
	 */
	public function __construct(){
		$this->connection = new MySQLi(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME);

		if (mysqli_connect_errno()) {
			printf('Cant connect to database');
			exit;
		}
	}

	public function disconnect() {
		$this->connection->close();
	}

	public function query($query) {
		$this->result 	= $this->connection->query($query);
		$this->counter 	= NULL;
	}

	public function fetchAssoc() {
		return $this->result->fetch_assoc();
	}

	public function fetchObject() {
		return $this->result->fetch_object();
	}

	public function fetchArray() {
		return $this->result->fetch_array();
	}
}