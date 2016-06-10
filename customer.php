<?php
class ModelSaleCustomer extends Model {
	public function addCustomer($data) {

		$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET  firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', username = '" . $this->db->escape($data['username']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']) ? serialize($data['custom_field']) : '') . "', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', status = '" . (int)$data['status'] . "', cmnd = '" .  $this->db->escape($data['cmnd']) . "', account_bank = '" . $this->db->escape($data['account_bank']) . "', address_bank = '" . $this->db->escape($data['address_bank']) . "', p_node = '" . (int)$data['p_node'] . "'");

		$customer_id = $this->db->getLastId();

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
	
	public function addPackage($customer_id, $money_invest,$month_invest,$type_contract,$date_added) {
		if(!isset($money_invest)){
			$level = 0;
			$money_invest = 0;
		}else{
			if($money_invest >= $this->config->get('config_package4')){
				$level = 4;
			}else if($money_invest >= $this->config->get('config_package3')){
				$level = 3;
			}else if($money_invest >= $this->config->get('config_package2')){
				$level = 2;
			}else if($money_invest >= $this->config->get('config_package1')){
				$level = 1;
			}
		}
		
		if(!isset($month_invest)){
			$month_invest = 6;
		}
		
		if(!isset($type_contract)){
			$type_contract = '';
		}
		
		$date_added = date('Y-m-d',strtotime($date_added));
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "customer_ml SET customer_id = '" . (int)$customer_id . "', level = '".$level."', money_invest = '".$money_invest."', month_invest = '".$month_invest."', type_contract = '".$type_contract."', date_added = '".$date_added."'");
	}

