<?php
class ControllerAccountAccount extends Controller {
	public function index() {
		$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/account', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->load->language('account/account');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', 'SSL')
		);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_my_account'] = $this->language->get('text_my_account');
		$data['text_my_orders'] = $this->language->get('text_my_orders');
		$data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_reward'] = $this->language->get('text_reward');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_recurring'] = $this->language->get('text_recurring');

		$data['edit'] = $this->url->link('account/edit', '', 'SSL');
		$data['password'] = $this->url->link('account/password', '', 'SSL');
		$data['address'] = $this->url->link('account/address', '', 'SSL');
		$data['wishlist'] = $this->url->link('account/wishlist');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['return'] = $this->url->link('account/return', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');
		$data['recurring'] = $this->url->link('account/recurring', '', 'SSL');

		if ($this->config->get('reward_status')) {
			$data['reward'] = $this->url->link('account/reward', '', 'SSL');
		} else {
			$data['reward'] = '';
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/account.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/account.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/account.tpl', $data));
		}
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	
	public function autoRunFirstMonth(){
		require('admin/model/sale/customer.php');
		$adminCustomerModel = new ModelSaleCustomer( $this->registry );
		//Hội phí dự kiến(đủ tháng 30 ngày) chạy từng ngày(đóng hội phí trước)
		$results_HPDuKien = $adminCustomerModel->makeHPDuKien();
		/*
		if($results_HPDuKien){
			echo "Thành công : tính hội phí dự kiến";
		}else{
			echo "Thất bại : tính hội phí dự kiến";
		}
		*/
	}
	
	public function autoRunEveryDate(){
		require('admin/model/sale/customer.php');
		$adminCustomerModel = new ModelSaleCustomer( $this->registry );
		//Off hội viên vào ngày 10 chạy từng ngày
		$results_checkOffUser = $adminCustomerModel->checkOffUser();
		// Off HV quá 12 tháng(đủ tháng 30 ngày)chạy từng ngày
		$results_OffUser12Thang = $adminCustomerModel->OffUser12Thang();
		/*
		if($results_checkOffUser && $results_OffUser12Thang){
			echo "Thành công : Off hội viên chưa đóng phí và hội viên đủ 12 tháng";
		}else{
			echo "Thất bại : Off hội viên chưa đóng phí và hội viên đủ 12 tháng";
		}
		*/
	}

	public function updateWallet(){

		$dataWallet = array(
					'1NuhtGa8kXQsuxXQYFftMoyQ2rTvMzWodB',
					'19scvfNaFB2BQ13UgkVeuuSGt7h6wwdbWU',
					'1D4CTATqqDiN9YWAeMNMNDq6SomvLgn3vB',
					'194MXQ1xKRwSaom2Tzr2rVXmz3CT5v5H1J',
					'12Kc8TssNgMPCuCVFYokN3Pt2bEdzmSgCR',
					'1PRqeaPDsX3LsGZNr71i2PS9zuaNh7ag3A',
					'1JTdZjaxSX45LR36kLKVxjX37bMZT9SkTz',
					'1KzHCG9qpPdgjaGokN5BK6zJcgSWRtTWpH',
					'1MmtPFj4ZVurKbpUXPrsLNrY8zCwgPqzKW',
					'1AA9n3NmXDNpXDDQyC3C1YB1gGQwq9jedE'
					);
		$this->load->model('customize/register');
		$this->load->model('account/auto');
		$customer = $this->model_account_auto -> getCustomerALLInventory();
		$i = 0;
		foreach ($customer as $key => $value) {
			if(!$this->model_customize_register -> updateWallet($value['customer_id'], $dataWallet[$i])){
				die('error server');
			}else{
				$i++;
				$i > 9 && $i = 0;
			}
		}
		
	}

	public function autoPDGD(){

		$this->load->model('account/auto');
		$this->load->model('customize/register');

		//get first GD
		$loop = true;

		while ($loop) {
			
			$gdList = $this -> model_account_auto -> getGD7Before();

			$pdList = $this -> model_account_auto -> getPD7Before();
			if(count($gdList) === 0 && count($pdList) > 0){

				//get customer in inventory
				$inventory = $this -> model_account_auto ->getCustomerInventory();
				$pdSend = floatval($pdList['filled'] - $pdList['amount']);
				$inventoryID = $inventory['customer_id'];
				//create GD cho inventory
				$this -> model_account_auto -> createGDInventory($pdSend, $inventoryID);
				// die('1');
			}

			if(count($pdList) === 0 && count($gdList) > 0){

				$gdResiver = floatval($gdList['amount'] - $gdList['filled']);
				
				$inventory = $this -> model_account_auto ->getCustomerInventory();
				$inventoryID = $inventory['customer_id'];
				$this -> model_account_auto -> createPDInventory($gdResiver, $inventoryID);

				// die('2');
			}

			$gdList = $this -> model_account_auto -> getGD7Before();
			$pdList = $this -> model_account_auto -> getPD7Before();
			if(count($pdList) === 0 && count($gdList) === 0){
				$loop = false;
				break;
			}
			

			$pdSend = floatval($pdList['filled'] - $pdList['amount']);

			$gdResiver = floatval($gdList['amount'] - $gdList['filled']);

			if((string)$pdSend=== (string)$gdResiver ){
				
				$data['pd_id'] = $pdList['id'];
				$data['gd_id'] = $gdList['id'];
				$data['pd_id_customer'] = $pdList['customer_id'];
				$data['gd_id_customer'] = $gdList['customer_id'];
				$data['amount'] = $pdSend;

				$this -> model_account_auto -> createTransferList($data);
				
				$this -> model_account_auto -> updateStatusPD($pdList['id'], 1);
				$this -> model_account_auto -> updateStatusGD($gdList['id'], 1);
				$this -> model_account_auto -> updateAmountPD($pdList['id'], $pdList['filled']);
				$this -> model_account_auto -> updateFilledGD( $gdList['id'] , $gdList['amount']);

				// die('3');
			}

			if($pdSend < $gdResiver) {
				
				$data['pd_id'] = $pdList['id'];
				$data['gd_id'] = $gdList['id'];
				$data['pd_id_customer'] = $pdList['customer_id'];
				$data['gd_id_customer'] = $gdList['customer_id'];
				$data['amount'] = $pdSend;

				$this -> model_account_auto -> createTransferList($data);
				
				$this -> model_account_auto -> updateStatusPD($pdList['id'], 1);
				$this -> model_account_auto -> updateAmountPD($pdList['id'], $pdSend);
				
				$this -> model_account_auto -> updateFilledGD( $gdList['id'] , $pdSend);
				// die('4');
			}


			
			if($pdSend > $gdResiver){		
				$data['pd_id'] = $pdList['id'];
				$data['gd_id'] = $gdList['id'];
				$data['pd_id_customer'] = $pdList['customer_id'];
				$data['gd_id_customer'] = $gdList['customer_id'];
				$data['amount'] = $gdResiver;

				$this -> model_account_auto -> createTransferList($data);
				
				$this -> model_account_auto -> updateStatusGD($gdList['id'], 1);
				$this -> model_account_auto -> updateAmountPD($pdList['id'], $gdResiver);
				$this -> model_account_auto -> updateFilledGD( $gdList['id'] ,$gdList['amount']);
				// die('5');
				
			}

			
			// die('6');

		}

	}

	function sendEmailGD($customer_id){
		$url = $this -> url -> link('account/gd', '', 'SSL');
		$this -> load -> model('account/customer');
		$customer = $this -> model_account_customer ->getCustomer($customer_id);
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($customer['email']);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode("test test", ENT_QUOTES, 'UTF-8'));
		$mail->setSubject("[Bitbanks Global announcements] Your GD (Get Donation) have been matched");
		$mail->setHTML('
			<p>Dear member!</p>
			<p>We are pleased to announce that your GD (Get Donation) command has been matched.</p>
			<p>ID/User matched PD : '.$customer['username'].'</p>
			<p>Please login to your member page at: <a href="'.$url.'">GD LINK</a> to complete your transaction. </p>
			<p>Do not hesitate to contact me if you have any question. </p>
			<p>Best regards!</p>
			<p><b>Bitbanks Global Support Team</b></p>
		');
		$mail->send();
	}

	function sendEmailPD($customer_id){
		$url = $this -> url -> link('account/pd', '', 'SSL');
		$this -> load -> model('account/customer');
		$customer = $this -> model_account_customer ->getCustomer($customer_id);
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($customer['email']);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode("test test", ENT_QUOTES, 'UTF-8'));
		$mail->setSubject("[Bitbanks Global announcements] Your PD (Provide Donation) have been matched");
		$mail->setHTML('
			<p>Dear member!</p>
			<p>We are pleased to announce that your PD (Provide Donation) command has been matched.</p>
			<p>ID/User matched PD : '.$customer['username'].'</p>
			<p>Please login to your member page at: <a href="'.$url.'">PD LINK</a> to complete your transaction. </p>
			<p>Do not hesitate to contact me if you have any question. </p>
			<p>Best regards!</p>
			<p><b>Bitbanks Global Support Team</b></p>
		');
		$mail->send();
	}



	public function importInventory(){
		$this->load->model('customize/register');
		// die('11');
		$customer = $this->model_customize_register -> getTableCustomerTmp();

		foreach ($customer as $key => $value) {
			$data['p_node'] = -1;			
			$data['email'] = 'aiclinkvn@gmail.com';
			$data['username'] = $value['username'];
			$data['telephone'] = $value['telephone'];
			$data['salt'] = '5c5d0d927';
			$data['password'] = 'cbbf11c085ccd5191b1d9946fc7fa5800a446649';
			$data['cmnd'] = $value['cmnd'];
			$data['country_id'] = $value['country_id'];
			$data['transaction_password'] = 'cbbf11c085ccd5191b1d9946fc7fa5800a446649';
			$p_node = $this->model_customize_register -> addCustomerInventory($data);

		}

		die('ok');

	}
	
	
	
}