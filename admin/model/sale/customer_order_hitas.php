<?php
class ModelSaleCustomerOrderHitas extends Model {
	public function addOrderHitas($data) {
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "customer_order_hitas SET date_added = NOW(), money_invest = '" . str_replace(',', '', $data['money_invest'])  . "',floor = '" . $data['floor'] . "',percent_manage = '" . $data['percent_manage'] . "',bonus_first = '" .str_replace(',', '',  $data['bonus_first']) . "',bonus_second = '" . str_replace(',', '',  $data['bonus_second']) . "',num_vtna = '" . $data['num_vtna'] . "',salary = '" .str_replace(',', '',  $data['salary']) . "',month_salary = '" . $data['month_salary'] . "',type_gift = '" .str_replace(',', '', $data['type_gift']) . "'");
	}
	
	public function editOrderHitas($order_hitas_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer_order_hitas SET money_invest = '" . str_replace(',', '', $data['money_invest'])  . "',floor = '" . $data['floor'] . "',percent_manage = '" . $data['percent_manage'] . "',bonus_first = '" .str_replace(',', '',  $data['bonus_first']) . "',bonus_second = '" . str_replace(',', '',  $data['bonus_second']) . "',num_vtna = '" . $data['num_vtna'] . "',salary = '" .str_replace(',', '',  $data['salary']) . "',month_salary = '" . $data['month_salary'] . "',type_gift = '" .str_replace(',', '', $data['type_gift']) . "' WHERE id = '" . (int)$order_hitas_id . "'");
	}
	
	public function getOrderHitas($order_hitas_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_order_hitas WHERE id = '" . (int)$order_hitas_id . "'"); 
 
		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}
   
 
	public function getAllOrderHitas($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "customer_order_hitas";
       
       $implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "money_invest LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		
		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}
       
       
        
		if (isset($data['start']) && isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}
			
			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
		
			$sql .= " ORDER BY date_added DESC LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}	
		
		$query = $this->db->query($sql);
 
		return $query->rows;
	}
   
	public function deleteOrderHitas($order_hitas_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_order_hitas WHERE id = '" . (int)$order_hitas_id . "'");
	}
   
	public function getTotalOrderHitas($data) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_order_hitas";
		
        $implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "money_invest LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		
		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
		   $sql .= " AND " . implode(" AND ", $implode);
		}
        
       	$query = $this->db->query($sql);

		return $query->row['total'];
	}
}