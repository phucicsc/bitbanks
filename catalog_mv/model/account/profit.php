<?php
class ModelAccountProfit extends Model {

	
	public function getProfitByType($id_package,$typeProfit) {
		$query = $this->db->query("SELECT sum(receive) AS total FROM " . DB_PREFIX . "profit WHERE ml_package_id = '" . (int)$id_package . "' and type_profit in (".$typeProfit.")");

		return $query->row['total'];
	}
	
	public function getProfitByTypeNotPackage($user_id,$typeProfit) {
		$query = $this->db->query("SELECT sum(receive) AS total FROM " . DB_PREFIX . "profit WHERE user_id = '" . (int)$user_id . "' and type_profit in (".$typeProfit.")");

		return $query->row['total'];
	}

	
	public function getListBalance($id_package,$start_date,$end_date) {
		/*
		$from = strtotime($start_date.' 00:00:00');
		$to = strtotime($end_date.' 23:59:59');
		$query = $this->db->query("SELECT c.username AS from_user, pr.* FROM " . DB_PREFIX . "profit pr LEFT JOIN " . DB_PREFIX . "customer c ON (pr.from_userid = c.customer_id)  WHERE pr.ml_package_id = '" . (int)$id_package . "' and pr.date >= ".$from." and pr.date <= ".$to." ORDER BY pr.date desc");
		return $query->rows;
		*/
		$query = $this->db->query("SELECT c.username AS from_user, pr.* FROM " . DB_PREFIX . "profit pr LEFT JOIN " . DB_PREFIX . "customer c ON (pr.from_userid = c.customer_id)  WHERE pr.ml_package_id = '" . (int)$id_package . "' ORDER BY pr.date desc");
		return $query->rows;
	}
	
	public function getListBalanceNotPackage($user_id,$start_date,$end_date) {
		/*
		$from = strtotime($start_date.' 00:00:00');
		$to = strtotime($end_date.' 23:59:59');
		$query = $this->db->query("SELECT c.username AS from_user, pr.* FROM " . DB_PREFIX . "profit pr LEFT JOIN " . DB_PREFIX . "customer c ON (pr.from_userid = c.customer_id)  WHERE pr.user_id = '" . (int)$user_id . "' and pr.date >= ".$from." and pr.date <= ".$to." ORDER BY pr.date desc");
		return $query->rows;
		*/
		$query = $this->db->query("SELECT c.username AS from_user, pr.* FROM " . DB_PREFIX . "profit pr LEFT JOIN " . DB_PREFIX . "customer c ON (pr.from_userid = c.customer_id)  WHERE pr.user_id = '" . (int)$user_id . "' ORDER BY pr.date desc");
		return $query->rows;
	}
	
	
	public function getParentNode($customer_id){
		$query = $this->db->query("SELECT p_node FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");
		$result = $query->row;
		return $result['p_node'];
	}
	
	public function getLevelCustomer($customer_id){
		$query = $this->db->query("SELECT level FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");
		$result = $query->row;
		return $result['level'];
	}
	
	

}
