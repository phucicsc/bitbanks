<?php
	class ModelOfficeOffice extends Model {
		
		public function addOffice($data) {
			$this->db->query("INSERT INTO `" . DB_PREFIX . "office` SET name = '" . $this->db->escape($data['name']) . "',description = '" . $this->db->escape($data['description']) . "', status='" . (int)$data['status'] . "'");
					
		}
		
		public function editOffice($office_id, $data) {
			$this->db->query("UPDATE `" . DB_PREFIX . "office` SET name = '" . $this->db->escape($data['name']) . "',description = '" . $this->db->escape($data['description']) . "', status='" . (int)$data['status'] . "', id_manager='" . (int)$data['id_manager'] . "', id_vice_president1='" . (int)$data['id_vice_president1'] . "', id_vice_president2='" . (int)$data['id_vice_president2'] . "' WHERE id='" . (int)$office_id . "'");
			
		}
		
		public function deleteOffice($office_id) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "office WHERE id = '" . (int)$office_id . "'");
		}
		
		public function getListCustomer() {
			$query = $this->db->query("SELECT  *  FROM `" . DB_PREFIX . "customer` ");	
			return $query->rows;
		}
		
		public function getListRoomInOffice($office_id) {
			$query = $this->db->query("SELECT  r.* , 0 AS money_order,CONCAT(u1.lastname ,' ', u1.firstname) AS name_manager,CONCAT(u2.lastname,' ',u2.firstname) AS name_vice_president FROM `" . DB_PREFIX . "room` AS r Left Join " . DB_PREFIX . "customer as u1 ON r.id_manager = u1.customer_id Left Join " . DB_PREFIX . "customer as u2 ON r.id_vice_president = u2.customer_id WHERE id_office = '" . (int)$office_id . "'");	
			return $query->rows;
		}
		
		public function getOffice($office_id) {
			$query = $this->db->query("SELECT DISTINCT * FROM `" . DB_PREFIX . "office` WHERE id = '" . (int)$office_id . "'");	
			return $query->row;
		}		
		
		public function getTotalOffices($data = array()) {
			$sql = $this->db->query("SELECT COUNT(DISTINCT(id)) AS total FROM `" . DB_PREFIX . "office` ");
			return $sql->row['total'];
		}
		
		public function getOffices($data = array()) {
			$sql = "SELECT o.*,CONCAT(u1.lastname ,' ', u1.firstname) AS name_manager,CONCAT(u2.lastname,' ',u2.firstname) AS name_vice_president1,CONCAT(u3.lastname,' ',u3.firstname) AS name_vice_president2 FROM `" . DB_PREFIX . "office` AS o Left Join " . DB_PREFIX . "customer as u1 ON o.id_manager = u1.customer_id Left Join " . DB_PREFIX . "customer as u2 ON o.id_vice_president1 = u2.customer_id Left Join " . DB_PREFIX . "customer as u3 ON o.id_vice_president2 = u3.customer_id   ";
			
			if(isset($data['filter_office']) && $data['filter_office'] != '') {
				$sql .= " AND name LIKE '" . $this->db->escape($data['filter_office']) . "%'";
			}
			
			$sort_data = array(
				'o.name',
				'o.status'
			);	
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY o.name";	
			}
	
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}
	
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}				
	
				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	
	
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	
	
			$query = $this->db->query($sql);
	
			return $query->rows;		
		}
		
		public function getListCustomerInRoom($room_id) {
			$query = $this->db->query("SELECT  * , 0 AS money_order FROM `" . DB_PREFIX . "customer` WHERE room_id = '" . (int)$room_id . "'");	
			return $query->rows;
		}
		
		public function getTotalMoneyOrderByRoom($room_id) {
			$listCustomer = $this->getListCustomerInRoom($room_id);
			$listCus = '';
			foreach ($listCustomer as $cus) {
				$listCus .= ','.$cus['customer_id'];
			}
			$listCus = substr($listCus, 1);
			if($listCus != ''){
				$sql = $this->db->query("SELECT SUM(money_invest) AS total FROM `" . DB_PREFIX . "customer_order` WHERE customer_id in (" . $listCus . ")");
				return $sql->row['total'];
			}else{
				return 0;
			}
		}
		
		public function getTotalMoneyOrderByOffice($office_id) {
			$totalMoney = 0;
			$listRoom = $this->getListRoomInOffice($office_id);
			foreach ($listRoom as $room) {
				$totalMoney += $this->getTotalMoneyOrderByRoom($room['id']);
			}
			return $totalMoney;
		}
		
		
		public function getOfficeName($office_id) {
			$sql = $this->db->query("SELECT name FROM `" . DB_PREFIX . "office` WHERE id='" . (int)$office_id . "'");
			return $sql->row['name'];
		}

		public function checkOfficeName($name, $office_id = 0) {
			if(!$office_id) {
				$sql = $this->db->query("SELECT * FROM `" . DB_PREFIX . "office` WHERE LCASE(name) = '" . $this->db->escape(utf8_strtolower($name)) . "'");
				return $sql->num_rows;
			} else {
				$sql = $this->db->query("SELECT * FROM `" . DB_PREFIX . "office` WHERE LCASE(name) = '" . $this->db->escape(utf8_strtolower($name)) . "' AND id <> '" . (int)$office_id . "'");
				return $sql->num_rows;
			}
		}
		
		public function getTotalCustomerByOfficeId($office_id) {
			$sql = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer` WHERE rooom_id='" . (int)$office_id . "'");
			return $sql->num_rows;
		}		
	}
?>