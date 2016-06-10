<?php
class ControllerAccountGd extends Controller {

	public function index() {
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> load -> model('account/customer');
			// $self -> document -> addScript('catalog/view/javascript/setting/setting.js');
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
		$gd_total = $this -> model_account_customer -> getTotalGD($this -> session -> data['customer_id']);
		$gd_total = $gd_total['number'];

		$pagination = new Pagination();
		$pagination -> total = $gd_total;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = $this -> url -> link('account/gd', 'page={page}', 'SSL');

		$data['gds'] = $this -> model_account_customer -> getGDById($this -> session -> data['customer_id'], $limit, $start);

		$data['pagination'] = $pagination -> render();

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/gd.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/gd.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/gd.tpl', $data));
		}
	}

	public function create() {
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> document -> addScript('catalog/view/javascript/gd/create.js');
			$self -> load -> model('account/customer');
		};

		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		call_user_func_array("myConfig", array($this));

		//get r_wallet AND c_wallet USER

		$data['r_wallet'] = $this -> model_account_customer -> getR_Wallet($this -> session -> data['customer_id']);
		$data['r_wallet'] = count($data['r_wallet']) > 0 ? $data['r_wallet']['amount'] : 0.0;

		$data['c_wallet'] = $this -> model_account_customer -> getC_Wallet($this -> session -> data['customer_id']);
		$data['c_wallet'] = count($data['c_wallet']) > 0 ? $data['c_wallet']['amount'] : 0.0;

		$server = $this -> request -> server['HTTPS'] ? $server = $this -> config -> get('config_ssl') : $server = $this -> config -> get('config_url');
		$data['base'] = $server;
		$data['self'] = $this;

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/gd_create.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/gd_create.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/gd_create.tpl', $data));
		}
	}

	public function submit() {
		if ($this -> customer -> isLogged() && $this -> request -> post['Password2']) {
			$json['login'] = $this -> customer -> isLogged() ? 1 : -1;
			$this -> load -> model('account/customer');
			$variablePasswd = $this -> model_account_customer -> getPasswdTransaction($this -> request -> post['Password2']);
			$json['password'] = $variablePasswd['number'] === '0' ? -1 : 1;

			$formWallet = $this -> request -> post['FromWallet'];
			$amount = $this -> request -> post['amount'];

			if(intval($formWallet) === 2){
				$r_wallet = $this -> model_account_customer -> getR_Wallet($this -> session -> data['customer_id']);
				$r_wallet = floatval($r_wallet['amount']);
				if($r_wallet < $amount || $amount > 3){
					die();
				}
			}
			if(intval($formWallet) === 1){
				$c_wallet = $this -> model_account_customer -> getC_Wallet($this -> session -> data['customer_id']);
				$c_wallet = floatval($c_wallet['amount']);
				if($c_wallet < $amount || $amount > 3){
					die();
				}
			}

			//check gd for day~~~
			$returnDate = null;
			$date = strtotime(date('Y-m-d'));
			$countGDOfDay = $this -> model_account_customer -> countGdOfDay(date('m',$date) , date('Y',$date)  , date('d',$date));
			$countGDOfDay = intval($countGDOfDay['number']);
			$returnDate = $countGDOfDay < 3 ? true : null;

			//create gd 
			if($returnDate === true){
				$returnDate = $this -> model_account_customer -> createGD($amount);
				//update r_wallet or c_wallet
				if($returnDate['query'] === true){
					$returnDate = false;
					if(intval($formWallet) === 2){
						$returnDate = $this -> model_account_customer -> update_R_Wallet($amount, $this -> session -> data['customer_id']);
					}

					if(intval($formWallet) === 1){
						$returnDate = $this -> model_account_customer -> update_C_Wallet($amount, $this -> session -> data['customer_id']);
					}
				}
			}
			
			$json['ok'] = $returnDate === true && $json['password'] === 1 ? 1 : -1;
			$json['link'] = $json['ok'] === 1 ? $this -> url -> link('account/gd/create', '', 'SSL') : null ;
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function transfer(){

		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> load -> model('account/customer');
			$self -> document -> addScript('catalog/view/javascript/countdown/jquery.countdown.min.js');
			$self -> document -> addScript('catalog/view/javascript/gd/countdown.js');

		};

		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		call_user_func_array("myConfig", array($this));
		
		!$this -> request -> get['token']  && $this -> response -> redirect($this -> url -> link('account/dashboard', '', 'SSL'));

		$server = $this -> request -> server['HTTPS'] ? $server = $this -> config -> get('config_ssl') : $server = $this -> config -> get('config_url');
		$data['base'] = $server;
		$data['self'] = $this;


		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/gd_transfer.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/gd_transfer.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/gd_transfer.tpl', $data));
		}
	}

	public function confirm(){
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


		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/gd_confirm.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/gd_confirm.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/gd_confirm.tpl', $data));
		}
	}

}