	public function editCustomer($customer_id, $data) {
		if (!isset($data['custom_field'])) {
			$data['custom_field'] = array();
		}

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', username = '" . $this->db->escape($data['username']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']) ? serialize($data['custom_field']) : '') . "', status = '" . (int)$data['status'] . "', cmnd = '" . $this->db->escape($data['cmnd']) . "', account_bank = '" . $this->db->escape($data['account_bank']) . "', address_bank = '" . $this->db->escape($data['address_bank']) . "', p_node = '" . $data['p_node'] . "' WHERE customer_id = '" . (int)$customer_id . "'");

		if ($data['password']) {
			$this->db->query("UPDATE " . DB_PREFIX . "customer SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "' WHERE customer_id = '" . (int)$customer_id . "'");
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

	public function editToken($customer_id, $token) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET token = '" . $this->db->escape($token) . "' WHERE customer_id = '" . (int)$customer_id . "'");
	}

	public function deleteCustomer($customer_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$customer_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_transaction WHERE customer_id = '" . (int)$customer_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_ip WHERE customer_id = '" . (int)$customer_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "address WHERE customer_id = '" . (int)$customer_id . "'");
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET p_node = '0' WHERE p_node = '" . (int)$customer_id . "'");
	}

	public function getCustomer($customer_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");

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

	public function getCustomers($data = array()) {
		$sql = "SELECT c.*, CONCAT(c.lastname, ' ', c.firstname) AS name FROM " . DB_PREFIX . "customer c";

		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(c.lastname, ' ', c.firstname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}

		if (isset($data['filter_newsletter']) && !is_null($data['filter_newsletter'])) {
			$implode[] = "c.newsletter = '" . (int)$data['filter_newsletter'] . "'";
		}



		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(c.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'name',
			'c.email',
			'c.status',
			'c.approved',
			'c.ip',
			'c.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
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
			$implode[] = "CONCAT(lastname, ' ',firstname ) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
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
	
	public function getPackages($customer_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT cm.*,ml.name_vn AS package_vn FROM " . DB_PREFIX . "customer_ml cm LEFT JOIN " . DB_PREFIX . "member_level ml ON (cm.level = ml.id) WHERE cm.customer_id = '" . (int)$customer_id . "' ORDER BY cm.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}
	
	public function getTotalPackages($customer_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_ml WHERE customer_id = '" . (int)$customer_id . "'");

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
	
	public function getTransactionsProfit($customer_id) {

		$query = $this->db->query("SELECT pf.*,CONCAT(c.lastname, ' ', c.firstname) AS name_from FROM " . DB_PREFIX . "profit pf LEFT JOIN " . DB_PREFIX . "customer c ON (pf.from_userid = c.customer_id) WHERE pf.ml_package_id = '" . (int)$customer_id . "' ORDER BY date DESC");

		return $query->rows;
	}
	
	public function getMoneyInvest($package_id) {
		$query = $this->db->query("SELECT money_invest  FROM " . DB_PREFIX . "customer_ml WHERE id_package = '" . (int)$package_id . "'");
		
		return $query->row['money_invest'];
	}
	
	public function getAllMoneyInvest($customer_id) {
		$query = $this->db->query("SELECT SUM(money_invest) AS total  FROM " . DB_PREFIX . "customer_ml WHERE customer_id = '" . (int)$customer_id . "'");
		
		return $query->row['total'];
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
	
	public function getProfitByType($package_id,$type) {
		$query = $this->db->query("SELECT SUM(receive) AS total FROM " . DB_PREFIX . "profit WHERE ml_package_id = '" . (int)$package_id . "' and type_profit in (".$type.")");
		return $query->row['total'];
	}
	
	public function getProfitCustomerByType($user_id,$type) {
		$query = $this->db->query("SELECT SUM(receive) AS total FROM " . DB_PREFIX . "profit WHERE user_id = '" . (int)$user_id . "' and type_profit in (".$type.")");
		return $query->row['total'];
	}
	
	public function payout($id_package,$user_id,$description,$receive) {
		$date = date("Y-m-d H:i:s");
		$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$id_package . "',user_id = '" .(int)$user_id . "', receive = '" . $receive . "', type_profit = '4', description = '" . $description . "', from_userid = '" . (int)$user_id . "',date = '".strtotime($date)."'");

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
		$query = $this->db->query("SELECT cml.id_package,c.customer_id, CONCAT(c.lastname, ' ', c.firstname,'(Gói:',ml.name_vn,' - Tiền đầu tư:',cml.money_invest,')') AS name_package FROM " . DB_PREFIX . "customer c RIGHT JOIN " . DB_PREFIX . "customer_ml cml ON (c.customer_id = cml.customer_id) LEFT JOIN " . DB_PREFIX . "member_level ml ON (cml.level = ml.id) ORDER BY c.customer_id ,cml.level");
		return $query->rows;
	}
	
	public function getAllListCustomerPackages() {
		$query = $this->db->query("SELECT cml.*,c.p_node FROM " . DB_PREFIX . "customer c RIGHT JOIN " . DB_PREFIX . "customer_ml cml ON (c.customer_id = cml.customer_id) WHERE c.status = 1");
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
		$query = $this->db->query("SELECT cm.* FROM " . DB_PREFIX . "customer_ml cm LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = cm.customer_id) WHERE cm.id_package = '" . (int)$id_package . "'");

		return $query->row;
	}
	
	public function getNameParent($id_package) {	
		$query = $this->db->query("SELECT CONCAT(c.lastname, ' ', c.firstname,'(Gói:',ml.name_vn,' - Tiền đầu tư:',cm.money_invest,')') AS name_package FROM " . DB_PREFIX . "customer_ml cm LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_id = cm.customer_id) LEFT JOIN " . DB_PREFIX . "member_level ml ON (cm.level = ml.id) WHERE cm.id_package = '" . (int)$id_package . "'");

		return $query->row['name_package'];
	}
	
	public function makeProfitAllUser() {
		$cycle_month = 30;
		$date = date("Y-m-d H:i:s");
		$month = date('m',strtotime($date));
		$listUser = $this->getAllListCustomerPackages();
		foreach ($listUser as $user) {
			$dateRegis = strtotime($user['date_added']);
			$numDay = $this->getDateCycle($dateRegis);
			$numMonth = $numDay%$cycle_month;
			if($numMonth == 0 && $numDay != 0){
				$ml_package_id = $user['id_package'];
				$id_user = $user['customer_id'];
				$level = (int)$user['level'];
				$month_invest = (int)$user['month_invest'];
				$money_invest = (int)$user['money_invest'];
				$percentProfit = $this->config->get('config_profit'.$level.'_'.$month_invest.'month');
				$profit = ($percentProfit * $money_invest)/100;
				$description = 'Lợi nhuận tháng '.$month;
				if($profit > 0){
					$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$ml_package_id . "',user_id = '" .(int)$id_user . "', receive = '" . $profit . "', type_profit = '1', description = '" . $description . "', from_userid = '" . (int)$id_user . "',date = '".strtotime($date)."'");
				}
			}
		}
		return true;
	}
	
	public function makeCommissionAllUser() {
		$cycle_month = 30;
		$date = date("Y-m-d H:i:s");
		$month = date('m',strtotime($date));
		$listUser = $this->getAllListCustomerPackages();
		foreach ($listUser as $user) {
			$dateRegis = strtotime($user['date_added']);
			$numDay = $this->getDateCycle($dateRegis);
			$numMonth = $numDay%$cycle_month;
			if($numMonth == 0 && $numDay != 0){
				$ml_package_id = $user['id_package'];
				$id_user = $user['customer_id'];
				$level = (int)$user['level'];
				$month_invest = (int)$user['month_invest'];
				$money_invest = (int)$user['money_invest'];
				$percentProfit = $this->config->get('config_profit'.$level.'_'.$month_invest.'month');
				$profit = ($percentProfit * $money_invest)/100;
				
				$p_id = $user['p_node'];
				if($p_id != 0){
					$info_parent = $this->getInfoPackages($p_id);
					$id_customer = $info_parent['customer_id'];
					$level_p = (int)$info_parent['level'];
					$month_invest_p = (int)$info_parent['month_invest'];
					$percentProfit_p = $this->config->get('config_commission'.$level_p);
					$profit_p = ($percentProfit_p * $profit)/100;
					$description_p = 'Hoa hồng giới thiệu trực tiếp';
					if($profit_p > 0){
						$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$p_id . "' ,user_id = '" .(int)$id_customer . "', receive = '" . $profit_p . "', type_profit = '2', description = '" . $description_p . "', from_userid = '" . (int)$id_user . "',date = '".strtotime($date)."'");
					}
				}
			}
		}
		return true;
	}
	
	public function makeProfitCommissionAllUser() {
		$cycle_month = 30;
		$date = date("Y-m-d H:i:s");
		$month = date('m',strtotime($date));
		$listUser = $this->getAllListCustomerPackages();
		foreach ($listUser as $user) {
			$dateRegis = strtotime($user['date_added']);
			$numDay = $this->getDateCycle($dateRegis);
			$numMonth = $numDay%$cycle_month;
			if($numMonth == 0 && $numDay != 0){
				$ml_package_id = $user['id_package'];
				$id_user = $user['customer_id'];
				$level = (int)$user['level'];
				$month_invest = (int)$user['month_invest'];
				$money_invest = (int)$user['money_invest'];
				$percentProfit = $this->config->get('config_profit'.$level.'_'.$month_invest.'month');
				$profit = ($percentProfit * $money_invest)/100;
				$description = 'Lợi nhuận tháng '.$month;
				if($profit > 0){
					$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$ml_package_id . "',user_id = '" .(int)$id_user . "', receive = '" . $profit . "', type_profit = '1', description = '" . $description . "', from_userid = '" . (int)$id_user . "',date = '".strtotime($date)."'");
				}
				$p_id = $user['p_node'];
				if($p_id != 0){
					$info_parent = $this->getInfoPackages($p_id);
					$id_customer = $info_parent['customer_id'];
					$level_p = (int)$info_parent['level'];
					$month_invest_p = (int)$info_parent['month_invest'];
					$percentProfit_p = $this->config->get('config_commission'.$level_p);
					$profit_p = ($percentProfit_p * $profit)/100;
					$description_p = 'Hoa hồng giới thiệu trực tiếp';
					if($profit_p > 0){
						$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$p_id . "' ,user_id = '" .(int)$id_customer . "', receive = '" . $profit_p . "', type_profit = '2', description = '" . $description_p . "', from_userid = '" . (int)$id_user . "',date = '".strtotime($date)."'");
					}
				}
			}
		}
		return true;
	}
	
	public function makeGiftAllUser() {
		$date = date("Y-m-d H:i:s");
		$listUser = $this->getAllListCustomerPackages();
		foreach ($listUser as $user) {
			$ml_package_id = $user['id_package'];
			$id_user = $user['customer_id'];
			$level = (int)$user['level'];
			$money_invest = (int)$user['money_invest'];
			$percentGift = $this->config->get('config_gift'.$level);
			$profit = ($percentGift * $money_invest)/100;
			$description = 'Tặng thưởng';
			if($profit>0){
				$this->db->query("INSERT INTO " . DB_PREFIX . "profit SET ml_package_id = '" .(int)$ml_package_id . "',user_id = '" .(int)$id_user . "', receive = '" . $profit . "', type_profit = '3', description = '" . $description . "', from_userid = '" . (int)$id_user . "',date = '".strtotime($date)."'");
				}
			}
		return true;
	}
	
	public function getDateCycle($dateRegis){
	 	$dateNow = strtotime(date("Y-m-d H:i:s"));
	 	$timeDiff = abs($dateNow - $dateRegis);
	 	$numberDays = $timeDiff/86400;  // 86400 seconds in one day
	 	$numberDays = intval($numberDays);
	 	return $numberDays;
	 }
}