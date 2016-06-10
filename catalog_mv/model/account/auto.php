<?php
class ModelAccountAuto extends Model {

	public function getGD7Before(){
		$query = $this -> db -> query("
			SELECT id , customer_id, amount , filled
			FROM ". DB_PREFIX . "customer_get_donation 
			WHERE date_added <= DATE_ADD(NOW(), INTERVAL -7 DAY)
				  AND status = 0
			ORDER BY date_added ASC
			LIMIT 1
		");
		return $query -> row;
	}

	public function getPD7Before(){
		$query = $this -> db -> query("
			SELECT id , customer_id , amount  
			FROM ". DB_PREFIX . "customer_provide_donation
			WHERE date_added <= DATE_ADD( NOW( ) , INTERVAL -7
			DAY ) 
			AND STATUS =0
			ORDER BY date_added ASC 
			LIMIT 1
		");
		return $query -> row;
	}

	public function updateStatusPD($pd_id , $status){
		$this -> db -> query("UPDATE " . DB_PREFIX . "customer_provide_donation SET 
			status = '".$status."' 
			WHERE id = '".$pd_id."'
		");
	}

	public function updateAmountPD($pd_id , $amount){
		$this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_provide_donation SET 
			amount = '".$amount."' 
			WHERE id = '".$pd_id."'
		");
	}

	public function updateFilledGD($gd_id , $filled){
		$this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_get_donation SET 
			filled = '".$filled."' 
			WHERE id = '".$gd_id."'
		");
	}

	public function updateStatusGD($gd_id , $status){
		$this -> db -> query("UPDATE " . DB_PREFIX . "customer_get_donation SET 
			status = '".$status."'
			WHERE id = '".$gd_id."'
		");
	}

	public function createTransferList($data){
		$this -> db -> query("
			INSERT INTO ". DB_PREFIX . "customer_transfer_list SET 
			pd_id = '".$data["pd_id"]."',
			gd_id = '".$data["gd_id"]."',
			pd_id_customer = '".$data["pd_id_customer"]."',
			gd_id_customer = '".$data["gd_id_customer"]."',
			transfer_code = '".hexdec( crc32($data["gd_id"]) )."',
			date_added = NOW(),
			amount = '".$data["amount"]."',
			pd_satatus = 0,
			gd_status = 0
		");
	}
}