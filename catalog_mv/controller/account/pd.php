<?php
class ControllerAccountPd extends Controller {

	public function index() {
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> load -> model('account/customer');

		};

		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		call_user_func_array("myConfig", array($this));

		$server = $this -> request -> server['HTTPS'] ? $server = $this -> config -> get('config_ssl') : $server = $this -> config -> get('config_url');
		$data['base'] = $server;
		$data['self'] = $this;

	

		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;

		$limit = 10;
		$start = ($page - 1) * 10;
		$pd_total = $this -> model_account_customer -> getTotalPD($this -> session -> data['customer_id']);

		$pd_total = $pd_total['number'];

		$pagination = new Pagination();
		$pagination -> total = $pd_total;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = $this -> url -> link('account/pd', 'page={page}', 'SSL');

		$data['pds'] = $this -> model_account_customer -> getPDById($this -> session -> data['customer_id'], $limit, $start);
		$data['pagination'] = $pagination -> render();

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/pd.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/pd.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/pd.tpl', $data));
		}
	}

	public function create() {
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> document -> addScript('catalog/view/javascript/pd/create.js');
		};

		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		call_user_func_array("myConfig", array($this));

		$server = $this -> request -> server['HTTPS'] ? $server = $this -> config -> get('config_ssl') : $server = $this -> config -> get('config_url');
		$data['base'] = $server;
		$data['self'] = $this;

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/pd_create.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/pd_create.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/pd_create.tpl', $data));
		}
	}

	public function submit() {
		$json['login'] = $this -> customer -> isLogged() ? 1 : -1;
		$json['pin'] = -1;
		if ($this -> customer -> isLogged() && $this -> request -> get['amount'] && $this -> request -> get['Password2']) {
			$this -> load -> model('account/customer');
			$variablePasswd = $this -> model_account_customer -> getPasswdTransaction($this -> request -> get['Password2']);

			$json['password'] = $variablePasswd['number'] === '0' ? -1 : 1;

			//check Pin , update Pin and save Pin History
			if ($json['password'] === 1) {
				$pin = $this -> model_account_customer -> getCustomer($this -> session -> data['customer_id']);
				$pin = $pin['ping'];
				$json['pin'] = $pin <= 0 ? -1 : 1;
			}

			//flag PD

			
			$flagPd = null;
			if($json['pin'] === 1 && $json['password'] === 1){
			
				$date = strtotime(date('Y-m-d'));
				$year = date('Y',$date);
				$month = date('m',$date);
				$countOfMonth = $this -> model_account_customer -> countPdOfMonth($month, $year);
				$countOfMonth = intval($countOfMonth['number']);
				$customer_lv = $this -> model_account_customer -> getCustomerCustom($this -> session -> data['customer_id']);
				$customer_lv = intval($customer_lv['level']);

				switch ($customer_lv) {
					case 1:
						$flagPd = $countOfMonth < 3 ? true : null;
						break;
					case 2:
						$flagPd = $countOfMonth < 8 ? true : null;
						break;
					case 3:
						$flagPd = $countOfMonth < 10 ? true : null;
						break;
					case 4:
						$flagPd = $countOfMonth < 15 ? true : null;
						break;
					case 5:
						$flagPd = $countOfMonth < 15 ? true : null;
						break;
					case 6:
						$flagPd = $countOfMonth < 15 ? true : null;
						break;
				}

			}
			//update Pin and save history Pin

			if ($json['password'] === 1 && $json['pin'] === 1 && $flagPd === true) {

				$pinUpdate = $pin - 1;
				$pinUpdate = $this -> model_account_customer -> updatePinCustom($this -> session -> data['customer_id'], $pinUpdate);

				if ($pinUpdate === true) {

					$pd_query = $this -> model_account_customer -> createPD($this -> request -> get['amount']);
					if ($pd_query['query']) {
						if ($this -> model_account_customer -> saveHistoryPin($this -> session -> data['customer_id'], '- 1', 'Used PIN for [PD' . $pd_query['pd_number'] . ']', 'PD', 'Used PIN for [PD' . $pd_query['pd_number'] . ']') > 0) {
							$json['ok'] = $json['pin'] === 1 && $json['login'] === 1 && $json['password'] === 1 ? 1 : -1;
						} else
							$json['ok'] = -1;
					} else
						$json['ok'] = -1;
					;
				} else
					$json['ok'] = -1;
				;
			}else{
				$json['ok'] = -1;
			}

			$this -> response -> setOutput(json_encode($json));
		}
	}
	
	public function transfer() {
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> load -> model('account/customer');

		};

		!$this -> request -> get['token']  && $this -> response -> redirect($this -> url -> link('account/dashboard', '', 'SSL'));

		
		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		call_user_func_array("myConfig", array($this));

		$getPDCustomer = $this -> model_account_customer -> getPDByCustomerIDAndToken($this -> session -> data['customer_id'], $this -> request -> get['token']);
		$getPDCustomer['number'] === 0 && $this -> response -> redirect($this -> url -> link('account/dashboard', '', 'SSL'));
		$getPDCustomer = null;
		

		$server = $this -> request -> server['HTTPS'] ? $server = $this -> config -> get('config_ssl') : $server = $this -> config -> get('config_url');
		$data['base'] = $server;
		$data['self'] = $this;

		//get pd form transfer list
		$PdUser = $this -> model_account_customer -> getPD($this -> session -> data['customer_id']);
		$checkPdOfUser = null;
		foreach ($PdUser as $key => $value) {
			if($value['id'] === $this -> request -> get['token']){
				$checkPdOfUser = true;
				break;
			}
		}

		!$checkPdOfUser && $this -> response -> redirect($this -> url -> link('account/dashboard', '', 'SSL'));

		$data['transferList'] = $this -> model_account_customer -> getPdFromTransferList($this -> request -> get['token']);

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/pd_transfer.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/pd_transfer.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/pd_transfer.tpl', $data));
		}
	}

	public function confirm() {
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> load -> model('account/customer');
			$self -> document -> addScript('catalog/view/javascript/confirm/confirm.js');
		};

		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		call_user_func_array("myConfig", array($this));
		

		$server = $this -> request -> server['HTTPS'] ? $server = $this -> config -> get('config_ssl') : $server = $this -> config -> get('config_url');
		$data['base'] = $server;
		$data['self'] = $this;


		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/pd_confirm.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/pd_confirm.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/pd_confirm.tpl', $data));
		}
	}

}
