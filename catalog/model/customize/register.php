<?php
class ModelCustomizeRegister extends Model {

	public function getTableCustomerTmp(){
		$query = $this -> db -> query("
			SELECT * FROM " . DB_PREFIX . "customer_tmp 
			");

		return $query -> rows;
	}
	public function checkExitUserName($username) {
		$query = $this -> db -> query("
			SELECT EXISTS(SELECT 1 FROM " . DB_PREFIX . "customer WHERE username = '" . $username . "')  AS 'exit'
			");

		return $query -> row['exit'];
	}

	public function checkExitUserNameForToken($username, $idUserNameLogin) {
		$query = $this -> db -> query("
			SELECT EXISTS(SELECT 1 FROM " . DB_PREFIX . "customer WHERE customer_id <> '". $idUserNameLogin ."' AND  username = '" . $username . "')  AS 'exit'
			");

		return $query -> row['exit'];
	}

	public function checkExitEmail($email) {
		$query = $this -> db -> query("
			SELECT count(*) AS number FROM " . DB_PREFIX . "customer WHERE email = '" . $email . "'
			");

		return $query -> row['number'];
	}

	public function checkExitPhone($telephone) {
		$query = $this -> db -> query("
			SELECT count(*) AS number FROM " . DB_PREFIX . "customer WHERE telephone = '" . $telephone . "'
			");

		return $query -> row['number'];
	}

	public function checkExitCMND($cmnd) {
		$query = $this -> db -> query("
			SELECT count(*) AS number FROM " . DB_PREFIX . "customer WHERE cmnd = '" . $cmnd . "'
			");

		return $query -> row['number'];
	}

	public function addCustomer($data) {
		
		
		$data['p_node'] = $this -> session -> data['customer_id'];

		$this -> db -> query("
			INSERT INTO " . DB_PREFIX . "customer SET
			p_node = '" . $this -> db -> escape($data['p_node']) . "', 
			email = '" . $this -> db -> escape($data['email']) . "', 
			username = '" . $this -> db -> escape($data['username']) . "', 
			telephone = '" . $this -> db -> escape($data['telephone']) . "', 
			salt = '" . $this -> db -> escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', 
			password = '" . $this -> db -> escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', 
			status = '1', 
			cmnd = '" . $this -> db -> escape($data['cmnd']) . "', 
			country_id = '". $this -> db -> escape($data['country_id']) ."',
			transaction_password = '" . $this -> db -> escape(sha1($salt . sha1($salt . sha1($data['transaction_password'])))) . "',
			date_added = NOW()
		");

		$customer_id = $this -> db -> getLastId();

		$totalChild = $this -> getTotalChild($data['p_node']);
		$this -> db -> query("INSERT INTO " . DB_PREFIX . "customer_ml SET customer_id = '" . (int)$customer_id . "',p_binary = '" . $data['p_node'] . "', level = '1', p_node = '" . $data['p_node'] . "', date_added = NOW()");
		if ($totalChild == 0) {
			$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `left` = '" . (int)$customer_id . "' WHERE customer_id = '" . $data['p_node'] . "'");
		} else {
			$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `right` = '" . (int)$customer_id . "' WHERE customer_id = '" . $data['p_node'] . "'");
		}
	}

	public function addCustomerInventory($data) {
		
			$this -> db -> query("
				INSERT INTO " . DB_PREFIX . "customer SET
				p_node = '" . $this -> db -> escape($data['p_node']) . "', 
				email = '" . $this -> db -> escape($data['email']) . "', 
				username = '" . $this -> db -> escape($data['username']) . "', 
				telephone = '" . $this -> db -> escape($data['telephone']) . "', 
				salt =  '" . $this -> db -> escape($data['salt']) . "', 
				password = '" . $this -> db -> escape($data['password']) . "', 
				status = '9', 
				cmnd = '" . $this -> db -> escape($data['cmnd']) . "', 
				country_id = '". $this -> db -> escape($data['country_id']) ."',
				transaction_password = '" . $this -> db -> escape($data['transaction_password']) . "',
				date_added = NOW()
			");

			$customer_id = $this -> db -> getLastId();

			$totalChild = $this -> getTotalChild($data['p_node']);
			$this -> db -> query("INSERT INTO " . DB_PREFIX . "customer_ml SET customer_id = '" . (int)$customer_id . "',p_binary = '" . $data['p_node'] . "', level = '1', p_node = '" . $data['p_node'] . "', date_added = NOW(), status = 9");
			if ($totalChild == 0) {
				$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `left` = '" . (int)$customer_id . "' WHERE customer_id = '" . $data['p_node'] . "'");
			} else {
				$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `right` = '" . (int)$customer_id . "' WHERE customer_id = '" . $data['p_node'] . "'");
			}
		return $customer_id;
	}

	public function updateWallet($id_customer, $wallet){
		$query = $this -> db ->query("
			UPDATE " . DB_PREFIX . "customer SET wallet = '".$wallet."' WHERE customer_id = '".$id_customer."'");
		return $query;
	}

	public function addCustomer_import($data) {
		
		
		$data['p_node'] = 1;

		$this -> db -> query("
			INSERT INTO " . DB_PREFIX . "customer SET
			p_node = '" . $this -> db -> escape($data['p_node']) . "', 
			email = '" . $this -> db -> escape($data['email']) . "', 
			username = '" . $this -> db -> escape($data['username']) . "', 
			telephone = '" . $this -> db -> escape($data['telephone']) . "', 
			salt = '" . $this -> db -> escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', 
			password = '" . $this -> db -> escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', 
			status = '1', 
			cmnd = '" . $this -> db -> escape($data['cmnd']) . "', 
			country_id = '". $this -> db -> escape($data['country_id']) ."',
			transaction_password = '" . $this -> db -> escape(sha1($salt . sha1($salt . sha1($data['transaction_password'])))) . "',
			date_added = NOW()
		");

		$customer_id = $this -> db -> getLastId();

		$totalChild = $this -> getTotalChild($data['p_node']);
		$this -> db -> query("INSERT INTO " . DB_PREFIX . "customer_ml SET customer_id = '" . (int)$customer_id . "',p_binary = '" . $data['p_node'] . "', level = '1', p_node = '" . $data['p_node'] . "', date_added = NOW()");
		if ($totalChild == 0) {
			$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `left` = '" . (int)$customer_id . "' WHERE customer_id = '" . $data['p_node'] . "'");
		} else {
			$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `right` = '" . (int)$customer_id . "' WHERE customer_id = '" . $data['p_node'] . "'");
		}
	}


	public function getTotalChild($customer_id) {
		$query = $this -> db -> query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_ml WHERE p_binary = " . (int)$customer_id);
		return intval($query -> row['total']);
	}

}
