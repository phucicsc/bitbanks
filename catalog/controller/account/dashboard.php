<?php
class ControllerAccountDashboard extends Controller {

	public function index() {
		// $mail = new Mail();
		// $mail->protocol = $this->config->get('config_mail_protocol');
		// $mail->parameter = $this->config->get('config_mail_parameter');
		// $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		// $mail->smtp_username = $this->config->get('config_mail_smtp_username');
		// $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		// $mail->smtp_port = $this->config->get('config_mail_smtp_port');
		// $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		// $mail->setTo('phucnguyen@icsc.vn');
		// $mail->setFrom($this->config->get('config_email'));
		// $mail->setSender(html_entity_decode("test test", ENT_QUOTES, 'UTF-8'));
		// $mail->setSubject("asd11111111fssd");
		// $mail->setText("fddsasfsffsds");
		// $mail->send();

		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> document -> addScript('catalog/view/javascript/dashboard/dashboard.js');
			$self -> load -> model('simple_blog/article');
		};

		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		call_user_func_array("myConfig", array($this));

		//data render website
		//start load country model
		
		if ($this -> request -> server['HTTPS']) {
			$server = $this -> config -> get('config_ssl');
		} else {
			$server = $this -> config -> get('config_url');
		}

		$data['base'] = $server;
		$data['self'] = $this;

		// getArticles

		$data['article_limit'] = $this -> model_simple_blog_article -> getArticles(array('sort'  => 'ba.date_modified','order' => 'DESC','start' => 0,'limit' => 500));



		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/dashboard.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/dashboard.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/login.tpl', $data));
		}
	}

	public function buyPin(){
		if ($this -> customer -> isLogged() && $this -> request -> get['pin']) {
			$this -> load -> model('account/customer');
			$customer = $this -> model_account_customer ->getCustomer($this -> session -> data['customer_id']);
			$name = $customer['username'];
			$pin = $this -> request -> get['pin'];
			//email
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			
			$mail->setTo('bitbankglobal@gmail.com');
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode("Bitbanks Global", ENT_QUOTES, 'UTF-8'));
			$mail->setSubject("Bitbanks Global - User [".$name."] buy ".$pin."!");
			$mail->setHtml('
				<h1><span style="font-size:12px">Bitbanks Global - User ['.$name.'] buy '.$pin.'!</span></h1>
				<p> Please check wallet and send Pin for user : '.$name.' </p>
			');
			$mail->send();

			$mail->setTo($customer['email']);
			$mail->setSubject("Bitbanks Global - User [".$name."] buy ".$pin."!");
			$mail->setHtml('
				<h1><span style="font-size:12px">Bitbanks Global - User ['.$name.'] buy '.$pin.'!</span></h1>
				<p>Please wait admin www.bitbank.net check wallet and Pin will be sent to your account</p>
				<br/>
				<p>Thanks.</p>
			');
			$mail->send();
		}
	}

	/*
	 *
	 * ajax count total tree member
	 */
	public function totaltree() {
		if ($this -> customer -> isLogged() && $this -> request -> get['id']) {
			$this -> load -> model('account/customer');
			$json['success'] = intval($this -> model_account_customer -> getCountTreeCustom($this -> request -> get['id']));
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function totalpin() {
		if ($this -> customer -> isLogged() && $this -> request -> get['id']) {
			$this -> load -> model('account/customer');
			$pin = $this -> model_account_customer -> getCustomer($this -> request -> get['id']);
			$pin = $pin['ping'];
			$json['success'] = intval($pin);
			$pin = null;
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function analytics() {

		if ($this -> customer -> isLogged() && $this -> request -> get['id']) {
			$this -> load -> model('account/customer');
			$json['success'] = intval($this -> model_account_customer -> getCountLevelCustom($this -> request -> get['id'], $this -> request -> get['level']));
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function countPD(){
		if ($this -> customer -> isLogged() && $this -> request -> get['id']) {
			$this -> load -> model('account/customer');
			$total = $this -> model_account_customer -> getTotalPD($this -> request -> get['id']);
			$total = $total['number'];
			$json['success'] = intval($total);
			$total = null;
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function countGD(){
		if ($this -> customer -> isLogged() && $this -> request -> get['id']) {
			$this -> load -> model('account/customer');
			$total = $this -> model_account_customer -> getTotalGD($this -> request -> get['id']);
			$total = $total['number'];
			$json['success'] = intval($total);
			$total = null;
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function getRWallet(){
		if ($this -> customer -> isLogged() && $this -> request -> get['id']) {
			$this -> load -> model('account/customer');
			$checkR_Wallet = $this -> model_account_customer -> checkR_Wallet($this -> request -> get['id']);
			if(intval($checkR_Wallet['number'])  === 0){
				if(!$this -> model_account_customer -> insertR_Wallet($this -> request -> get['id'])){
					die();
				}
			}
			$total = $this -> model_account_customer -> getR_Wallet($this -> request -> get['id']);
			$total = count($total) > 0 ? $total['amount'] : 0.0;
			$total = $total >= 0 ? $total : 0;
			$json['success'] = number_format($total, 6, '.', ',');
			$total = null;
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function getCWallet(){
		if ($this -> customer -> isLogged() && $this -> request -> get['id']) {
			$this -> load -> model('account/customer');
			$total = $this -> model_account_customer -> getC_Wallet($this -> request -> get['id']);
			$total = count($total) > 0 ? $total['amount'] : 0.0;
			$total = $total >= 0 ? $total : 0;
			$json['success'] = number_format($total, 6, '.', ',');
			$total = null;
			$this -> response -> setOutput(json_encode($json));
		}
	}

}
