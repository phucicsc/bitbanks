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

	public function autoSevent(){

		$this->load->model('account/auto');
		//get first GD
		$loop = true;
		while ($loop) {
			$gdList = $this -> model_account_auto -> getGD7Before();
			//get first PD
			$pdList = $this -> model_account_auto -> getPD7Before();
			if(count($pdList) === 0 || count($gdList) === 0){
				$loop = false;
				break;
			}
			


			if((string)floatval($pdList['amount']) === (string)(floatval($gdList['amount']) - floatval($gdList['filled'])) ){
				//update PD Current
				
				//add tranfer list
				$data['pd_id'] = $pdList['id'];
				$data['gd_id'] = $gdList['id'];
				$data['pd_id_customer'] = $pdList['customer_id'];
				$data['gd_id_customer'] = $gdList['customer_id'];
				$data['amount'] = $pdList['amount'];
				
				$this -> model_account_auto -> updateStatusPD($pdList['id'], 1);
				$this -> model_account_auto -> updateStatusGD($gdList['id'], 1);
				$this -> model_account_auto -> updateAmountPD($pdList['id'], 0);
				$this -> model_account_auto -> updateFilledGD( $gdList['id'] ,floatval($pdList['amount']) + floatval($gdList['filled']));
				continue;
			}

			if(floatval($pdList['amount']) < (floatval($gdList['amount']) - floatval($gdList['filled'])) ){
				
				//update PD Current
		
				//add tranfer list
				$data['pd_id'] = $pdList['id'];
				$data['gd_id'] = $gdList['id'];
				$data['pd_id_customer'] = $pdList['customer_id'];
				$data['gd_id_customer'] = $gdList['customer_id'];
				$data['amount'] = $pdList['amount'];

				$this -> model_account_auto -> updateStatusPD($pdList['id'], 1);

				$this -> model_account_auto -> createTransferList($data);

				$this -> model_account_auto -> updateAmountPD($pdList['id'], 0);
				
				$this -> model_account_auto -> updateFilledGD( $gdList['id'] ,floatval($pdList['amount']) + floatval($gdList['filled']));
			}

			
			if(floatval($pdList['amount']) > (floatval($gdList['amount']) - floatval($gdList['filled'])) ){		
				
				$data['pd_id'] = $pdList['id'];
				$data['gd_id'] = $gdList['id'];
				$data['pd_id_customer'] = $pdList['customer_id'];
				$data['gd_id_customer'] = $gdList['customer_id'];
				$data['amount'] = (floatval($gdList['amount']) - floatval($gdList['filled']));

				//update
				$this -> model_account_auto -> createTransferList($data);
				$this -> model_account_auto -> updateStatusGD($gdList['id'], 1);
				$this -> model_account_auto -> updateAmountPD($pdList['id'], floatval($pdList['amount']) - (floatval($gdList['amount']) - floatval($gdList['filled'])));
				$this -> model_account_auto -> updateFilledGD( $gdList['id'] ,floatval($gdList['amount']));
				
			}

		}

	}
	
	
	
}