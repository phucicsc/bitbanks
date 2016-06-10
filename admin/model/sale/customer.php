<?php
class ModelSaleCustomer extends Model {
	public function addCustomer($data) {
		if($data['date_create'] == ''){
			$date_create = date('Y-m-d');
		}else{
			$date_create = date('Y-m-d',strtotime(str_replace("/","-",$data['date_create'])));
			
		}
		
		if($data['date_birth'] == ''){
			$date_birth = '';
		}else{
			$date_birth = date('Y-m-d',strtotime(str_replace("/","-",$data['date_birth'])));
			
		}
		
		if($data['date_cmnd'] == ''){
			$date_cmnd = '';
		}else{
			$date_cmnd = date('Y-m-d',strtotime(str_replace("/","-",$data['date_cmnd'])));
			
		}
		$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET customer_code = '" . $this->db->escape($data['customer_code']) . "', date_birth = '".$date_birth."', date_cmnd = '".$date_cmnd."', address_cmnd = '" . $this->db->escape($data['address_cmnd']) . "', p_node = '" . $this->db->escape($data['p_node']) . "', ma_thue = '" . $this->db->escape($data['ma_thue']) . "', note = '" . $this->db->escape($data['note']) . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', username = '" . $this->db->escape($data['username']) . "', country_id = '" . $this->db->escape($data['country_id']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']) ? serialize($data['custom_field']) : '') . "', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', status = '1', cmnd = '" .  $this->db->escape($data['cmnd']) . "', account_bank = '" . $this->db->escape($data['account_bank']) . "', address_bank = '" . $this->db->escape($data['address_bank']) . "', wallet = '" . $this->db->escape($data['wallet']) . "', address_cus = '" . $this->db->escape($data['address_cus']) . "', img_profile = '" . $this->db->escape($data['img_profile']) . "', approved = '1', date_added = '".$date_create."'");

		$customer_id = $this->db->getLastId();
		
		$totalChild = $this->getTotalChild($data['p_node']);
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_ml SET customer_id = '" . (int)$customer_id . "',p_binary = '" . $data['p_node'] . "', level = '1', p_node = '".$data['p_node']."', date_added = '".$date_create."'");
		if($totalChild == 0){
			$this->db->query("UPDATE " . DB_PREFIX . "customer_ml SET `left` = '" . (int)$customer_id . "' WHERE customer_id = '".$data['p_node']."'" );
		}else{
			$this->db->query("UPDATE " . DB_PREFIX . "customer_ml SET `right` = '" . (int)$customer_id . "' WHERE customer_id = '".$data['p_node']."'" );
		}
		$hoiPhi = $this->config->get('config_hoiphi');
		$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET user_id = '" .(int)$customer_id . "', receive = '".$hoiPhi."', type_profit = '1', description = 'Đóng hội phí lần 1', from_userid = '" . (int)$customer_id . "',month = '".(int)date('m',strtotime($date_create))."',year = '".date('Y',strtotime($date_create))."',date = '".strtotime($date_create)."'");

		$this->createCTP($customer_id,$customer_id, 1);
		
		if (isset($data['address'])) {
			foreach ($data['address'] as $address) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "address SET customer_id = '" . (int)$customer_id . "', firstname = '" . $this->db->escape($address['firstname']) . "', lastname = '" . $this->db->escape($address['lastname']) . "', company = '" . $this->db->escape($address['company']) . "', address_1 = '" . $this->db->escape($address['address_1']) . "', address_2 = '" . $this->db->escape($address['address_2']) . "', city = '" . $this->db->escape($address['city']) . "', postcode = '" . $this->db->escape($address['postcode']) . "', country_id = '" . (int)$address['country_id'] . "', zone_id = '" . (int)$address['zone_id'] . "', custom_field = '" . $this->db->escape(isset($address['custom_field']) ? serialize($address['custom_field']) : '') . "'");

				if (isset($address['default'])) {
					$address_id = $this->db->getLastId();

					$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$customer_id . "'");
				}
			}
		}
	}
	
	public function addHoiPhi($customer_id,$thangHp) {
		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "profit WHERE user_id = '" .(int)$customer_id . "' AND type_profit = 1 ORDER BY id DESC LIMIT 1");
		$monthLast =  (int)$query->row['month'];
		$yearLast =  (int)$query->row['year'];
		if($monthLast == 12){
			$month = 1;
			$year = $yearLast + 1;
		}else{
			$month = $monthLast + 1; 
			$year = $yearLast;
		}
		$date_create = date('Y-m-d');
		$hoiPhi = $this->config->get('config_hoiphi');
		$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET user_id = '" .(int)$customer_id . "', receive = '".$hoiPhi."', type_profit = '1', description = 'Đóng hội phí lần ".$thangHp."', from_userid = '" . (int)$customer_id . "',month = '".$month."',year = '".$year."',date = '".strtotime($date_create)."'");
	}

	public function editCustomer($customer_id, $data) {
		if (!isset($data['custom_field'])) {
			$data['custom_field'] = array();
		}
		
		if($data['date_create'] == ''){
			$date_create = date('Y-m-d');
		}else{
			$date_create = date('Y-m-d',strtotime(str_replace("/","-",$data['date_create'])));
			
		}
		
		if($data['date_birth'] == ''){
			$date_birth = '';
		}else{
			$date_birth = date('Y-m-d',strtotime(str_replace("/","-",$data['date_birth'])));
			
		}
		
		if($data['date_cmnd'] == ''){
			$date_cmnd = '';
		}else{
			$date_cmnd = date('Y-m-d',strtotime(str_replace("/","-",$data['date_cmnd'])));
			
		}
		
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET customer_code = '" . $this->db->escape($data['customer_code']) . "', date_birth = '".$date_birth."', date_cmnd = '".$date_cmnd."', address_cmnd = '" . $this->db->escape($data['address_cmnd']) . "', ma_thue = '" . $this->db->escape($data['ma_thue']) . "', note = '" . $this->db->escape($data['note']) . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', username = '" . $this->db->escape($data['username']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']) ? serialize($data['custom_field']) : '') . "', cmnd = '" . $this->db->escape($data['cmnd']) . "', account_bank = '" . $this->db->escape($data['account_bank']) . "', address_bank = '" . $this->db->escape($data['address_bank']) . "', wallet = '" . $this->db->escape($data['wallet']) . "', country_id = '" . $this->db->escape($data['country_id']) . "', address_cus = '" . $this->db->escape($data['address_cus']) . "',img_profile = '" . $this->db->escape($data['img_profile']) . "',date_added = '".$date_create."' WHERE customer_id = '" . (int)$customer_id . "'");

		if ($data['password']) {
			$this->db->query("UPDATE " . DB_PREFIX . "customer SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "' WHERE customer_id = '" . (int)$customer_id . "'");
		}
		if ($data['transaction_password']) {
			$this->db->query("UPDATE " . DB_PREFIX . "customer SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', transaction_password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['transaction_password'])))) . "' WHERE customer_id = '" . (int)$customer_id . "'");
		}
		if ($data['status']) {
			$this->db->query("UPDATE " . DB_PREFIX . "customer SET status = '" . $data['status'] . "',date_off = '' WHERE customer_id = '" . (int)$customer_id . "'");
		}
		$this->db->query("DELETE FROM " . DB_PREFIX . "address WHERE customer_id = '" . (int)$customer_id . "'");

		if (isset($data['address'])) {
			foreach ($data['address'] as $address) {
				if (!isset($address['custom_field'])) {
					$address['custom_field'] = array();
				}

				$this->db->query("INSERT INTO " . DB_PREFIX . "address SET address_id = '" . (int)$address['address_id'] . "', customer_id = '" . (int)$customer_id . "', firstname = '" . $this->db->escape($address['firstname']) . "', lastname = '" . $this->db->escape($address['lastname']) . "', company = '" . $this->db->escape($address['company']) . "', address_1 = '" . $this->db->escape($address['address_1']) . "', address_2 = '" . $this->db->escape($address['address_2']) . "', city = '" . $this->db->escape($address['city']) . "', postcode = '" . $this->db->escape($address['postcode']) . "', country_id = '" . (int)$address['country_id'] . "', zone_id = '" . (int)$address['zone_id'] . "', custom_field = '" . $this->db->escape(isset($address['custom_field']) ? serialize($address['custom_field']) : '') . "'");

				if (isset($address['default'])) {
					$address_id = $this->db->getLastId();

					$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$customer_id . "'");
				}
			}
		}
	}
	public function update_status($status,$customer_id){		
		$query = $this -> db -> query("
		UPDATE " . DB_PREFIX . "customer SET 
			status =".$status."
			WHERE customer_id = '".$customer_id."'
		");
		
		return $query === true ? true : false;
	}
	public function getCountry() {
		$query = $this->db->query("
			SELECT country_id AS id, name 
			FROM " . DB_PREFIX . "country 
			WHERE status = 1
			");
		return $query->rows;
	}
	public function getLevel($id_customer){
		$query = $this -> db -> query("
			SELECT level 
			FROM ".DB_PREFIX."customer c LEFT JOIN ".DB_PREFIX."customer_ml ml
			ON (c.customer_id=ml.customer_id) WHERE c.customer_id = '".$this -> db -> escape($id_customer)."'
		");
		return $query -> row['level'];
	}

	public function editToken($customer_id, $token) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET token = '" . $this->db->escape($token) . "' WHERE customer_id = '" . (int)$customer_id . "'");
	}

	public function deleteCustomer($customer_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$customer_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_transaction WHERE customer_id = '" . (int)$customer_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_ip WHERE customer_id = '" . (int)$customer_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_ml WHERE customer_id = '" . (int)$customer_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "address WHERE customer_id = '" . (int)$customer_id . "'");
	}

	public function getCustomer($customer_id) {
		$query = $this->db->query("SELECT DISTINCT c.*, ct.name, cml.level FROM " . DB_PREFIX . "customer c LEFT JOIN " . DB_PREFIX . "country ct on(c.country_id=ct.country_id) LEFT JOIN " . DB_PREFIX . "customer_ml cml on(c.customer_id=cml.customer_id)  WHERE c.customer_id = '" . (int)$customer_id . "'");

		return $query->row;
	}

	public function getCustomerByEmail($email) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer WHERE LCASE(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row;
	}
	
	public function getCustomerByUsername($username) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer WHERE username = '" . $this->db->escape(utf8_strtolower($username)) . "'");

		return $query->row;
	}
	
	public function getCustomerByCustomerCode($customer_code) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer WHERE customer_code = '" . $this->db->escape(utf8_strtolower($customer_code)) . "'");

		return $query->row;
	}
	
	public function getCustomerByCmnd($cmnd) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer WHERE cmnd = '" . $this->db->escape(utf8_strtolower($cmnd)) . "'");

		return $query->row;
	}
	
	public function getCustomerByFirstname($firstname) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer WHERE firstname = '" . $this->db->escape(utf8_strtolower($firstname)) . "'");

		return $query->row;
	}
	
	public function getCustomerByTelephone($telephone) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer WHERE telephone = '" . $this->db->escape(utf8_strtolower($telephone)) . "'");

		return $query->row;
	}
	
	public function getCustomerByAccountBank($account_bank) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer WHERE account_bank = '" . $this->db->escape(utf8_strtolower($account_bank)) . "'");

		return $query->row;
	}

	public function getCustomers($data = array()) {
		//" . DB_PREFIX . "customer_ml cm LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = cm.customer_id) 
		 $sql = "SELECT c.*, CONCAT(c.lastname, ' ', c.firstname) AS name FROM " . DB_PREFIX . "customer c";

		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(c.lastname, ' ', c.firstname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}
		
		if (!empty($data['filter_username'])) {
			$implode[] = " c.username LIKE '%" . $this->db->escape($data['filter_username']) . "%'";
		}
		
		if (!empty($data['filter_customer_code'])) {
			$implode[] = " c.customer_code LIKE '%" . $this->db->escape($data['filter_customer_code']) . "%'";
		}
		

		if (!empty($data['filter_phone'])) {
			$implode[] = "c.telephone LIKE '" . $this->db->escape($data['filter_phone']) . "%'";
		}

		if (isset($data['filter_newsletter']) && !is_null($data['filter_newsletter'])) {
			$implode[] = "c.newsletter = '" . (int)$data['filter_newsletter'] . "'";
		}



		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(c.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'name',
			'c.customer_id',
			'c.email',
			'c.status',
			'c.approved',
			'c.ip',
			'c.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			//$sql .= " ORDER BY name";
			$sql .= " ORDER BY c.customer_id ";
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

	public function approve($customer_id) {
		$customer_info = $this->getCustomer($customer_id);

		if ($customer_info) {
			$this->db->query("UPDATE " . DB_PREFIX . "customer SET approved = '1' WHERE customer_id = '" . (int)$customer_id . "'");

			$this->load->language('mail/customer');

			$this->load->model('setting/store');

			$store_info = $this->model_setting_store->getStore($customer_info['store_id']);

			if ($store_info) {
				$store_name = $store_info['name'];
				$store_url = $store_info['url'] . 'index.php?route=account/login';
			} else {
				$store_name = $this->config->get('config_name');
				$store_url = HTTP_CATALOG . 'index.php?route=account/login';
			}

			$message  = sprintf($this->language->get('text_approve_welcome'), html_entity_decode($store_name, ENT_QUOTES, 'UTF-8')) . "\n\n";
			$message .= $this->language->get('text_approve_login') . "\n";
			$message .= $store_url . "\n\n";
			$message .= $this->language->get('text_approve_services') . "\n\n";
			$message .= $this->language->get('text_approve_thanks') . "\n";
			$message .= html_entity_decode($store_name, ENT_QUOTES, 'UTF-8');

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($customer_info['email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($store_name, ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(sprintf($this->language->get('text_approve_subject'), html_entity_decode($store_name, ENT_QUOTES, 'UTF-8')));
			$mail->setText($message);
			$mail->send();
		}
	}

	public function getAddress($address_id) {
		$address_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "address WHERE address_id = '" . (int)$address_id . "'");

		if ($address_query->num_rows) {
			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$address_query->row['country_id'] . "'");

			if ($country_query->num_rows) {
				$country = $country_query->row['name'];
				$iso_code_2 = $country_query->row['iso_code_2'];
				$iso_code_3 = $country_query->row['iso_code_3'];
				$address_format = $country_query->row['address_format'];
			} else {
				$country = '';
				$iso_code_2 = '';
				$iso_code_3 = '';
				$address_format = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$address_query->row['zone_id'] . "'");

			if ($zone_query->num_rows) {
				$zone = $zone_query->row['name'];
				$zone_code = $zone_query->row['code'];
			} else {
				$zone = '';
				$zone_code = '';
			}

			return array(
				'address_id'     => $address_query->row['address_id'],
				'customer_id'    => $address_query->row['customer_id'],
				'firstname'      => $address_query->row['firstname'],
				'lastname'       => $address_query->row['lastname'],
				'company'        => $address_query->row['company'],
				'address_1'      => $address_query->row['address_1'],
				'address_2'      => $address_query->row['address_2'],
				'postcode'       => $address_query->row['postcode'],
				'city'           => $address_query->row['city'],
				'zone_id'        => $address_query->row['zone_id'],
				'zone'           => $zone,
				'zone_code'      => $zone_code,
				'country_id'     => $address_query->row['country_id'],
				'country'        => $country,
				'iso_code_2'     => $iso_code_2,
				'iso_code_3'     => $iso_code_3,
				'address_format' => $address_format,
				'custom_field'   => unserialize($address_query->row['custom_field'])
			);
		}
	}

	public function getAddresses($customer_id) {
		$address_data = array();

		$query = $this->db->query("SELECT address_id FROM " . DB_PREFIX . "address WHERE customer_id = '" . (int)$customer_id . "'");

		foreach ($query->rows as $result) {
			$address_info = $this->getAddress($result['address_id']);

			if ($address_info) {
				$address_data[$result['address_id']] = $address_info;
			}
		}

		return $address_data;
	}

	public function getTotalCustomers($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer";

		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = " CONCAT(lastname, ' ',firstname ) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}
		
		if (!empty($data['filter_username'])) {
			$implode[] = " username LIKE '%" . $this->db->escape($data['filter_username']) . "%'";
		}
		
		if (!empty($data['filter_customer_code'])) {
			$implode[] = "customer_code LIKE '%" . $this->db->escape($data['filter_customer_code']) . "%'";
		}

		if (!empty($data['filter_phone'])) {
			$implode[] = "telephone LIKE '" . $this->db->escape($data['filter_phone']) . "%'";
		}

		if (isset($data['filter_newsletter']) && !is_null($data['filter_newsletter'])) {
			$implode[] = "newsletter = '" . (int)$data['filter_newsletter'] . "'";
		}

		if (!empty($data['filter_customer_group_id'])) {
			$implode[] = "customer_group_id = '" . (int)$data['filter_customer_group_id'] . "'";
		}

		if (!empty($data['filter_ip'])) {
			$implode[] = "customer_id IN (SELECT customer_id FROM " . DB_PREFIX . "customer_ip WHERE ip = '" . $this->db->escape($data['filter_ip']) . "')";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$implode[] = "status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
			$implode[] = "approved = '" . (int)$data['filter_approved'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
	
	public function getCustomersNew($data = array()) {
		$date = strtotime(date('Y-m-d'));
		$year = date('Y',$date);
		if (!empty($data['year_filter'])) {
			$year = $data['year_filter'];
		}
		
		$sql = "SELECT c.*, CONCAT(c.lastname, ' ', c.firstname) AS name FROM " . DB_PREFIX . "customer c";

		$implode = array();

		if (!empty($data['month_filter'])) {
			$implode[] = " YEAR(c.`date_added`) = '".$year."' AND MONTH(c.`date_added`) = '".$data['month_filter']."'";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'name',
			'c.customer_id',
			'c.email',
			'c.status',
			'c.approved',
			'c.ip',
			'c.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			//$sql .= " ORDER BY name";
			$sql .= " ORDER BY c.customer_id ";
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
	
	public function getTotalCustomersNew($data = array()) {
		$date = strtotime(date('Y-m-d'));
		$year = date('Y',$date);
		if (!empty($data['year_filter'])) {
			$year = $data['year_filter'];
		}
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer";
		$implode = array();

		if (!empty($data['month_filter'])) {
			$implode[] = " YEAR(`date_added`)= '".$year."' AND MONTH(`date_added`) = '".$data['month_filter']."'";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
	public function getCustomersCTP($data = array()) {
		$date = strtotime(date('Y-m-d'));
		$year = date('Y',$date);
		$sql = "SELECT c.*, CONCAT(c.lastname, ' ', c.firstname) AS name FROM " . DB_PREFIX . "customer c";

		$implode = array();

		if (!empty($data['month_filter'])) {
			$implode[] = " YEAR(c.`date_added`) <= '".$year."' AND MONTH(c.`date_added`) <= '".$data['month_filter']."' AND c.`status` = 1";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'name',
			'c.customer_id',
			'c.email',
			'c.status',
			'c.approved',
			'c.ip',
			'c.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			//$sql .= " ORDER BY name";
			$sql .= " ORDER BY c.customer_id ";
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
	
	public function getTotalCustomersCTP($data = array()) {
		$date = strtotime(date('Y-m-d'));
		$year = date('Y',$date);
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer";
		$implode = array();

		if (!empty($data['month_filter'])) {
			$implode[] = " YEAR(`date_added`) <= '".$year."' AND MONTH(`date_added`) <= '".$data['month_filter']."' AND `status` = 1";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
	
	public function getCustomersOff($data = array()) {
		$date = strtotime(date('Y-m-d'));
		$year = date('Y',$date);
		if (!empty($data['year_filter'])) {
			$year = $data['year_filter'];
		}
		$sql = "SELECT c.*, CONCAT(c.lastname, ' ', c.firstname) AS name FROM " . DB_PREFIX . "customer c";

		$implode = array();

		if (!empty($data['month_filter'])) {
			$implode[] = " YEAR(c.`date_off`) = '".$year."' AND MONTH(c.`date_off`) = '".$data['month_filter']."'  AND c.`status` = 0";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'name',
			'c.customer_id',
			'c.email',
			'c.status',
			'c.approved',
			'c.ip',
			'c.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			//$sql .= " ORDER BY name";
			$sql .= " ORDER BY c.customer_id ";
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
	
	public function getTotalCustomersOff($data = array()) {
		$date = strtotime(date('Y-m-d'));
		$year = date('Y',$date);
		if (!empty($data['year_filter'])) {
			$year = $data['year_filter'];
		}
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer";
		$implode = array();

		if (!empty($data['month_filter'])) {
			$implode[] = " YEAR(`date_off`)= '".$year."' AND MONTH(`date_off`) = '".$data['month_filter']."' AND `status` = 0";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
	
	public function getCustomersNotHP($data = array()) {
		$date = strtotime(date('Y-m-d'));
		$year = date('Y',$date);
		if (!empty($data['year_filter'])) {
			$year = $data['year_filter'];
		}
		$sql = "SELECT c.*, CONCAT(c.lastname, ' ', c.firstname) AS name FROM " . DB_PREFIX . "customer c WHERE YEAR(c.`date_added`) <= '".$year."' AND MONTH(c.`date_added`) <= '".$data['month_filter']."' AND c.`status` = 1";

		$sort_data = array(
			'name',
			'c.customer_id',
			'c.email',
			'c.status',
			'c.approved',
			'c.ip',
			'c.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			//$sql .= " ORDER BY name";
			$sql .= " ORDER BY c.customer_id ";
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
		$arrNotHP = array();
		$arrUser = $query->rows;
		foreach ($arrUser as $user) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "profit WHERE  user_id = ".$user['customer_id']." and type_profit = 1 and year = '".$year."' AND month = '".$data['month_filter']."'");
			if(!$query->row){
				array_push($arrNotHP,$user);
			}
		}
		return $arrNotHP;
	}
//INSERT INTO " . DB_PREFIX . "ping_history SET
	public function getPin($customer_id){
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id =".$customer_id."");
		return $query->row['ping'];
	}
	public function update_amount($pinadd, $customer_id){	
		$query = $this -> db -> query("INSERT INTO " . DB_PREFIX . "ping_history SET
			id_customer = '" .$customer_id. "',
			amount ='".$pinadd."',
			date_added = NOW(),
			user_description = '" .'Bitbanks'. "',
			type = '" .'Transfer'. "',
			system_description = '" .'Bitbanks'. "'
			
		");
		return $query;
	}

	public function insertR_Wallet($id_customer){
		$query = $this -> db -> query("
			INSERT INTO " . DB_PREFIX . "customer_r_wallet SET 
			customer_id = '".$id_customer."',
			amount = '0.0'
		");
		return $query ? true : false;
	}

	public function checkR_Wallet($id_customer){
		$query = $this -> db -> query("
			SELECT COUNT(*) AS number
			FROM  ".DB_PREFIX."customer_r_wallet
			WHERE customer_id = '".$this -> db -> escape($id_customer)."'
		");
		return $query -> row;
	}

	public function insertC_Wallet($id_customer){
		$query = $this -> db -> query("
			INSERT INTO " . DB_PREFIX . "customer_c_wallet SET 
			customer_id = '".$id_customer."',
			amount = '0.0'
		");
		return $query ? true : false;
	}

	public function checkC_Wallet($id_customer){
		$query = $this -> db -> query("
			SELECT COUNT(*) AS number
			FROM  ".DB_PREFIX."customer_c_wallet
			WHERE customer_id = '".$this -> db -> escape($id_customer)."'
		");
		return $query -> row;
	}

	public function getC_Wallet($id_customer){
		$query = $this -> db -> query("
			SELECT amount
			FROM  ".DB_PREFIX."customer_c_wallet
			WHERE customer_id = '".$this -> db -> escape($id_customer)."'
		");

		return $query -> row['amount'];
	}
	public function getR_Wallet($id_customer){
		$query = $this -> db -> query("
			SELECT amount
			FROM  ".DB_PREFIX."customer_r_wallet
			WHERE customer_id = '".$this -> db -> escape($id_customer)."'
		");
		return $query -> row['amount'];
	}
	public function update_R_Wallet($amount , $customer_id, $add = false){
		if(!$add){
			$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_r_wallet SET 
				amount = amount + ".floatval($amount)."
				WHERE customer_id = '".$customer_id."'
			");
		}
		return $query === true ? true : false;
	}
	public function update_C_Wallet($amount , $customer_id, $add = false){
		if(!$add){
			$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_c_wallet SET 
				amount = amount + ".floatval($amount)."
				WHERE customer_id = '".$customer_id."'
			");
		}
		return $query === true ? true : false;
	}
	public function getTotalPD($id_customer){
		$query = $this -> db -> query("
			SELECT COUNT( * ) AS number
			FROM  ".DB_PREFIX."customer_provide_donation
			WHERE customer_id = '".$this -> db -> escape($id_customer)."'
		");
		
		return $query -> row['number'];
	}
	public function getPDById($id_customer, $limit, $offset){
		$query = $this -> db -> query("
			SELECT pd.*, c.username
			FROM  ".DB_PREFIX."customer_provide_donation AS pd
			JOIN ". DB_PREFIX ."customer AS c
			ON pd.customer_id = c.customer_id
			WHERE pd.customer_id = '".$this -> db -> escape($id_customer)."' 
			ORDER BY pd.date_added DESC
			LIMIT ".$limit."
			OFFSET ".$offset."
		");
		
		return $query -> rows;
	}
	public function getTotalGD($id_customer){
		$query = $this -> db -> query("
			SELECT COUNT( * ) AS number
			FROM  ".DB_PREFIX."customer_get_donation
			WHERE customer_id = '".$this -> db -> escape($id_customer)."'
		");
		
		return $query -> row['number'];
	}
	public function getGDById($id_customer, $limit, $offset){
		$query = $this -> db -> query("
			SELECT *
			FROM  ".DB_PREFIX."customer_get_donation
			WHERE customer_id = '".$this -> db -> escape($id_customer)."'
			ORDER BY date_added DESC
			LIMIT ".$limit."
			OFFSET ".$offset."
		");

		return $query -> rows;
	}

	
	public function update_pin($amount , $customer_id){		
		$query = $this -> db -> query("
		UPDATE " . DB_PREFIX . "customer SET 
			ping = ping +".intval($amount)."
			WHERE customer_id = '".$customer_id."'
		");
		
		return $query === true ? true : false;
	}
	

	public function getTotalCustomersNotHP($data = array()) {
		$date = strtotime(date('Y-m-d'));
		$year = date('Y',$date);
		if (!empty($data['year_filter'])) {
			$year = $data['year_filter'];
		}
		$sql = "SELECT * FROM " . DB_PREFIX . "customer  c WHERE YEAR(c.`date_added`) <= '".$year."' AND MONTH(c.`date_added`) <= '".$data['month_filter']."' AND c.`status` = 1";

		$query = $this->db->query($sql);
		$arrNotHP = array();
		$arrUser = $query->rows;
		foreach ($arrUser as $user) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "profit WHERE  user_id = ".$user['customer_id']." and type_profit = 1 and YEAR(  FROM_UNIXTIME(`date`)  ) = '".$year."' AND MONTH(   FROM_UNIXTIME(`date`)  ) = '".$data['month_filter']."'");
			if(!$query->row){
				array_push($arrNotHP,$user);
			}
		}
		return count($arrNotHP);
	}

	public function getTotalCustomersAwaitingApproval() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE status = '0' OR approved = '0'");

		return $query->row['total'];
	}

	public function getTotalAddressesByCustomerId($customer_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "address WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row['total'];
	}

	public function getTotalAddressesByCountryId($country_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "address WHERE country_id = '" . (int)$country_id . "'");

		return $query->row['total'];
	}

	public function getTotalAddressesByZoneId($zone_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "address WHERE zone_id = '" . (int)$zone_id . "'");

		return $query->row['total'];
	}

	public function getTotalCustomersByCustomerGroupId($customer_group_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE customer_group_id = '" . (int)$customer_group_id . "'");

		return $query->row['total'];
	}

	public function addHistory($customer_id, $comment) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "customer_history SET customer_id = '" . (int)$customer_id . "', comment = '" . $this->db->escape(strip_tags($comment)) . "', date_added = NOW()");
	}

	public function getHistories($customer_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT comment, date_added FROM " . DB_PREFIX . "customer_history WHERE customer_id = '" . (int)$customer_id . "' ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function getTotalHistories($customer_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_history WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row['total'];
	}
	

	public function addTransaction($customer_id, $description = '', $amount = '', $order_id = 0) {
		$customer_info = $this->getCustomer($customer_id);

		if ($customer_info) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_transaction SET customer_id = '" . (int)$customer_id . "', order_id = '" . (int)$order_id . "', description = '" . $this->db->escape($description) . "', amount = '" . (float)$amount . "', date_added = NOW()");

			$this->load->language('mail/customer');

			$this->load->model('setting/store');

			$store_info = $this->model_setting_store->getStore($customer_info['store_id']);

			if ($store_info) {
				$store_name = $store_info['name'];
			} else {
				$store_name = $this->config->get('config_name');
			}

			$message  = sprintf($this->language->get('text_transaction_received'), $this->currency->format($amount, $this->config->get('config_currency'))) . "\n\n";
			$message .= sprintf($this->language->get('text_transaction_total'), $this->currency->format($this->getTransactionTotal($customer_id)));

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($customer_info['email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($store_name, ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(sprintf($this->language->get('text_transaction_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')));
			$mail->setText($message);
			$mail->send();
		}
	}

	public function deleteTransaction($order_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_transaction WHERE order_id = '" . (int)$order_id . "'");
	}

	public function getTransactions($customer_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_transaction WHERE customer_id = '" . (int)$customer_id . "' ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function getTotalTransactions($customer_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total  FROM " . DB_PREFIX . "customer_transaction WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row['total'];
	}

	public function getTransactionTotal($customer_id) {
		$query = $this->db->query("SELECT SUM(amount) AS total FROM " . DB_PREFIX . "customer_transaction WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row['total'];
	}

	public function getTotalTransactionsByOrderId($order_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_transaction WHERE order_id = '" . (int)$order_id . "'");

		return $query->row['total'];
	}
	
	public function getTransactionsPackage($customer_id) {

		$query = $this->db->query("SELECT cml.*,ml.name_vn FROM " . DB_PREFIX . "customer_ml cml LEFT JOIN " . DB_PREFIX . "member_level ml ON (cml.level = ml.id)  WHERE cml.customer_id = '" . (int)$customer_id . "' ORDER BY cml.date_added DESC");

		return $query->rows;
	}
	
	public function getTransactionsProfitByMonth($customer_id,$month_filter,$typeProfit,$hp_from_ctp) {
		if($month_filter != 0){
			$date = strtotime(date('Y-m-d'));
			$year = date('Y',$date);
			$query = $this->db->query("SELECT pf.*,CONCAT(c.lastname, ' ', c.firstname) AS name_from FROM " . DB_PREFIX . "profit pf LEFT JOIN " . DB_PREFIX . "customer c ON (pf.from_userid = c.customer_id)  WHERE pf.user_id = '" . (int)$customer_id . "' and pf.receive > 0 and pf.type_profit IN ( ".$typeProfit." ) and pf.hp_from_ctp = '".$hp_from_ctp."' and YEAR(  FROM_UNIXTIME(`date`)  ) = '".$year."' AND MONTH(   FROM_UNIXTIME(`date`)  ) = '".$month_filter."' ORDER BY date ASC");
		}else{
			$query = $this->db->query("SELECT pf.*,CONCAT(c.lastname, ' ', c.firstname) AS name_from FROM " . DB_PREFIX . "profit pf LEFT JOIN " . DB_PREFIX . "customer c ON (pf.from_userid = c.customer_id)  WHERE pf.user_id = '" . (int)$customer_id . "' and pf.receive > 0 and pf.type_profit IN ( ".$typeProfit." ) and pf.hp_from_ctp = '".$hp_from_ctp."' ORDER BY date ASC");
		}
		return $query->rows;
	}
	
	public function getTransactionsProfit($customer_id,$typeProfit,$hp_from_ctp) {

		$query = $this->db->query("SELECT pf.*,CONCAT(c.lastname, ' ', c.firstname) AS name_from FROM " . DB_PREFIX . "profit pf LEFT JOIN " . DB_PREFIX . "customer c ON (pf.from_userid = c.customer_id)  WHERE pf.user_id = '" . (int)$customer_id . "' and pf.receive > 0 and pf.type_profit IN ( ".$typeProfit." ) and pf.hp_from_ctp = '".$hp_from_ctp."' ORDER BY date ASC");

		return $query->rows;
	}
	
	public function getAllTransactionsProfit($customer_id,$typeProfit) {

		$query = $this->db->query("SELECT pf.*,CONCAT(c.lastname, ' ', c.firstname) AS name_from FROM " . DB_PREFIX . "profit pf LEFT JOIN " . DB_PREFIX . "customer c ON (pf.from_userid = c.customer_id)  WHERE pf.user_id = '" . (int)$customer_id . "' and pf.receive > 0 and pf.type_profit IN ( ".$typeProfit." ) ORDER BY date ASC");

		return $query->rows;
	}
	
	
	public function getTransactionProfitTotal($package_id) {
		
		$moneyInvert = $this->getMoneyInvest($package_id);
		$query = $this->db->query("SELECT SUM(receive) AS total FROM " . DB_PREFIX . "profit WHERE ml_package_id = '" . (int)$package_id . "' and type_profit in (1,2,3)");
		$has  = $query->row['total'];
		
		$query2 = $this->db->query("SELECT SUM(receive) AS total FROM " . DB_PREFIX . "profit WHERE ml_package_id = '" . (int)$package_id . "' and type_profit in (4)");
		$payout  = $query2->row['total'];
		
		return ($moneyInvert+$has) - $payout;
	}
	
	public function getTransactionCustomerProfitTotal($user_id) {
		
		$moneyInvert = $this->getAllMoneyInvest($user_id);
		$query = $this->db->query("SELECT SUM(receive) AS total FROM " . DB_PREFIX . "profit WHERE user_id = '" . (int)$user_id . "' and type_profit in (1,2,3)");
		$has  = $query->row['total'];
		
		$query2 = $this->db->query("SELECT SUM(receive) AS total FROM " . DB_PREFIX . "profit WHERE user_id = '" . (int)$user_id . "' and type_profit in (4)");
		$payout  = $query2->row['total'];
		
		return ($moneyInvert+$has) - $payout;
	}
	
	
	public function getAllProfitByType($user_id,$type) {
		$query = $this->db->query("SELECT SUM(receive) AS total FROM " . DB_PREFIX . "profit WHERE user_id = '" . (int)$user_id . "' and type_profit in (".$type.")");
		return $query->row['total'];
	}
	
	public function getAllHPFromCTP($user_id) {
		$query = $this->db->query("SELECT SUM(receive) AS total FROM " . DB_PREFIX . "profit WHERE user_id = '" . (int)$user_id . "' and type_profit in (1) and hp_from_ctp = 1");
		return $query->row['total'];
	}
	
	public function getAllProfitByTypeMonth($user_id,$type,$month,$year) {
		if($month != 0){
			$query = $this->db->query("SELECT SUM(receive) AS total FROM " . DB_PREFIX . "profit WHERE user_id = '" . (int)$user_id . "' and type_profit in (".$type.") and YEAR(  FROM_UNIXTIME(`date`)  ) = '".$year."' AND MONTH(   FROM_UNIXTIME(`date`)  ) = '".$month."'");
		}else{
			$query = $this->db->query("SELECT SUM(receive) AS total FROM " . DB_PREFIX . "profit WHERE user_id = '" . (int)$user_id . "' and type_profit in (".$type.")");
		}
		return $query->row['total'];
	}
	
	public function getAllHPFromCTPMonth($user_id,$month,$year) {
		if($month != 0){
			$query = $this->db->query("SELECT SUM(receive) AS total FROM " . DB_PREFIX . "profit WHERE user_id = '" . (int)$user_id . "' and type_profit in (1) and hp_from_ctp = 1 and YEAR(  FROM_UNIXTIME(`date`)  ) = '".$year."' AND MONTH(   FROM_UNIXTIME(`date`)  ) = '".$month."'");
		}else{
			$query = $this->db->query("SELECT SUM(receive) AS total FROM " . DB_PREFIX . "profit WHERE user_id = '" . (int)$user_id . "' and type_profit in (1) and hp_from_ctp = 1");
		}
			return $query->row['total'];
	}
	
	public function countProfitByType($user_id,$type) {
		$query = $this->db->query("SELECT count(*) AS total FROM " . DB_PREFIX . "profit WHERE user_id = '" . (int)$user_id . "' and type_profit in (".$type.")");
		return $query->row['total'];
	}
	
	public function payout($user_id,$description,$receive,$date) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET user_id = '" .(int)$user_id . "', receive = '" . $receive . "', type_profit = '3', description = '" . $description . "', from_userid = '" . (int)$user_id . "',date = '".$date."'");

		return true;
	}
	
	public function getTotalTransactionsProfit($customer_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total  FROM " . DB_PREFIX . "profit WHERE user_id = '" . (int)$customer_id . "'");

		return $query->row['total'];
	}
	

	public function addReward($customer_id, $description = '', $points = '', $order_id = 0) {
		$customer_info = $this->getCustomer($customer_id);

		if ($customer_info) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_reward SET customer_id = '" . (int)$customer_id . "', order_id = '" . (int)$order_id . "', points = '" . (int)$points . "', description = '" . $this->db->escape($description) . "', date_added = NOW()");

			$this->load->language('mail/customer');

			$this->load->model('setting/store');

			$store_info = $this->model_setting_store->getStore($customer_info['store_id']);

			if ($store_info) {
				$store_name = $store_info['name'];
			} else {
				$store_name = $this->config->get('config_name');
			}

			$message  = sprintf($this->language->get('text_reward_received'), $points) . "\n\n";
			$message .= sprintf($this->language->get('text_reward_total'), $this->getRewardTotal($customer_id));

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($customer_info['email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($store_name, ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(sprintf($this->language->get('text_reward_subject'), html_entity_decode($store_name, ENT_QUOTES, 'UTF-8')));
			$mail->setText($message);
			$mail->send();
		}
	}

	public function deleteReward($order_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_reward WHERE order_id = '" . (int)$order_id . "' AND points > 0");
	}

	public function getRewards($customer_id, $start = 0, $limit = 10) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$customer_id . "' ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function getTotalRewards($customer_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row['total'];
	}

	public function getRewardTotal($customer_id) {
		$query = $this->db->query("SELECT SUM(points) AS total FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row['total'];
	}

	public function getTotalCustomerRewardsByOrderId($order_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_reward WHERE order_id = '" . (int)$order_id . "'");

		return $query->row['total'];
	}

	public function getIps($customer_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_ip WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->rows;
	}

	public function getTotalIps($customer_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_ip WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row['total'];
	}
	

	public function getTotalCustomersByIp($ip) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_ip WHERE ip = '" . $this->db->escape($ip) . "'");

		return $query->row['total'];
	}

	public function addBanIp($ip) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "customer_ban_ip` SET `ip` = '" . $this->db->escape($ip) . "'");
	}

	public function removeBanIp($ip) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "customer_ban_ip` WHERE `ip` = '" . $this->db->escape($ip) . "'");
	}

	public function getTotalBanIpsByIp($ip) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "customer_ban_ip` WHERE `ip` = '" . $this->db->escape($ip) . "'");

		return $query->row['total'];
	}

	public function getTotalLoginAttempts($email) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer_login` WHERE `email` = '" . $this->db->escape($email) . "'");

		return $query->row;
	}

	public function deleteLoginAttempts($email) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "customer_login` WHERE `email` = '" . $this->db->escape($email) . "'");
	}
	
	public function getListProfit($idUser) {
		$query = $this->db->query("SELECT pr.*,tm.name_vn,tm.name_en,c.username FROM " . DB_PREFIX . "profit pr LEFT JOIN " . DB_PREFIX . "type_money tm ON (pr.type_profit = tm.id) LEFT JOIN " . DB_PREFIX . "customer c ON (pr.from_userid = c.customer_id) WHERE pr.user_id = '" . (int)$idUser . "'");
		return $query->rows;
	}
	
	public function getListCustomers() {
		$query = $this->db->query("SELECT customer_id, CONCAT(lastname, ' ', firstname) AS name FROM " . DB_PREFIX . "customer");
		return $query->rows;
	}
	
	public function getListCustomerPackages() {
		$query = $this->db->query("SELECT cml.id_package,c.customer_id, CONCAT(c.lastname, ' ', c.firstname,'(Gói:',ml.name_vn,' - Tiền đầu tư:', FORMAT(cml.money_invest,0),'-Số đầu tư :',cml.number_contract,' - Ngày đầu tư:',DATE_FORMAT(cml.date_added,'%d/%m/%Y'),')') AS name_package FROM " . DB_PREFIX . "customer c RIGHT JOIN " . DB_PREFIX . "customer_ml cml ON (c.customer_id = cml.customer_id) LEFT JOIN " . DB_PREFIX . "member_level ml ON (cml.level = ml.id) ORDER BY c.customer_id ,cml.level");
		return $query->rows;
	}
	
	public function getListCustomerNotPackages() {
		$query = $this->db->query("SELECT CONCAT('-',c.customer_id) As id_package, CONCAT(c.lastname, ' ', c.firstname,'(Chưa có gói đầu tư)') AS name_package FROM " . DB_PREFIX . "customer c WHERE c.customer_id NOT IN (SELECT DISTINCT customer_id FROM sm_customer_ml)  ORDER BY c.customer_id ");
		return $query->rows;
	}
	
	public function getAutoCustomerPackages($data = array()) {
		$implode = array();

		if (!empty($data['p_node'])) {
			$implode = "CONCAT(c.lastname, ' ', c.firstname) LIKE '%" . $this->db->escape($data['p_node']) . "%'";
		}
		
		$sql1 = "SELECT cml.id_package,c.customer_id, CONCAT(c.lastname, ' ', c.firstname,'(Gói:',ml.name_vn,' - Tiền đầu tư:',FORMAT(cml.money_invest,0),'-Số đầu tư :',cml.number_contract,' - Ngày đầu tư:',DATE_FORMAT(cml.date_added,'%d/%m/%Y'),')') AS name_package FROM " . DB_PREFIX . "customer c RIGHT JOIN " . DB_PREFIX . "customer_ml cml ON (c.customer_id = cml.customer_id) LEFT JOIN " . DB_PREFIX . "member_level ml ON (cml.level = ml.id) ";
		
		
		$sql2 = "SELECT CONCAT('-',c.customer_id) As id_package,c.customer_id, CONCAT(c.lastname, ' ', c.firstname,'(Chưa có gói đầu tư)') AS name_package FROM " . DB_PREFIX . "customer c WHERE c.customer_id NOT IN (SELECT DISTINCT customer_id FROM sm_customer_ml) ";
		
		
		if ($implode) {
			$sql1 .= " WHERE ". $implode;
			$sql2 .=  " AND " . $implode;
		}
		
		$sql1 .= " ORDER BY c.customer_id ,cml.level ";
		$sql2 .= " ORDER BY c.customer_id ";
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql1 .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			$sql2 .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query1 = $this->db->query($sql1);
		$query2 = $this->db->query($sql2);

		$customerPackage =  $query1->rows;
		$notPackage =  $query2->rows;
		
		$result = array_merge($notPackage, $customerPackage);
		
		return $result;
		
	}
	
	public function getAllListCustomerPackages() {
		$query = $this->db->query("SELECT cml.* FROM " . DB_PREFIX . "customer c RIGHT JOIN " . DB_PREFIX . "customer_ml cml ON (c.customer_id = cml.customer_id) WHERE c.status = 1 and cml.status = 1");
		return $query->rows;
	}

	
	public function getAllListCustomers() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE status = 1");
		return $query->rows;
	}
	
	public function getListMemberLevel() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "member_level");
		return $query->rows;
	}
	
	public function getInfoPackages($id_package) {	
		$query = $this->db->query("SELECT cm.*,ml.name_vn AS package_vn,c.username,c.firstname FROM " . DB_PREFIX . "customer_ml cm LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = cm.customer_id) LEFT JOIN " . DB_PREFIX . "member_level ml ON (cm.level = ml.id) WHERE cm.id_package = '" . (int)$id_package . "'");

		return $query->row;
	}
	
	public function getNameParent($customer_id) {
		$query = $this->db->query("SELECT c.username AS name_parent FROM " . DB_PREFIX . "customer_ml cm LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = cm.customer_id)  WHERE cm.customer_id = '" . (int)$customer_id . "'");
		$row = $query->row;
		if(count($row)>0){
			return $row['name_parent'];
		}else{
			return "";
		}
		echo '4444';
		
	}
	public function getPnode($customer_id) {
		$query = $this->db->query("SELECT p_node FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");
		$row = $query->row;
		if(count($row)>0){
			return $row['p_node'];
		}else{
			return "";
		}
		echo '4444';
	}
	
	public function getCountryId($country_id) {
		$query = $this->db->query("SELECT ct.name AS name_country FROM " . DB_PREFIX . "country ct LEFT JOIN " . DB_PREFIX . "customer c ON (c.country_id = ct.country_id) WHERE ct.country_id = '" . (int)$country_id . "'");
		$row = $query->row;
		if(count($row)>0){
			return $row['name_country'];
		}else{
			return "";
		}
	}
	
	public function getFullNameParent($customer_id) {
		$query = $this->db->query("SELECT CONCAT( c.firstname,' (MHV: ',c.customer_code,')') AS name_parent FROM " . DB_PREFIX . "customer_ml cm LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = cm.customer_id)  WHERE cm.customer_id = '" . (int)$customer_id . "'");
		$row = $query->row;
		if(count($row)>0){
			return $row['name_parent'];
		}else{
			return "";
		}
	}
	
	public function createCTP($customer_id,$from_customer_id,$float){
		$date = strtotime(date('Y-m-d'));
		$month = date('m',$date);
		$year = date('Y',$date);
		$info_cus = $this->getInfoUsers($customer_id);
		$id_parent= $info_cus['p_node'];
		if($id_parent>0 ){
			if($float < 12){
				$info_parent = $this->getInfoUsers($id_parent);
			//	$dateRegis = strtotime($info_parent['date_added']);
			//	$numDate = $this->getDateCycle($date, $dateRegis);
				$monthRegister = $this->getMonthRegister($id_parent);
				$profit_p = $this->config->get('config_congtacphi');
				$description_p = 'công tác phí tháng '.$month.' năm:'.$year;
			//	if((($numDate <= 30 && $float <= intval($this->config->get('config_tangthang1'))) || ($numDate > 30 && $numDate <= 60 && $float <= intval($this->config->get('config_tangthang2'))) || ($numDate > 60 && $float <= intval($this->config->get('config_tangthang3')))) && $info_parent['status'] == 1){
				if((($monthRegister == 0 && $float <= intval($this->config->get('config_tangthang1'))) || ($monthRegister == 1 && $float <= intval($this->config->get('config_tangthang2'))) || ($monthRegister > 1 && $float <= intval($this->config->get('config_tangthang3')))) && $info_parent['status'] == 1){
					$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET user_id = '" .(int)$id_parent . "', receive = '" . $profit_p . "', type_profit = '2', description = '" . $description_p . "', from_userid = '" . (int)$from_customer_id . "',date = '".$date."'");
				}else{
					$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET user_id = '" .(int)$id_parent . "', receive = '0', type_profit = '2', description = '', from_userid = '" . (int)$from_customer_id . "',date = '".$date."'");
				}
				
			}else{
				$this->OffCustomer($id_parent,0);
			}
				$float = $float+1;
				$this->createCTP($id_parent,$from_customer_id,$float);
			}
		}

	
	public function OffCustomer($customer_id,$type_off){
		$date_off = strtotime(date('Y-m-d'));
		$day = date('d',$date_off);
		$month = intval(date('m',$date_off));
		$year = intval(date('Y',$date_off));
		if($month == 1){
			$monthPre = 12;
			$yearPre = $year - 1;
		}else{
			$monthPre = $month - 1;
			$yearPre = $year;
		}
		$datePre =  $yearPre."-".$monthPre."-".$day;
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");
		$rowCus = $query->row;
		$num_off = $rowCus['num_off'] + 1;
		if( $type_off == 1){
			$this->db->query("UPDATE " . DB_PREFIX . "customer SET status = 0,date_off = '".$datePre."',num_off = '".$num_off."',type_off = '".$type_off."' WHERE customer_id = '" . (int)$customer_id . "'");
		}else{
			$this->db->query("UPDATE " . DB_PREFIX . "customer SET status = 0,date_off = '".date('Y-m-d')."',num_off = '".$num_off."',type_off = '".$type_off."' WHERE customer_id = '" . (int)$customer_id . "'");
		}
	}
/*	
	public function makeProfitAllUser($date_start,$date_end) {
		$cycle_month = 30;
		$startTime = strtotime( $date_start );
		$endTime = strtotime( $date_end );

		$listUser = $this->getAllListCustomerPackages();
		
		foreach ($listUser as $user) {
			$dateRegis = strtotime($user['date_added']);
			if($dateRegis<$endTime && $user['status'] == 1){
				for ( $date = $startTime; $date <= $endTime; $date = $date + 86400 ) {
					$month = date('m',$date);
					$year = date('Y',$date);
					$numDay = $this->getDateCycle($date,$dateRegis);
					$numMonth = $numDay%$cycle_month;
					if($numMonth == 0 && $numDay != 0 && $date > $dateRegis){
						$ml_package_id = $user['id_package'];
						$id_user = $user['customer_id'];
						$level = (int)$user['level'];
					//	$month_invest = (int)$user['month_invest'];
						$money_invest = (int)$user['money_invest'];
					//	$percentProfit = $this->config->get('config_profit'.$level.'_'.$month_invest.'month');
						$percentProfit = $user['percent_profit'];
						$profit = ($percentProfit * $money_invest)/100;
						$description = 'Lợi nhuận tháng '.$month.' năm:'.$year;
						$hasProfit = $this->getHasProfit($ml_package_id,$id_user,1,$month,$year);
						
						if($profit > 0 && !$hasProfit){
							$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$ml_package_id . "',user_id = '" .(int)$id_user . "', receive = '" . $profit . "', type_profit = '1', description = '" . $description . "', from_userid = '" . (int)$id_user . "', from_packageid = '" . (int)$ml_package_id . "', from_money = '" . $money_invest . "', percent = '" . $percentProfit . "',date = '".$date."'");
						}
					}
				}
			}
		}
		return true;
	}
	
	*/
	
	public function makeProfitAllUser($date_start,$date_end) {
		$startTime = strtotime( $date_start );
		$endTime = strtotime( $date_end );

		$listUser = $this->getAllListCustomerPackages();
		
		foreach ($listUser as $user) {
			$dateRegis = strtotime($user['date_added']);
			$yearRegis = date('Y',$dateRegis);
			$monthRegis = date('m',$dateRegis);
			$dayRegis = date('d',$dateRegis);
			if($dateRegis<$endTime && $user['status'] == 1){
				for ( $date = $startTime; $date <= $endTime; $date = $date + 86400 ) {
					$makeProfit = false;
					$dayNow = date('d',$date);
					$monthNow = date('m',$date);
					$yearNow = date('Y',$date);
					
					$numYear = $yearNow - $yearRegis;
					$numMonth = (($numYear * 12) + $monthNow ) - $monthRegis;
					if($numMonth >0 ){
						if($dayNow == $dayRegis){
							$makeProfit = true;
						}else if($dayRegis > 28){
							$dateNext = $date + 86400;
							$monthNext = date('m',$dateNext);
							if($monthNext > $monthNow){
								$makeProfit = true;
							}
						}
					}
					
					if($makeProfit){
						$ml_package_id = $user['id_package'];
						$id_user = $user['customer_id'];
						$level = (int)$user['level'];
					//	$month_invest = (int)$user['month_invest'];
						$money_invest = (int)$user['money_invest'];
					//	$percentProfit = $this->config->get('config_profit'.$level.'_'.$month_invest.'month');
						$percentProfit = $user['percent_profit'];
						$profit = ($percentProfit * $money_invest)/100;
						$description = 'Lợi nhuận tháng '.$monthNow.' năm:'.$yearNow;
						$hasProfit = $this->getHasProfit($ml_package_id,$id_user,1,$monthNow,$yearNow);
						
						if($profit > 0 && !$hasProfit){
							$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$ml_package_id . "',user_id = '" .(int)$id_user . "', receive = '" . $profit . "', type_profit = '1', description = '" . $description . "', from_userid = '" . (int)$id_user . "', from_packageid = '" . (int)$ml_package_id . "', from_money = '" . $money_invest . "', percent = '" . $percentProfit . "',date = '".$date."'");
						}
					}
				}
			}
		}
		return true;
	}
	/*
	public function makeCommissionAllUser($date_start,$date_end) {
		$date_start = strtotime($date_start);
		$date_end = strtotime($date_end);
		$date = $date_end;
		$month = date('m',$date_end);
		$year = date('Y',$date_end);
		$listUser = $this->getAllListCustomerPackages();
	
		foreach ($listUser as $user) {
			if($user['status'] == 1){
				$profit = $this->getTotalProfit($user['id_package'],1,$date_start,$date_end);
				$id_user = $user['customer_id'];
				$p_id = $user['p_node'];
				if($p_id > 0){
					$info_parent = $this->getInfoPackages($p_id);
					$id_customer = $info_parent['customer_id'];
					//$level_p = (int)$info_parent['level'];
					//$percentProfit_p = $this->config->get('config_commission'.$level_p);
					$percentProfit_p = $info_parent['percent_commission'];
					$profit_p = ($percentProfit_p * $profit)/100;
					$description_p = 'Hoa hồng giới thiệu trực tiếp tháng '.$month.' năm:'.$year;
					//$hasProfit = $this->getHasProfitByUser($p_id,$id_customer,2,$user['id_package'],$month,$year);
					if($profit_p > 0 ){
						$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$p_id . "' ,user_id = '" .(int)$id_customer . "', receive = '" . $profit_p . "', type_profit = '2', description = '" . $description_p . "', from_userid = '" . (int)$id_user . "', from_packageid = '" . (int)$user['id_package'] . "', from_money = '" . $profit . "', percent = '" . $percentProfit_p . "',date = '".$date."'");
						$this->createCommission($p_id,$profit_p,$date);
					}
				}else if($p_id < 0){
					$id_customer = $p_id*(-1);
					$percentProfit_p = $this->config->get('config_commission0');
					$profit_p = ($percentProfit_p * $profit)/100;
					$description_p = 'Hoa hồng giới thiệu trực tiếp tháng '.$month.' năm:'.$year;
				//	$hasProfit = $this->getHasProfitByUser(0,$id_customer,2,$user['id_package'],$month,$year);
					if($profit_p > 0 ){
						$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '0' ,user_id = '" .(int)$id_customer . "', receive = '" . $profit_p . "', type_profit = '2', description = '" . $description_p . "', from_userid = '" . (int)$id_user . "', from_packageid = '" . (int)$user['id_package'] . "', from_money = '" . $profit . "', percent = '" . $percentProfit_p . "',date = '".$date."'");
					}
				}
				
				
			}
		}
		return true;
	}
	*/
	public function makeCommissionAllUser($date_start,$date_end) {
		
		if($date_end > $date_start){
			$date_start = strtotime($date_start);
			$date_end = strtotime($date_end);
			
			$monthStart = date('m',$date_start);
			$yearStart = date('Y',$date_start);
			
			$monthEnd = date('m',$date_end);
			$yearEnd = date('Y',$date_end);
			
			$month = ($yearEnd - $yearStart)*12 + $monthEnd;
			// Tinh khoang giua (chua tinh thang dau va thang cuoi)
			$numMonth = $month - $monthStart - 2;
			if($numMonth > 0){
				$BDday = strtotime(date("t-m-Y", $date_start));
				
				$BDNow = $BDday+86400;
				for($n = 1;$n<=$numMonth;$n++){
					$monthNow = date('m',$BDNow);
					$yearNow = date('Y',$BDNow);
					$lastNow = date("t-m-Y", $BDNow);
					$this->makeCommission('01-'.$monthNow.'-'.$yearNow,'10-'.$monthNow.'-'.$yearNow);
					$this->makeCommission('11-'.$monthNow.'-'.$yearNow,'20-'.$monthNow.'-'.$yearNow);
					$this->makeCommission('20-'.$monthNow.'-'.$yearNow,$lastNow);
					$BDNow = strtotime($lastNow) + 86400;
				}
			}
			//
			
			if($yearStart == $yearEnd &&  $monthStart == $monthEnd){
				// tinh ca thang dau va thang cuoi
				$dayNow =  date('d',$date_start);
				$monthNow =  date('m',$date_start);
				$yearNow =  date('Y',$date_start);
				$lastNow = date("t-m-Y", $date_start);
				
				if($dayNow == '01'){
					$this->makeCommission('01-'.$monthNow.'-'.$yearNow,'10-'.$monthNow.'-'.$yearNow);
					$this->makeCommission('11-'.$monthNow.'-'.$yearNow,'20-'.$monthNow.'-'.$yearNow);
					$this->makeCommission('20-'.$monthNow.'-'.$yearNow,$lastNow);
				}else if($dayNow <= '11'){
					$this->makeCommission('11-'.$monthNow.'-'.$yearNow,'20-'.$monthNow.'-'.$yearNow);
					$this->makeCommission('20-'.$monthNow.'-'.$yearNow,$lastNow);
				}else if ($dayNow <= '21'){
					$this->makeCommission('20-'.$monthNow.'-'.$yearNow,$lastNow);
				}
				
				
			}else{
				// Tinh cho thang bat dau
				$dayNow =  date('d',$date_start);
				$monthNow =  date('m',$date_start);
				$yearNow =  date('Y',$date_start);
				$lastNow = date("t-m-Y", $date_start);
				
				if($dayNow == '01'){
					$this->makeCommission('01-'.$monthNow.'-'.$yearNow,'10-'.$monthNow.'-'.$yearNow);
					$this->makeCommission('11-'.$monthNow.'-'.$yearNow,'20-'.$monthNow.'-'.$yearNow);
					$this->makeCommission('20-'.$monthNow.'-'.$yearNow,$lastNow);
				}else if($dayNow <= '11'){
					$this->makeCommission('11-'.$monthNow.'-'.$yearNow,'20-'.$monthNow.'-'.$yearNow);
					$this->makeCommission('20-'.$monthNow.'-'.$yearNow,$lastNow);
				}else if ($dayNow <= '21'){
					$this->makeCommission('20-'.$monthNow.'-'.$yearNow,$lastNow);
				}
			// Tinh cho thang cuoi
				$dayNow =  date('d',$date_end);
				$monthNow =  date('m',$date_end);
				$yearNow =  date('Y',$date_end);
				$lastNow = date("t-m-Y", $date_end);
				$dayLast = date('d',strtotime($lastNow));
				
				if($dayNow == $dayLast){
					$this->makeCommission('01-'.$monthNow.'-'.$yearNow,'10-'.$monthNow.'-'.$yearNow);
					$this->makeCommission('11-'.$monthNow.'-'.$yearNow,'20-'.$monthNow.'-'.$yearNow);
					$this->makeCommission('20-'.$monthNow.'-'.$yearNow,$lastNow);
				}else if($dayNow >= '21'){
					$this->makeCommission('01-'.$monthNow.'-'.$yearNow,'10-'.$monthNow.'-'.$yearNow);
					$this->makeCommission('11-'.$monthNow.'-'.$yearNow,'20-'.$monthNow.'-'.$yearNow);
				}else if ($dayNow <= '11'){
					$this->makeCommission('01-'.$monthNow.'-'.$yearNow,'10-'.$monthNow.'-'.$yearNow);
				}
			}
		}
	}
	
	
	public function OffUser12Thang() {
		$cycle_month = 30*12;
		$date = strtotime(date('Y-m-d'));
		$sql = "SELECT c.* FROM " . DB_PREFIX . "customer c WHERE c.status = 1";
		
		$query = $this->db->query($sql);
		$arrUser = $query->rows;
		
		foreach ($arrUser as $user) {
			$user_id = $user['customer_id'];
			$dateRegis = strtotime($user['date_added']);
			$numDay = $this->getDateCycle($date,$dateRegis);
			$numMonth = $numDay%$cycle_month;
			$numFor = 0;
			if($numMonth == 0 && $numDay != 0 && $date > $dateRegis){
				$this->OffCustomer($user['customer_id'],0);
			}
			
		}
		return true;
	}
	public function makeHPDuKien() {
		$date = strtotime(date('Y-m-d'));
		$day = date('d',$date);
		if($day == $this->config->get('config_ngaydongphi')){
			$month = date('m',$date);
			$year = date('Y',$date);
			if($month == "1"){
				$monthPre = 12;
				$yearPre = $year - 1;
			}else{
				$monthPre = $month - 1;
				$yearPre = $year;
			}
			$datePre = strtotime("01-".$monthPre."-".$yearPre);
			$dateLast = date("t-m-Y", $datePre);
			$sql = "SELECT c.* FROM " . DB_PREFIX . "customer c WHERE c.status = 1";
			
			$query = $this->db->query($sql);
			$arrUser = $query->rows;
			
			foreach ($arrUser as $user) {
				$user_id = $user['customer_id'];
				//$dateRegis = strtotime($user['date_added']);
				//$numDay = $this->getDateCycle($date,$dateRegis);
				//$numMonth = $numDay%$cycle_month;
				$numFor = 0;
				//if($numMonth == 0 && $numDay != 0 && $date > $dateRegis){
					
					$totalCTPInMonth = $this->getTotalProfit($user_id, 2, $datePre, $date)+0;
					if($totalCTPInMonth >= $this->config->get('config_donghoiphitruoc10')+0){
						$numFor = 10;
					}else if($totalCTPInMonth >= $this->config->get('config_donghoiphitruoc8')+0){
						$numFor = 8;
					}else if($totalCTPInMonth >= $this->config->get('config_donghoiphitruoc7')+0){
						$numFor = 7;
					}else if($totalCTPInMonth >= $this->config->get('config_donghoiphitruoc6')+0){
						$numFor = 6;
					}else if($totalCTPInMonth >= $this->config->get('config_donghoiphitruoc5')+0){
						$numFor = 5;
					}else if($totalCTPInMonth >= $this->config->get('config_donghoiphitruoc4')+0){
						$numFor = 4;
					}else if($totalCTPInMonth >= $this->config->get('config_donghoiphitruoc3')+0){
						$numFor = 3;
					}else if($totalCTPInMonth >= $this->config->get('config_donghoiphitruoc2')+0){
						$numFor = 2;
					}else if($totalCTPInMonth >= $this->config->get('config_donghoiphitruoc1')+0){
						$numFor = 1;
					}
				//}
				if($numFor > 0){
					$hoiPhi = $this->config->get('config_hoiphi')+0;
					
					for($n=1;$n<=$numFor;$n++){
						$totalHP = $this->countProfitByType($user_id,1);
						if( $totalHP<12){
							/*
							$queryLastHp = $this->db->query("SELECT * FROM " . DB_PREFIX . "profit WHERE user_id = '" . (int)$user_id . "' and type_profit in (1) ORDER BY id DESC LIMIT 1");
							$rowLastHp = $queryLastHp->row;
							$dateLastHp = $rowLastHp['date'];
							$monthLastHp = date('m',$dateLastHp);
							$yearLastHp = date('Y',$dateLastHp);
							if($monthLastHp == "12"){
								$monthLastHp = 1;
								$yearLastHp = $yearLastHp + 1;
							}else{
								$monthLastHp = $monthLastHp + 1;
							}
							$dateHp = date("Y-m-d", strtotime("01-".$monthLastHp."-".$yearLastHp));
							*/
							$thangHp = $totalHP+1;
							$queryMYHP = $this->db->query("SELECT  * FROM " . DB_PREFIX . "profit WHERE user_id = '" .(int)$user_id . "' AND type_profit = 1 ORDER BY id DESC LIMIT 1");
							$monthLast =  (int)$queryMYHP->row['month'];
							$yearLast =  (int)$queryMYHP->row['year'];
							if($monthLast == 12){
								$month = 1;
								$year = $yearLast + 1;
							}else{
								$month = $monthLast + 1; 
								$year = $yearLast;
							}
							$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET user_id = '" .(int)$user_id . "', receive = '".$hoiPhi."', type_profit = '1', description = 'Đóng hội phí lần ".$thangHp."', from_userid = '" . (int)$user_id . "',month = '".$month."',year = '".$year."',hp_from_ctp = '1',date = '".$date."',date_hpdk = '".strtotime($dateLast)."'");
						}
					}
				}
			}
		}
		return true;
	}
	
	/*
	public function makeHPFromCTP() {
		$date = strtotime(date('Y-m-d'));
		$day = date('d',$date);
		if($day < $this->config->get('config_ngaydongphi')){
			$month = date('m',$date);
			$year = date('Y',$date);
			$sql = "SELECT c.* FROM " . DB_PREFIX . "customer c WHERE c.status = 1";
			
			$query = $this->db->query($sql);
			$arrUser = $query->rows;
			
			foreach ($arrUser as $user) {
				$user_id = $user['customer_id'];
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "profit WHERE  user_id = ".$user_id." and type_profit = 1 and YEAR(  FROM_UNIXTIME(`date`)  ) = '".$year."' AND MONTH(   FROM_UNIXTIME(`date`)  ) = '".$month."'");
				$totalHP = $this->countProfitByType($user_id,1);
				
				if(!$query->row && $totalHP<12 && $totalHP>2){
					$totalCTP =  $this->getAllProfitByType($user_id, 2)+0;
					$totalHPFromCTP =  $this->getAllHPFromCTP($user_id)+0;
					
					$totalPayout =  $this->getAllProfitByType($user_id, 3)+0;
					
					$hoiPhi = $this->config->get('config_hoiphi')+0;
					$totalCTPReal = $totalCTP - ($totalHPFromCTP+$totalPayout);
					if($totalCTPReal >= $hoiPhi){
						$thangHp = $totalHP+1;
						$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET user_id = '" .(int)$user_id . "', receive = '".$hoiPhi."', type_profit = '1', description = 'Đóng hội phí lần ".$thangHp." từ công tác phí', from_userid = '" . (int)$user_id . "',month = '".$thangHp."',hp_from_ctp = '1',date = '".$date."'");
					}
				}
			}
		}
		return true;
	}
	
	*/
	
	public function checkOffUser() {
		$date = strtotime(date('Y-m-d'));
		$day = date('d',$date);
		if($day == $this->config->get('config_ngaydongphi')){
			$month = date('m',$date);
			$year = date('Y',$date);
			$sql = "SELECT c.* FROM " . DB_PREFIX . "customer c WHERE c.status = 1";
			
			$query = $this->db->query($sql);
			$arrUser = $query->rows;
			foreach ($arrUser as $user) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "profit WHERE  user_id = ".$user['customer_id']." and type_profit = 1 and YEAR(  FROM_UNIXTIME(`date`)  ) = '".$year."' AND MONTH(   FROM_UNIXTIME(`date`)  ) = '".$month."'");
				if(!$query->row){
					$this->OffCustomer($user['customer_id'],1);
				}
			}
		}
		return true;
	}
	
	public function makeCommission($date_start,$date_end) {
		$date_start = strtotime($date_start);
		$date_end = strtotime($date_end);
		$date = $date_end;
		$month = date('m',$date_end);
		$year = date('Y',$date_end);
		$listUser = $this->getAllListCustomerPackages();
	
		foreach ($listUser as $user) {
			if($user['status'] == 1){
				$profit = $this->getTotalProfit($user['id_package'],1,$date_start,$date_end);
				$id_user = $user['customer_id'];
				$p_id = $user['p_node'];
				if($p_id > 0){
					$info_parent = $this->getInfoPackages($p_id);
					$id_customer = $info_parent['customer_id'];
					$dateRegis = strtotime($info_parent['date_added']);
					//$level_p = (int)$info_parent['level'];
					//$percentProfit_p = $this->config->get('config_commission'.$level_p);
					
					$percentProfit_p = $info_parent['percent_commission'];
					$profit_p = ($percentProfit_p * $profit)/100;
					$description_p = 'Hoa hồng giới thiệu trực tiếp tháng '.$month.' năm:'.$year;
					//$hasProfit = $this->getHasProfitByUser($p_id,$id_customer,2,$user['id_package'],$month,$year);
					if($profit_p > 0 ){
						if($dateRegis <= $date_end){
							$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$p_id . "' ,user_id = '" .(int)$id_customer . "', receive = '" . $profit_p . "', type_profit = '2', description = '" . $description_p . "', from_userid = '" . (int)$id_user . "', from_packageid = '" . (int)$user['id_package'] . "', from_money = '" . $profit . "', percent = '" . $percentProfit_p . "',date = '".$date."'");
						}
						$this->createCommission($p_id,$profit_p,$date);
					}
					
				}else if($p_id < 0){
					$id_customer = $p_id*(-1);
					$percentProfit_p = $this->config->get('config_commission0');
					$profit_p = ($percentProfit_p * $profit)/100;
					$description_p = 'Hoa hồng giới thiệu trực tiếp tháng '.$month.' năm:'.$year;
				//	$hasProfit = $this->getHasProfitByUser(0,$id_customer,2,$user['id_package'],$month,$year);
					if($profit_p > 0 ){
						$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '0' ,user_id = '" .(int)$id_customer . "', receive = '" . $profit_p . "', type_profit = '2', description = '" . $description_p . "', from_userid = '" . (int)$id_user . "', from_packageid = '" . (int)$user['id_package'] . "', from_money = '" . $profit . "', percent = '" . $percentProfit_p . "',date = '".$date."'");
					}
				}
				
				
			}
		}
		return true;
	}
	
	public function createCommission($id_package,$commission,$date){
		$month = date('m',$date);
		$year = date('Y',$date);
		$info_package = $this->getInfoPackages($id_package);
		$id_customer = $info_package['customer_id'];
		$id_parent= $info_package['p_node'];
		if($id_parent>0){
			$info_parent = $this->getInfoPackages($id_parent);
			$id_user = $info_parent['customer_id'];
			$dateRegis = strtotime($info_parent['date_added']);
			//$level_p = (int)$info_parent['level'];
			//$percentProfit = $this->config->get('config_commission'.$level_p);
			$percentProfit = $info_parent['percent_commission'];
			$profit_p = ($percentProfit * $commission)/100;
			$description_p = 'Hoa hồng giới thiệu trực tiếp tháng '.$month.' năm:'.$year;
			if($profit_p > 0){
				if($dateRegis <= $date){
					$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$id_parent . "' ,user_id = '" .(int)$id_user . "', receive = '" . $profit_p . "', type_profit = '2', description = '" . $description_p . "', from_userid = '" . (int)$id_customer . "', from_packageid = '" . (int)$id_package . "', from_money = '" . $commission . "', percent = '" . $percentProfit . "',date = '".$date."'");
				}
				$this->createCommission($id_parent,$profit_p,$date);
			}
		}else if($id_parent < 0){
			$id_user = $id_parent*(-1);
			$percentProfit_p = $this->config->get('config_commission0');
			$profit_p = ($percentProfit_p * $commission)/100;
			$description_p = 'Hoa hồng giới thiệu trực tiếp tháng '.$month.' năm:'.$year;
			if($profit_p > 0 ){
				$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '0' ,user_id = '" .(int)$id_user . "', receive = '" . $profit_p . "', type_profit = '2', description = '" . $description_p . "', from_userid = '" . (int)$id_customer . "', from_packageid = '" . (int)$id_package . "', from_money = '" . $commission . "', percent = '" . $percentProfit_p . "',date = '".$date."'");
			}
		}
	}
	
	
	public function makeProfitCommissionAllUser() {
		$cycle_month = 30;
		$date = date("Y-m-d H:i:s");
		$month = date('m',strtotime($date));
		$year = date('Y',strtotime($date));
		$listUser = $this->getAllListCustomerPackages();
		foreach ($listUser as $user) {
			$dateRegis = strtotime($user['date_added']);
			$numDay = $this->getDateCycle($date,$dateRegis);
			$numMonth = $numDay%$cycle_month;
			if($numMonth == 0 && $numDay != 0 && $date > $dateRegis){
				$ml_package_id = $user['id_package'];
				$id_user = $user['customer_id'];
				$level = (int)$user['level'];
				//$month_invest = (int)$user['month_invest'];
				$money_invest = (int)$user['money_invest'];
				//$percentProfit = $this->config->get('config_profit'.$level.'_'.$month_invest.'month');
				$percentProfit = $user['percent_profit'];
				$profit = ($percentProfit * $money_invest)/100;
				$description = 'Lợi nhuận tháng '.$month.' năm: '.$year;
				if($profit > 0){
					$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$ml_package_id . "',user_id = '" .(int)$id_user . "', receive = '" . $profit . "', type_profit = '1', description = '" . $description . "', from_userid = '" . (int)$id_user . "', from_money = '" . $money_invest . "', percent = '" . $percentProfit . "',date = '".strtotime($date)."'");
				}
				$p_id = $user['p_node'];
				if($p_id > 0){
					$info_parent = $this->getInfoPackages($p_id);
					$id_customer = $info_parent['customer_id'];
					//$level_p = (int)$info_parent['level'];
					//$month_invest_p = (int)$info_parent['month_invest'];
					//$percentProfit_p = $this->config->get('config_commission'.$level_p);
					$percentProfit_p = $info_parent['percent_commission'];
					$profit_p = ($percentProfit_p * $profit)/100;
					$description_p = 'Hoa hồng giới thiệu trực tiếp tháng '.$month.' năm:'.$year;
					if($profit_p > 0){
						$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$p_id . "' ,user_id = '" .(int)$id_customer . "', receive = '" . $profit_p . "', type_profit = '2', description = '" . $description_p . "', from_userid = '" . (int)$id_user . "', from_money = '" . $profit . "', percent = '" . $percentProfit_p . "',date = '".strtotime($date)."'");
						$this->createCommission($p_id,$profit_p,strtotime($date));
					}
				}else if($p_id < 0){
					$id_customer = $p_id*(-1);
					$percentProfit_p = $this->config->get('config_commission0');
					$profit_p = ($percentProfit_p * $profit)/100;
					$description_p = 'Hoa hồng giới thiệu trực tiếp tháng '.$month.' năm:'.$year;
					if($profit_p > 0 ){
						$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '0' ,user_id = '" .(int)$id_customer . "', receive = '" . $profit_p . "', type_profit = '2', description = '" . $description_p . "', from_userid = '" . (int)$id_user . "', from_money = '" . $profit . "', percent = '" . $percentProfit_p . "',date = '".strtotime($date)."'");
					}
				}
			}
		}
		return true;
	}
	
	public function makePayoutUser($customers_id,$date_start,$date_end) {
		$date_start = strtotime($date_start);
		$date_end = strtotime($date_end);
		$date = $date_end;
		$month = date('m',$date_end);
		$year = date('Y',$date_end);

		$contacphi = $this->getTotalProfit($user['id_package'],2,$date_start,$date_end);
		$hadPayout = $this->getTotalProfit($customers_id,3,$date_start,$date_end);
		
		$description = 'Thanh toán tháng '.$month.' năm: '.$year;
		//$hasProfit = $this->getHasProfit($id_package,$id_customer,4,$month,$year);
		if($contacphi > 0 && $hadPayout < $contacphi){
			$payout = $contacphi - $hadPayout;
			if($payout>0){
				$this->payout($id_customer,$description,$payout,$date);
			}
		}
		return true;
	}
	
	public function makePayoutAllUser($date_start,$date_end) {
		$date_start = strtotime($date_start);
		$date_end = strtotime($date_end);
		$date = $date_end;
		$month = date('m',$date_end);
		$year = date('Y',$date_end);
		$listUser = $this->getAllListCustomerPackages();
		foreach ($listUser as $user) {
			if($user['status'] == 1){
				$profit = $this->getTotalProfit($user['id_package'],1,$date_start,$date_end);
				$commission = $this->getTotalProfit($user['id_package'],2,$date_start,$date_end);
				$git = $this->getTotalProfit($user['id_package'],3,$date_start,$date_end);
				$hadPayout = $this->getTotalProfit($user['id_package'],4,$date_start,$date_end);
				$totalPayout = $profit+$commission+$git;
				
				$id_package = $user['id_package'];
				$id_customer = $user['customer_id'];
				$description = 'Thanh toán tháng '.$month.' năm: '.$year;
				//$hasProfit = $this->getHasProfit($id_package,$id_customer,4,$month,$year);
				if($totalPayout > 0 && $hadPayout < $totalPayout){
					$payout = $totalPayout - $hadPayout;
					if($payout>0){
						$this->payout($id_package,$id_customer,$description,$payout,$date);
					}
				}
			}
		}
		return true;
	}
	
	public function getTotalProfit($user_id,$typeProfit,$date_start,$date_end) {
		$query = $this->db->query("SELECT sum(receive) AS total FROM " . DB_PREFIX . "profit WHERE user_id = '" . (int)$user_id . "' and type_profit in (".$typeProfit.") and date >= ".$date_start." and date < ".$date_end."");

		return $query->row['total'];
	}
/*	
	public function makeGiftUser($customers_id,$date_start,$date_end) {
		
		$cycle_month = 30;
		$date_start = strtotime($date_start);
		$date_end = strtotime($date_end);

		$listUser = $this->getTransactionsPackage($customers_id);
		foreach ($listUser as $user) {
			$dateRegis = strtotime($user['date_added']);
			if($dateRegis<$date_end && $date_start<=$date_end && $user['status'] == 1){
				for ( $date = $date_start; $date <= $date_end; $date = $date + 86400 ) {
					$month = date('m',$date);
					$year = date('Y',$date);
					$numDay = $this->getDateCycle($date,$dateRegis);
					$numMonth = $numDay%$cycle_month;
					if($numMonth == 0 && $numDay != 0 && $date > $dateRegis){
						$ml_package_id = $user['id_package'];
						$id_user = $user['customer_id'];
						$level = (int)$user['level'];
						$money_invest = (int)$user['money_invest'];
						//$percentGift = $this->config->get('config_gift'.$level);
						$percentGift = $user['percent_gift'];
						$profit = ($percentGift * $money_invest)/100;
						$description = 'Tặng thưởng trong tháng '.$month.' năm:'.$year;
						$hasProfit = $this->getHasProfit($ml_package_id,$id_user,3,$month,$year);
						if($profit>0 && !$hasProfit){
							$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$ml_package_id . "',user_id = '" .(int)$id_user . "', receive = '" . $profit . "', type_profit = '3', description = '" . $description . "', from_userid = '" . (int)$id_user . "', from_packageid = '" . (int)$ml_package_id . "', from_money = '" . $money_invest . "', percent = '" . $percentGift . "',date = '".$date."'");
							}
					}
				}
			}
		}
		return true;
	}
	

	public function makeGiftAllUser($date_start,$date_end) {

		$cycle_month = 30;
		$date_start = strtotime($date_start);
		$date_end = strtotime($date_end);
		$listUser = $this->getAllListCustomerPackages();
		foreach ($listUser as $user) {
			$dateRegis = strtotime($user['date_added']);
			if($dateRegis<$date_end && $date_start<=$date_end && $user['status'] == 1){
				for ( $date = $date_start; $date <= $date_end; $date = $date + 86400 ) {
					$month = date('m',$date);
					$year = date('Y',$date);
					$numDay = $this->getDateCycle($date,$dateRegis);
					$numMonth = $numDay%$cycle_month;
					if($numMonth == 0 && $numDay != 0 && $date > $dateRegis){
						$ml_package_id = $user['id_package'];
						$id_user = $user['customer_id'];
						$level = (int)$user['level'];
						$money_invest = (int)$user['money_invest'];
						//$percentGift = $this->config->get('config_gift'.$level);
						$percentGift = $user['percent_gift'];
						$profit = ($percentGift * $money_invest)/100;
						$description = 'Tặng thưởng trong tháng '.$month.' năm:'.$year;
						$hasProfit = $this->getHasProfit($ml_package_id,$id_user,3,$month,$year);
						if($profit>0 && !$hasProfit){
							$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$ml_package_id . "',user_id = '" .(int)$id_user . "', receive = '" . $profit . "', type_profit = '3', description = '" . $description . "', from_userid = '" . (int)$id_user . "', from_packageid = '" . (int)$ml_package_id . "', from_money = '" . $money_invest . "', percent = '" . $percentGift . "',date = '".$date."'");
							}
					}
				}
			}
		}
		return true;
	}
*/	
	public function makeGiftUser($customers_id,$date_start,$date_end) {
		
		$date_start = strtotime($date_start);
		$date_end = strtotime($date_end);

		$listUser = $this->getTransactionsPackage($customers_id);
		foreach ($listUser as $user) {
			$dateRegis = strtotime($user['date_added']);
			$dayRegis = date('d',$dateRegis);
			$monthRegis = date('m',$dateRegis);
			$yearRegis = date('Y',$dateRegis);
			if($dateRegis<$date_end && $date_start<=$date_end && $user['status'] == 1){
				for ( $date = $date_start; $date <= $date_end; $date = $date + 86400 ) {
					$makeGift = false;
					$dayNow = date('d',$date);
					$monthNow = date('m',$date);
					$yearNow = date('Y',$date);
					
					$numYear = $yearNow - $yearRegis;
					$numMonth = (($numYear * 12) + $monthNow ) - $monthRegis;
					if($numMonth >0 ){
						if($dayNow == $dayRegis){
							$makeGift = true;
						}else if($dayRegis > 28){
							$dateNext = $date + 86400;
							$monthNext = date('m',$dateNext);
							if($monthNext > $monthNow){
								$makeGift = true;
							}
						}
					}
		
					if($makeGift){
						$ml_package_id = $user['id_package'];
						$id_user = $user['customer_id'];
						$level = (int)$user['level'];
						$money_invest = (int)$user['money_invest'];
						//$percentGift = $this->config->get('config_gift'.$level);
						$percentGift = $user['percent_gift'];
						$gift = ($percentGift * $money_invest)/100;
						$description = 'Tặng thưởng trong tháng '.$monthNow.' năm:'.$yearNow;
						$hasGift = $this->getHasProfit($ml_package_id,$id_user,3,$monthNow,$yearNow);
						if($gift>0 && !$hasGift){
							$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$ml_package_id . "',user_id = '" .(int)$id_user . "', receive = '" . $gift . "', type_profit = '3', description = '" . $description . "', from_userid = '" . (int)$id_user . "', from_packageid = '" . (int)$ml_package_id . "', from_money = '" . $money_invest . "', percent = '" . $percentGift . "',date = '".$date."'");
							}
					}
				}
			}
		}
		return true;
	}
	

	public function makeGiftAllUser($date_start,$date_end) {

		$date_start = strtotime($date_start);
		$date_end = strtotime($date_end);
		$listUser = $this->getAllListCustomerPackages();
		foreach ($listUser as $user) {
			$dateRegis = strtotime($user['date_added']);
			$dayRegis = date('d',$dateRegis);
			$monthRegis = date('m',$dateRegis);
			$yearRegis = date('Y',$dateRegis);
			if($dateRegis<$date_end && $date_start<=$date_end && $user['status'] == 1){
				for ( $date = $date_start; $date <= $date_end; $date = $date + 86400 ) {
					$makeGift = false;
					$dayNow = date('d',$date);
					$monthNow = date('m',$date);
					$yearNow = date('Y',$date);
					
					$numYear = $yearNow - $yearRegis;
					$numMonth = (($numYear * 12) + $monthNow ) - $monthRegis;
					if($numMonth >0 ){
						if($dayNow == $dayRegis){
							$makeGift = true;
						}else if($dayRegis > 28){
							$dateNext = $date + 86400;
							$monthNext = date('m',$dateNext);
							if($monthNext > $monthNow){
								$makeGift = true;
							}
						}
					}
					if($makeGift){
						$ml_package_id = $user['id_package'];
						$id_user = $user['customer_id'];
						$level = (int)$user['level'];
						$money_invest = (int)$user['money_invest'];
						//$percentGift = $this->config->get('config_gift'.$level);
						$percentGift = $user['percent_gift'];
						$profit = ($percentGift * $money_invest)/100;
						$description = 'Tặng thưởng trong tháng '.$monthNow.' năm:'.$yearNow;
						$hasProfit = $this->getHasProfit($ml_package_id,$id_user,3,$monthNow,$yearNow);
						if($profit>0 && !$hasProfit){
							$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$ml_package_id . "',user_id = '" .(int)$id_user . "', receive = '" . $profit . "', type_profit = '3', description = '" . $description . "', from_userid = '" . (int)$id_user . "', from_packageid = '" . (int)$ml_package_id . "', from_money = '" . $money_invest . "', percent = '" . $percentGift . "',date = '".$date."'");
							}
					}
				}
			}
		}
		return true;
	}
	
	public function getDateCycle($dateNow,$dateRegis){
	 	$timeDiff = abs($dateNow - $dateRegis);
	 	$numberDays = $timeDiff/86400;  // 86400 seconds in one day
	 	$numberDays = intval($numberDays);
	 	return $numberDays;
	 }
	
	public function getHasProfit($ml_package_id,$user_id,$type,$month,$year){
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "profit WHERE ml_package_id = ".$ml_package_id." and user_id = ".$user_id." and type_profit = ".$type ." and YEAR(  FROM_UNIXTIME(`date`)  ) = '".$year."' AND MONTH(   FROM_UNIXTIME(`date`)  ) = '".$month."'");
		return $query->row;
	}
	
	public function getHasProfitByUser($ml_package_id,$user_id,$type,$from_package_id,$month,$year){
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "profit WHERE ml_package_id = ".$ml_package_id." and user_id = ".$user_id." and type_profit = ".$type ." and from_packageid = ".$from_package_id." and YEAR(  FROM_UNIXTIME(`date`)  ) = '".$year."' AND MONTH(   FROM_UNIXTIME(`date`)  ) = '".$month."'");
		return $query->row;
	}
	
	public function getListChild($id_customer) {
		$query = $this->db->query("SELECT cm.*,c.username,c.firstname,c.telephone,c.status AS cus_status,c.date_added AS cus_date_added FROM " . DB_PREFIX . "customer_ml cm LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = cm.customer_id)   WHERE cm.p_node = '" . (int)$id_customer . "'");
		return $query->rows;
	}
	
	public function getListChildNotPackage($id_user) {
		$id_user = $id_user * (-1);
		$query = $this->db->query("SELECT cm.*,c.username,c.firstname,c.cmnd,CONCAT(c.lastname, ' ', c.firstname) as name_customer,ml.name_vn as package_vn FROM " . DB_PREFIX . "customer_ml cm LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = cm.customer_id) LEFT JOIN " . DB_PREFIX . "member_level ml ON (cm.level = ml.id)  WHERE cm.p_node = '" .$id_user . "'");

		return $query->rows;
	}
	
	public function deleteAllProfit(){
		$this->db->query("TRUNCATE TABLE " . DB_PREFIX . "profit");
	}
	
	
	public function getAutoCustomer($data = array()) {
		$implode = '';

		if (!empty($data['p_node'])) {
			$implode = "(CONCAT(c.lastname, ' ', c.firstname) LIKE '%" . $this->db->escape($data['p_node']) . "%' OR c.customer_code LIKE '%" . $this->db->escape($data['p_node']) . "%' ) AND (mlm.left = 0 OR mlm.right = 0)";
		}else{
			$implode = "mlm.left = 0 OR mlm.right = 0";
		}
		
		$sql1 = "SELECT c.customer_id, CONCAT(c.lastname, ' ', c.firstname,' (MHV: ',c.customer_code,')') AS name_customer FROM " . DB_PREFIX . "customer c Left Join " . DB_PREFIX . "customer_ml as mlm ON c.customer_id = mlm.customer_id ";
		
		$sql1 .= " WHERE ". $implode;
		
		$sql1 .= " ORDER BY c.customer_id  ";
/*		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql1 .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
*/
		$query1 = $this->db->query($sql1);

		$customerPackage =  $query1->rows;
		
		$result = $customerPackage;
		
		return $result;
	}
	
	function getInfoUsers($id_id){
		$query = $this->db->query("select u.*,ml.level, l.name_vn as level_member from ". DB_PREFIX . "customer_ml as ml Left Join " . DB_PREFIX . "customer as u ON ml.customer_id = u.customer_id Left Join " . DB_PREFIX . "member_level as l ON l.id = ml.level Where ml.customer_id = " . $id_id);
		$return  = $query->row;
		return $return;
	}
	
	
	function getFirstNode($id_id){
		$query = $this->db->query("SELECT id FROM ". DB_PREFIX . "customer_ml WHERE customer_id = ". $id_id ." ORDER BY id ASC LIMIT 1");
		return $query->row['id'];
	}
	
	
//	lay tong so thanh vien
	function getSumNumberMember($node){
		$result = 0;
		return $result;	
	}
	
	function getLeftO($id){
		$query = $this->db->query('select mlm.customer_id as id, mlm.level,CONCAT(u2.firstname," (ĐT: ",u2.telephone,")") as text, CONCAT( "level1"," left") as iconCls,CONCAT(u2.firstname," (ĐT: ",u2.telephone,")") as name,l.name_vn as level_user,u2.username,u2.status,u2.date_added  from '. DB_PREFIX . 'customer AS u2 LEFT join '. DB_PREFIX . 'customer_ml AS mlm ON u2.customer_id = mlm.customer_id INNER join '. DB_PREFIX . 'customer_ml AS u1 ON u1.left = mlm.customer_id left Join '. DB_PREFIX . 'member_level as l ON l.id = mlm.level where mlm.p_binary = ' . (int) $id);
	//	return json_decode(json_encode($query->row), false);
		return $query->row;
	}
	function getRightO($id){
		$query = $this->db->query('select mlm.customer_id as id, mlm.level,CONCAT(u2.firstname," (ĐT: ",u2.telephone,")") as text, CONCAT( "level1"," right") as iconCls,CONCAT(u2.firstname," (ĐT: ",u2.telephone,")") as name,l.name_vn as level_user,u2.username,u2.status,u2.date_added from '. DB_PREFIX . 'customer AS u2 LEFT join '. DB_PREFIX . 'customer_ml AS mlm ON u2.customer_id = mlm.customer_id INNER join '. DB_PREFIX . 'customer_ml AS u1 ON u1.right = mlm.customer_id left Join '. DB_PREFIX . 'member_level as l ON l.id = mlm.level where mlm.p_binary = ' . (int) $id);
		//return json_decode(json_encode($query->row), false);
		return $query->row;
	}	
	
	function getLeft($id){
		$query = $this->db->query("select u2.left from ". DB_PREFIX . "customer as u1 INNER JOIN ". DB_PREFIX . "customer_ml AS u2 ON u1.customer_id = u2.customer_id where u1.customer_id = " . (int) $id);
		return $query->row['left'];
	}
	function getRight($id){
		$query = $this->db->query("select u2.right from ". DB_PREFIX . "customer as u1 INNER JOIN ". DB_PREFIX . "customer_ml AS u2 ON u1.customer_id = u2.customer_id where u1.customer_id = " . (int) $id);
		return $query->row['right'];
	}
	
	function getSumLeft($id){		
		$result = 0;
		$left = $this->getLeft($id);
		if($left){
			$result +=1;
			$result += $this->getSumMember($left);
		}
		return $result;
	}
	
	//Get sum right node binarytree
	function getSumRight($id){		
		$result = 0;
		$right = $this->getRight($id);
		if($right){
			$result +=1;
			$result += $this->getSumMember($right);
		}		
		return $result;
	}	
	
	//Get sum left node and right node for any node bynary
	function getSumMember($id){		
		
		$result = 0;
		$left = $this->getLeft($id);
		$right = $this->getRight($id);
		if($left){
			$checkActive = $this->checkActiveUser($left);
			if($checkActive == 1){
				$result +=1;
			}
			$result += $this->getSumMember($left);
		}
		if($right){
			$checkActive = $this->checkActiveUser($right);
			if($checkActive == 1){
				$result +=1;
			}
			$result += $this->getSumMember($right);
		}
		
		//print_r($result);
		return $result;
	}
	
	function getSumFloor($arrId){		
		$floor = 0;
		$query = $this->db->query("select mlm.customer_id from ". DB_PREFIX . "customer as u Left Join ". DB_PREFIX . "customer_ml as mlm ON mlm.customer_id = u.customer_id  Where mlm.p_binary IN (". $arrId.")");
		$arrChild = $query->rows;
		
		if(!empty($arrChild)){
			$floor += 1;
			$arrId = '';
			foreach ($arrChild as $child) {
				$arrId .= ','.$child['customer_id'];
			}
			$arrId = substr($arrId, 1);
			$floor += $this->getSumFloor($arrId);
		}
		return $floor;
	}
	
	function getSumFloorByDate($arrId,$month_filter,$year){		
		$floor = 0;
		$query = $this->db->query("select mlm.customer_id from ". DB_PREFIX . "customer as u Left Join ". DB_PREFIX . "customer_ml as mlm ON mlm.customer_id = u.customer_id  Where YEAR(u.`date_added`) <= '".$year."' AND MONTH(u.`date_added`) <= '".$month_filter."' AND mlm.p_binary IN (". $arrId.")");
		$arrChild = $query->rows;
		
		if(!empty($arrChild)){
			$floor += 1;
			$arrId = '';
			foreach ($arrChild as $child) {
				$arrId .= ','.$child['customer_id'];
			}
			$arrId = substr($arrId, 1);
			$floor += $this->getSumFloorByDate($arrId,$month_filter,$year);
		}
		return $floor;
	}
	
	function checkActiveUser($id_user=0)
	{
		$query = $this->db->query("select u1.status from ". DB_PREFIX . "customer as u1 where u1.customer_id = " . (int) $id_user);	
		return $query->row['status'];
	}
	
	public function getTotalChild($customer_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_ml WHERE p_binary = " . (int) $customer_id);
		return intval($query->row['total']);
	}
	
	function getListIdChild($id_user){
		$listId = '';
		$query = $this->db->query("select customer_id from ". DB_PREFIX . "customer_ml where p_binary = " . (int) $id_user);	
		$array_id  = $query->rows;
		foreach ($array_id as $item) {
			$listId .= ','.$item['customer_id'];
			$listId .= $this->getListIdChild($item['customer_id']);
		}
		
		return $listId;
	}
	
	function getListCTP($id_user){
		$dateEnd = date("Y-m-d H:i:s");
		$date = strtotime(date('Y-m-d'));
		$dayEnd = date('d',strtotime($dateEnd));
		$monthEnd= date('m',strtotime($dateEnd));
		$yearEnd = date('Y',strtotime($dateEnd));
		$arrCTP = array();
		$query = $this->db->query("select * from ". DB_PREFIX . "customer where customer_id = " . (int) $id_user);
		$infoUser = $query->row;
		$dateStar = $infoUser['date_added'];
		
		$monthRegister = $this->getMonthRegister($id_user);
		$numHP = $this->countProfitByType($id_user, 1);
		$config_congtacphi = $this->config->get('config_congtacphi');
		for($n=1;$n<=12;$n++){
			$monthStar= date('m',strtotime($dateStar));
			$yearStar = date('Y',strtotime($dateStar));
			if($monthStar == "12"){
				$monthNext = 1;
				$yearNext = $yearStar + 1;
			}else{
				$monthNext = $monthStar + 1;
				$yearNext = $yearStar;
			}
			$dateNext = date("Y-m-d" ,strtotime("01-".$monthNext."-".$yearNext));
			if(strtotime($dateNext) <= strtotime($dateEnd)){
				$node = new stdClass();
				$queryHVTT = $this->db->query("select count(*) AS total from ". DB_PREFIX . "customer_ml where p_binary = " . (int) $id_user ." AND date_added >= '".$dateStar."' AND date_added < '".$dateNext."'");	
				$numHVTT  = $queryHVTT->row['total'];
				$CTP_HVTT = $numHVTT * $config_congtacphi;
				$node->numHVTT = $numHVTT;
				$node->CTP_HVTT = $CTP_HVTT;
				$queryHVGT = $this->db->query("select count(*) AS total from ". DB_PREFIX . "profit where user_id = " . (int) $id_user ." AND receive > 0 AND type_profit = 2 AND `date` >= '".strtotime($dateStar)."' AND `date` < '".strtotime($dateNext)."'");	
				$numHVGT  = $queryHVGT->row['total']-$numHVTT;
				$CTP_HVGT = $numHVGT * $config_congtacphi;
				$queryTotalHVGT = $this->db->query("select count(*) AS total from ". DB_PREFIX . "profit where user_id = " . (int) $id_user ." AND type_profit = 2 AND `date` >= '".strtotime($dateStar)."' AND `date` < '".strtotime($dateNext)."'");	
				$numTotalHVGT  = $queryTotalHVGT->row['total']-$numHVTT;
				$node->numHVGT = $numHVGT;
				$node->numTotalHVGT = $numTotalHVGT;
				$node->CTP_HVGT = $CTP_HVGT;
				$node->CTP_DuKien = $CTP_HVTT + $CTP_HVGT;
				$queryHPFromCTP = $this->db->query("select SUM(receive) AS total from ". DB_PREFIX . "profit where user_id = " . (int) $id_user ." AND type_profit = 1 AND hp_from_ctp = 1 AND date_hpdk >= '".strtotime($dateStar)."' AND date_hpdk < '".strtotime($dateNext)."'");	
				$numHPFromCTP  = $queryHPFromCTP->row['total'];
				
				$numUserOff = 0;
				$listIdChild = $this->getListIdChild($id_user);
				$listIdChild = substr($listIdChild, 1);
				
				if($listIdChild != ''){
					$queryUserOff = $this->db->query("SELECT c.* FROM " . DB_PREFIX . "customer c  WHERE c.customer_id IN (" . $listIdChild . ") AND c.status = 0 AND MONTH(c.date_off ) = '".$monthStar."' AND YEAR(c.date_off ) = '".$yearStar."' AND c.num_off = 1 and c.type_off = 1");
					$numUserOff = count($queryUserOff->rows);
				}
				if(($monthRegister > $n && $numHP > $n) || ($monthRegister == $n && $numHP > $n && $dayEnd >= $this->config->get('config_ngaydongphi')) || ($monthRegister == 11 && $n == 12 && $numHP == 12)){
						$node->CTP_Thuc = $node->CTP_DuKien - $numHPFromCTP - ($numUserOff * $config_congtacphi);
				}else{
					$node->CTP_Thuc = 0;
				}
				$dateStar = $dateNext;
				array_push($arrCTP, $node);
			}else{
				$node = new stdClass();
				$queryHVTT = $this->db->query("select count(*) AS total from ". DB_PREFIX . "customer_ml where p_binary = " . (int) $id_user ." AND date_added >= '".$dateStar."' AND date_added < '".$dateEnd."'");	
				$numHVTT  = $queryHVTT->row['total'];
				$CTP_HVTT = $numHVTT * $config_congtacphi;
				$node->numHVTT = $numHVTT;
				$node->CTP_HVTT = $CTP_HVTT;
				$queryHVGT = $this->db->query("select count(*) AS total from ". DB_PREFIX . "profit where user_id = " . (int) $id_user ."  AND receive > 0 AND type_profit = 2 AND `date` >= '".strtotime($dateStar)."' AND `date` < '".strtotime($dateEnd)."'");	
				$numHVGT  = $queryHVGT->row['total']-$numHVTT;
				$CTP_HVGT = $numHVGT * $config_congtacphi;
				$queryTotalHVGT = $this->db->query("select count(*) AS total from ". DB_PREFIX . "profit where user_id = " . (int) $id_user ." AND type_profit = 2 AND `date` >= '".strtotime($dateStar)."' AND `date` < '".strtotime($dateEnd)."'");	
				$numTotalHVGT  = $queryTotalHVGT->row['total']-$numHVTT;
				$node->numHVGT = $numHVGT;
				$node->numTotalHVGT = $numTotalHVGT;
				$node->CTP_HVGT = $CTP_HVGT;
				$node->CTP_DuKien = $CTP_HVTT + $CTP_HVGT;
				$queryHPFromCTP = $this->db->query("select SUM(receive) AS total from ". DB_PREFIX . "profit where user_id = " . (int) $id_user ." AND type_profit = 1 AND hp_from_ctp = 1 AND date_hpdk >= '".strtotime($dateStar)."' AND date_hpdk < '".strtotime($dateNext)."'");	
				$numHPFromCTP  = $queryHPFromCTP->row['total']+0;
				$numUserOff = 0;
				$listIdChild = $this->getListIdChild($id_user);
				$listIdChild = substr($listIdChild, 1);
				
				if($listIdChild != ''){
					$queryUserOff = $this->db->query("SELECT c.* FROM " . DB_PREFIX . "customer c  WHERE c.customer_id IN (" . $listIdChild . ") AND c.status = 0 AND MONTH(c.date_off) = '".$monthStar."' AND YEAR(c.date_off ) = '".$yearStar."' AND c.num_off = 1 and c.type_off = 1");
					$numUserOff = count($queryUserOff->rows);
				}
				if(($monthRegister > $n && $numHP > $n) || ($monthRegister == $n && $numHP > $n && $dayEnd >= $this->config->get('config_ngaydongphi')) || ($monthRegister == 11 && $n == 12 && $numHP == 12)){
					$node->CTP_Thuc = $node->CTP_DuKien - $numHPFromCTP - ($numUserOff * $config_congtacphi);
				}else{
					$node->CTP_Thuc = 0;
				}
				
				array_push($arrCTP, $node);
				break;
			}
		}
		
		if($n<12){
			for($n;$n<=12;$n++){
				$node = new stdClass();
				$node->numHVTT = 0;
				$node->CTP_HVTT = 0;
				$node->numHVGT = 0;
				$node->numTotalHVGT = 0;
				$node->CTP_HVGT = 0;
				$node->CTP_DuKien = 0;
				$node->CTP_Thuc = 0;
				array_push($arrCTP, $node);
			}
		}
		
		return $arrCTP;
	}
	
	function getCTPThucTe($id_user){
		$dateEnd = date("Y-m-d H:i:s");
		$dayEnd = date('d',strtotime($dateEnd));
		$monthEnd= date('m',strtotime($dateEnd));
		$yearEnd = date('Y',strtotime($dateEnd));
		$arrCTP = array();
		$query = $this->db->query("select * from ". DB_PREFIX . "customer where customer_id = " . (int) $id_user);
		$infoUser = $query->row;
		$dateStar = $infoUser['date_added'];
		$monthRegister = $this->getMonthRegister($id_user);
		$numHP = $this->countProfitByType($id_user, 1);
		$CTP_Thuc = 0;
		for($n=1;$n<=12;$n++){
			$monthStar= date('m',strtotime($dateStar));
			$yearStar = date('Y',strtotime($dateStar));
			if($monthStar == "12"){
				$monthNext = 1;
				$yearNext = $yearStar + 1;
			}else{
				$monthNext = $monthStar + 1;
				$yearNext = $yearStar;
			}
			$dateNext = date("Y-m-d" ,strtotime("01-".$monthNext."-".$yearNext));
			if(strtotime($dateNext) <= strtotime($dateEnd)){
				$queryCTP_DK = $this->db->query("select SUM(receive) AS total from ". DB_PREFIX . "profit where user_id = " . (int) $id_user ." AND type_profit = 2 AND date >= '".strtotime($dateStar)."' AND date < '".strtotime($dateNext)."'");
				$CTP_DuKien = $queryCTP_DK->row['total'];
				$queryHPFromCTP = $this->db->query("select SUM(receive) AS total from ". DB_PREFIX . "profit where user_id = " . (int) $id_user ." AND type_profit = 1 AND hp_from_ctp = 1 AND date_hpdk >= '".strtotime($dateStar)."' AND date_hpdk < '".strtotime($dateNext)."'");	
				$numHPFromCTP  = $queryHPFromCTP->row['total'];
				$numUserOff = 0;
				$listIdChild = $this->getListIdChild($id_user);
				$listIdChild = substr($listIdChild, 1);
				
				if($listIdChild != ''){
					$queryUserOff = $this->db->query("SELECT c.* FROM " . DB_PREFIX . "customer c  WHERE c.customer_id IN (" . $listIdChild . ") AND c.status = 0 AND MONTH(c.date_off) = '".$monthStar."' AND YEAR(c.date_off ) = '".$yearStar."' AND c.num_off = 1 and c.type_off = 1");
					$numUserOff = count($queryUserOff->rows);
				}
				if(($monthRegister > $n && $numHP > $n) || ($monthRegister == $n && $numHP > $n && $dayEnd >= $this->config->get('config_ngaydongphi')) || ($monthRegister == 11 && $n == 12 && $numHP == 12)){
					if($monthStar == $monthEnd && $yearStar == $yearEnd ){
						$CTP_Thuc = $CTP_Thuc;
					}else{
						$CTP_Thuc = $CTP_Thuc + ($CTP_DuKien - $numHPFromCTP - ($numUserOff * $this->config->get('config_congtacphi')));
					}
				}
				$dateStar = $dateNext;
			}else{
				$queryCTP_DK = $this->db->query("select SUM(receive) AS total from ". DB_PREFIX . "profit where user_id = " . (int) $id_user ." AND type_profit = 2 AND date >= '".strtotime($dateStar)."' AND date < '".strtotime($dateNext)."'");
				$CTP_DuKien = $queryCTP_DK->row['total'];
				$queryHPFromCTP = $this->db->query("select SUM(receive) AS total from ". DB_PREFIX . "profit where user_id = " . (int) $id_user ." AND type_profit = 1 AND hp_from_ctp = 1 AND date_hpdk >= '".strtotime($dateStar)."' AND date_hpdk < '".strtotime($dateNext)."'");	
				$numHPFromCTP  = $queryHPFromCTP->row['total']+0;
				$numUserOff = 0;
				$listIdChild = $this->getListIdChild($id_user);
				$listIdChild = substr($listIdChild, 1);
				
				if($listIdChild != ''){
					$queryUserOff = $this->db->query("SELECT c.* FROM " . DB_PREFIX . "customer c  WHERE c.customer_id IN (" . $listIdChild . ") AND c.status = 0 AND MONTH(c.date_off) = '".$monthStar."' AND YEAR(c.date_off ) = '".$yearStar."' AND c.num_off = 1 and c.type_off = 1");
					$numUserOff = count($queryUserOff->rows);
				}
				if(($monthRegister > $n && $numHP > $n) || ($monthRegister == $n && $numHP > $n && $dayEnd >= $this->config->get('config_ngaydongphi'))){
					$CTP_Thuc = $CTP_Thuc +  ($CTP_DuKien - $numHPFromCTP - ($numUserOff * $this->config->get('config_congtacphi')));
				}
				break;
			}
			
		}
		return $CTP_Thuc;
	}
	
	function getCTPThucTeByMonth($id_user,$month,$year){
		$dateEnd = date("Y-m-d H:i:s");
		$dayEnd = date('d',strtotime($dateEnd));
		$monthEnd= date('m',strtotime($dateEnd));
		$yearEnd = date('Y',strtotime($dateEnd));
		$arrCTP = array();
		$query = $this->db->query("select * from ". DB_PREFIX . "customer where customer_id = " . (int) $id_user);
		$infoUser = $query->row;
		$dateStar = $infoUser['date_added'];
		$monthRegister = $this->getMonthRegister($id_user);
		$numHP = $this->countProfitByType($id_user, 1);
		$CTP_Thuc = 0;
		for($n=1;$n<=12;$n++){
			$monthStar= date('m',strtotime($dateStar));
			$yearStar = date('Y',strtotime($dateStar));
			if($monthStar == "12"){
				$monthNext = 1;
				$yearNext = $yearStar + 1;
			}else{
				$monthNext = $monthStar + 1;
				$yearNext = $yearStar;
			}
			$dateNext = date("Y-m-d" ,strtotime("01-".$monthNext."-".$yearNext));
			if(strtotime($dateNext) <= strtotime($dateEnd)){
				$queryCTP_DK = $this->db->query("select SUM(receive) AS total from ". DB_PREFIX . "profit where user_id = " . (int) $id_user ." AND type_profit = 2 AND date >= '".strtotime($dateStar)."' AND date < '".strtotime($dateNext)."'");
				$CTP_DuKien = $queryCTP_DK->row['total'];
				$queryHPFromCTP = $this->db->query("select SUM(receive) AS total from ". DB_PREFIX . "profit where user_id = " . (int) $id_user ." AND type_profit = 1 AND hp_from_ctp = 1 AND date_hpdk >= '".strtotime($dateStar)."' AND date_hpdk < '".strtotime($dateNext)."'");	
				$numHPFromCTP  = $queryHPFromCTP->row['total'];
				$numUserOff = 0;
				$listIdChild = $this->getListIdChild($id_user);
				$listIdChild = substr($listIdChild, 1);
				
				if($listIdChild != ''){
					$queryUserOff = $this->db->query("SELECT c.* FROM " . DB_PREFIX . "customer c  WHERE c.customer_id IN (" . $listIdChild . ") AND c.status = 0 AND MONTH(c.date_off) = '".$monthStar."' AND YEAR(c.date_off ) = '".$yearStar."' AND c.num_off = 1 and c.type_off = 1");
					$numUserOff = count($queryUserOff->rows);
				}
				if(($monthRegister > $n && $numHP > $n) || ($monthRegister == $n && $numHP > $n && $dayEnd >= $this->config->get('config_ngaydongphi')) || ($monthRegister == 11 && $n == 12 && $numHP == 12)){
					if($monthStar == $monthEnd && $yearStar == $yearEnd ){
						$CTP_Thuc = $CTP_Thuc;
					}else if($monthStar == $month && $yearStar == $year ){
						$CTP_Thuc = $CTP_Thuc + ($CTP_DuKien - $numHPFromCTP - ($numUserOff * $this->config->get('config_congtacphi')));
					}
				}
				$dateStar = $dateNext;
			}else{
				$queryCTP_DK = $this->db->query("select SUM(receive) AS total from ". DB_PREFIX . "profit where user_id = " . (int) $id_user ." AND type_profit = 2 AND date >= '".strtotime($dateStar)."' AND date < '".strtotime($dateNext)."'");
				$CTP_DuKien = $queryCTP_DK->row['total'];
				$queryHPFromCTP = $this->db->query("select SUM(receive) AS total from ". DB_PREFIX . "profit where user_id = " . (int) $id_user ." AND type_profit = 1 AND hp_from_ctp = 1 AND date_hpdk >= '".strtotime($dateStar)."' AND date_hpdk < '".strtotime($dateNext)."'");	
				$numHPFromCTP  = $queryHPFromCTP->row['total']+0;
				$numUserOff = 0;
				$listIdChild = $this->getListIdChild($id_user);
				$listIdChild = substr($listIdChild, 1);
				
				if($listIdChild != ''){
					$queryUserOff = $this->db->query("SELECT c.* FROM " . DB_PREFIX . "customer c  WHERE c.customer_id IN (" . $listIdChild . ") AND c.status = 0 AND MONTH(c.date_off) = '".$monthStar."' AND YEAR(c.date_off ) = '".$yearStar."' AND c.num_off = 1 and c.type_off = 1");
					$numUserOff = count($queryUserOff->rows);
				}
				if(($monthRegister > $n && $numHP > $n) || ($monthRegister == $n && $numHP > $n && $dayEnd >= $this->config->get('config_ngaydongphi'))){
					$CTP_Thuc = $CTP_Thuc +  ($CTP_DuKien - $numHPFromCTP - ($numUserOff * $this->config->get('config_congtacphi')));
				}
				break;
			}
			
		}
		return $CTP_Thuc;
	}
	
	public function getMonthRegister($customer_id) {
		$date = strtotime(date('Y-m-d'));
		$yearNow = date('Y',$date);	
		$monthNow = date('m',$date);	
	 	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");
		$rowCus = $query->row;
		$dateRegis = strtotime($rowCus['date_added']);
		$yearRegis = date('Y',$dateRegis);	
		$monthRegis = date('m',$dateRegis);
		$numYear = $yearNow - $yearRegis;
		if($numYear>0){
			$monthNow = $monthNow + (12*$numYear);
		}
		return $monthNow - $monthRegis;
	}
	
	
}