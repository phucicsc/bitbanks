<?php
class ControllerAccountSetting extends Controller {
	public function index() {

		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> document -> addScript('catalog/view/javascript/setting/setting.js');
		};

		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		call_user_func_array("myConfig", array($this));

		//data render website
		//start load country model
		$this -> load -> model('customize/country');
		if ($this -> request -> server['HTTPS']) {
			$server = $this -> config -> get('config_ssl');
		} else {
			$server = $this -> config -> get('config_url');
		}

		$data['base'] = $server;
		$data['self'] = $this;

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/setting.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/setting.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/login.tpl', $data));
		}
	}


	public function editpasswd() {
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> document -> addScript('catalog/view/javascript/setting/setting.js');
		};
		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		call_user_func_array("myConfig", array($this));

		if ($this -> request -> server['REQUEST_METHOD'] === 'POST') {
			$this -> load -> model('account/customer');

			$this -> model_account_customer -> editPasswordCustom($this -> request -> post['password']);

			$variableLink = $this -> url -> link('account/setting', '', 'SSL') . '&success=password';

			$this -> response -> redirect($variableLink);
		}
	}

	public function edittransactionpasswd() {
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> document -> addScript('catalog/view/javascript/setting/setting.js');
		};
		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		call_user_func_array("myConfig", array($this));
		if ($this -> request -> server['REQUEST_METHOD'] === 'POST') {
			$this -> load -> model('account/customer');

			$this -> model_account_customer -> editPasswordTransactionCustom($this -> request -> post['transaction_password']);
			$variableLink = $this -> url -> link('account/setting', '', 'SSL') . '&success=transaction';
			$this -> response -> redirect($variableLink);
		}
	}

	public function edit() {
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> document -> addScript('catalog/view/javascript/setting/setting.js');
		};
		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		call_user_func_array("myConfig", array($this));

		if ($this -> request -> server['REQUEST_METHOD'] === 'POST') {
			$this -> load -> model('account/customer');
			$this -> model_account_customer -> editCustomerCusotm($this -> request -> post);
			$variableLink = $this -> url -> link('account/setting', '', 'SSL') . '&success=account';
			$this -> response -> redirect($variableLink);
		}
	}

	public function account() {
		if ($this -> customer -> isLogged() && $this -> request -> get['id']) {
			$this -> load -> model('account/customer');
			$this -> response -> setOutput(json_encode($this -> model_account_customer -> getCustomerCustomFormSetting($this -> request -> get['id'])));
		}
	}

	public function checkpasswdtransaction() {
		if ($this -> customer -> isLogged() && $this -> request -> get['pwtranction']) {
			$this -> load -> model('account/customer');
			$variable = $this -> model_account_customer -> getPasswdTransaction($this -> request -> get['pwtranction']);
			array_key_exists('number', $variable) && $this -> response -> setOutput(json_encode($variable['number']));
		}
	}

	public function checkpasswd() {
		if ($this -> customer -> isLogged() && $this -> request -> get['passwd']) {
			$this -> load -> model('account/customer');
			$variable = $this -> model_account_customer -> checkpasswd($this -> request -> get['passwd']);
			array_key_exists('number', $variable) && $this -> response -> setOutput(json_encode($variable['number']));
		}
	}

	public function updatewallet() {
		$json['login'] = $this -> customer -> isLogged() ? 1 : -1;
		if ($this -> customer -> isLogged() && $this -> request -> get['wallet'] && $this -> request -> get['transaction_password']) {
			
			$this -> load -> model('account/customer');
			$variablePasswd = $this -> model_account_customer -> getPasswdTransaction($this -> request -> get['transaction_password']);
			$json['password'] = $variablePasswd['number'] === '0' ? -1 : 1;

			$json['ok'] = $json['login'] === 1 && $json['password'] === 1 ? 1 : -1;

			$json['login'] === 1 && $json['password'] === 1 && $this -> model_account_customer -> editCustomerWallet($this -> request -> get['wallet']);
			$this -> response -> setOutput(json_encode($json));
		}
	}

}
