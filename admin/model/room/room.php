<?php
	class ModelRoomRoom extends Model {
		
		public function addRoom($data) {
			$this->db->query("INSERT INTO `" . DB_PREFIX . "room` SET name = '" . $this->db->escape($data['name']) . "',description = '" . $this->db->escape($data['description']) . "', status='" . (int)$data['status'] . "', id_office='" . (int)$data['id_office'] . "'");
					
		}
		
		public function editRoom($room_id, $data) {
			$this->db->query("UPDATE `" . DB_PREFIX . "room` SET name = '" . $this->db->escape($data['name']) . "',description = '" . $this->db->escape($data['description']) . "', status='" . (int)$data['status'] . "', id_manager='" . (int)$data['id_manager'] . "', id_vice_president='" . (int)$data['id_vice_president'] . "', id_office='" . (int)$data['id_office'] . "' WHERE id='" . (int)$room_id . "'");
			
		}
		
		public function deleteRoom($room_id) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "room WHERE id = '" . (int)$room_id . "'");
		}
		
		public function getRoom($room_id) {
			$query = $this->db->query("SELECT DISTINCT * FROM `" . DB_PREFIX . "room` WHERE id = '" . (int)$room_id . "'");	
			return $query->row;
		}	
		
		public function getListOffice() {
			$query = $this->db->query("SELECT  *  FROM `" . DB_PREFIX . "office` ");	
			return $query->rows;
		}
			
		public function getListCustomerInRoom($room_id) {
			$query = $this->db->query("SELECT  * , 0 AS money_order FROM `" . DB_PREFIX . "customer` WHERE room_id = '" . (int)$room_id . "'");	
			return $query->rows;
		}
		
		public function getTotalMoneyOrder($customer_id) {
			$sql = $this->db->query("SELECT SUM(money_invest) AS total FROM `" . DB_PREFIX . "customer_order` WHERE customer_id = '" . (int)$customer_id . "'");
			return $sql->row['total'];
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
		
		public function getListCustomerInRoomNotManager($room_id,$id_manager) {
			$query = $this->db->query("SELECT  * FROM `" . DB_PREFIX . "customer` WHERE room_id = '" . (int)$room_id . "' and customer_id != '".(int)$id_manager."'");	
			return $query->rows;
		}
		
		public function getTotalRooms($data = array()) {
			$sql = $this->db->query("SELECT COUNT(DISTINCT(id)) AS total FROM `" . DB_PREFIX . "room` ");
			return $sql->row['total'];
		}
		
		public function getRooms($data = array()) {
			$sql = "SELECT r.*,CONCAT(u1.lastname ,' ', u1.firstname) AS name_manager,CONCAT(u2.lastname,' ',u2.firstname) AS name_vice_president,o.name AS nameOffice FROM `" . DB_PREFIX . "room` AS r Left Join " . DB_PREFIX . "customer as u1 ON r.id_manager = u1.customer_id Left Join " . DB_PREFIX . "customer as u2 ON r.id_vice_president = u2.customer_id Left Join " . DB_PREFIX . "office as o ON o.id = r.id_office";
			
			if(isset($data['filter_room']) && $data['filter_room'] != '') {
				$sql .= " AND r.name LIKE '" . $this->db->escape($data['filter_room']) . "%'";
			}
			
			$sort_data = array(
				'r.name',
				'r.status'
			);	
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY r.name";	
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
		
		
		public function getRoomName($room_id) {
			$sql = $this->db->query("SELECT name FROM `" . DB_PREFIX . "room` WHERE id='" . (int)$room_id . "'");
			return $sql->row['name'];
		}

		public function checkRoomName($name, $room_id = 0) {
			if(!$room_id) {
				$sql = $this->db->query("SELECT * FROM `" . DB_PREFIX . "room` WHERE LCASE(name) = '" . $this->db->escape(utf8_strtolower($name)) . "'");
				return $sql->num_rows;
			} else {
				$sql = $this->db->query("SELECT * FROM `" . DB_PREFIX . "room` WHERE LCASE(name) = '" . $this->db->escape(utf8_strtolower($name)) . "' AND id <> '" . (int)$room_id . "'");
				return $sql->num_rows;
			}
		}
		
		public function getTotalCustomerByRoomId($room_id) {
			$sql = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer` WHERE rooom_id='" . (int)$room_id . "'");
			return $sql->num_rows;
		}		
	}
?>