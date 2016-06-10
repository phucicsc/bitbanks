<?php
class ModelCustomizeCountry extends Model {
	public function getCountry() {
		$query = $this->db->query("
			SELECT country_id AS id, name 
			FROM " . DB_PREFIX . "country 
			WHERE status = 1
			");
		return $query->rows;
	}
}