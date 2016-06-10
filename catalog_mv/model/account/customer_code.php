<?php
class ModelAccountCustomerCode extends Model {
	
	public function exportCode($customer_id,$type) {
		switch ($type){
			case '1':
				$typeMoney = 1000;
				break;
			case '3':
				$typeMoney = 3000;
				break;
			case '5':
				$typeMoney = 5000;
				break;
			case '10':
				$typeMoney = 10000;
				break;
		}
		
		$code = $this->makeCode();
		$data['code'] = $code;
		$data['type_money'] = $typeMoney;
		$data['customer_id'] = $customer_id;
		$this->addCode($data);

		return 1;
	}
	
	public function buyCode($customer_id,$type) {
		switch ($type){
			case '1':
				$typeMoney = 1000;
				break;
			case '3':
				$typeMoney = 3000;
				break;
			case '5':
				$typeMoney = 5000;
				break;
			case '10':
				$typeMoney = 10000;
				break;
		}
		
		$query = $this->db->query("SELECT id FROM " . DB_PREFIX . "customer_code WHERE money = '" . $typeMoney . "' and id_customer_buy_code is null and id_customer_input_code is null limit 1");

		$result =  $query->row;
		if(!empty($result)){
			$id = $result['id'];
			$this->db->query("UPDATE " . DB_PREFIX . "customer_code SET id_customer_buy_code = '".$customer_id."' WHERE id = '" . $id . "'");
			return 1;
		}else{
			return 2;
		}
		
	}
	
	public function inputCode($customer_id,$code) {
		
		$query = $this->db->query("SELECT id FROM " . DB_PREFIX . "customer_code WHERE code = '" . $code . "' and id_customer_buy_code is not null and id_customer_input_code is null");

		$result =  $query->row;
		if(!empty($result)){
			$date = date("Y-m-d H:i:s");
			$id = $result['id'];
			$this->db->query("UPDATE " . DB_PREFIX . "customer_code SET id_customer_input_code = '".$customer_id."',date_input_code  = '".strtotime($date)."' WHERE id = '" . $id . "'");
			return 1;
		}else{
			return 2;
		}
		
	}
	
	public function countCode($type_money) {
		$query = $this->db->query("SELECT id FROM " . DB_PREFIX . "customer_code WHERE money = '" . $type_money . "' and id_customer_buy_code is null and id_customer_input_code is null ");
		$result =  $query->rows;
		return count($result);
	}

	public function getListCode($customer_id) {
		$query = $this->db->query("SELECT co.*,c1.username as customer_export_code,c2.username as customer_input_code FROM " . DB_PREFIX . "customer_code co LEFT JOIN " . DB_PREFIX . "customer c1 ON (co.id_customer_export_code = c1.customer_id) LEFT JOIN " . DB_PREFIX . "customer c2 ON (co.id_customer_input_code = c2.customer_id) WHERE co.id_customer_export_code = '" . (int)$customer_id . "'");

		return $query->rows;
	}
	
	public function getListBuyCode($customer_id) {
		$query = $this->db->query("SELECT co.*,c1.username as customer_export_code,c2.username as customer_input_code FROM " . DB_PREFIX . "customer_code co LEFT JOIN " . DB_PREFIX . "customer c1 ON (co.id_customer_export_code = c1.customer_id) LEFT JOIN " . DB_PREFIX . "customer c2 ON (co.id_customer_input_code = c2.customer_id) WHERE co.id_customer_buy_code = '" . (int)$customer_id . "'");

		return $query->rows;
	}
	
	public function getByCode($code) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_code WHERE code = '" . $code . "'");

		return $query->row;
	}
	
	public function getListInputCode($customer_id) {
		$query = $this->db->query("SELECT co.*,c1.username as customer_export_code,c2.username as customer_input_code FROM " . DB_PREFIX . "customer_code co LEFT JOIN " . DB_PREFIX . "customer c1 ON (co.id_customer_export_code = c1.customer_id) LEFT JOIN " . DB_PREFIX . "customer c2 ON (co.id_customer_input_code = c2.customer_id) WHERE co.id_customer_input_code = '" . (int)$customer_id . "'");
		return $query->rows;
	}
	
	public function addCode($data) {
		$date = date("Y-m-d H:i:s");
		$this->db->query("INSERT INTO " . DB_PREFIX . "customer_code SET money = '" .$data['type_money'] . "', code = '" . $data['code'] . "', id_customer_export_code = '". (int)$data['customer_id']."', date_export_code  = '".strtotime($date)."'");

		return true;
	}
	
	public function UpdateStatusCode($id_code) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer_code SET status = '1' WHERE id = '" . $id_code . "'");
		return true;
	}
	
	public function checkHasCode($code) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_code WHERE code = '" . $code . "'");
		$result = $query->row['total'];
		if($result > 0){
			return true;
		}else {
			return false;
		}
	}
	
	public function makeCode(){
		$num1 = rand(100000,999999);
		$num2 = rand(100000,999999);
		$num3 = rand(100,999);
		$newCode = $num1.$num2.$num3;
		
		$checkcode = $this->checkHasCode($newCode);
		if($checkcode){
			$this->makeCode();
		}else{
			return $newCode;
		}
	}

}
