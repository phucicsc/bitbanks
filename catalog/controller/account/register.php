<?php
class ControllerAccountRegister extends Controller {
	private $error = array();

	public function index() {
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));

		$this -> document -> addScript('catalog/view/javascript/register/register.js');

		if ($this -> request -> server['REQUEST_METHOD'] === 'POST') {

		}

		//start load country model
		$this -> load -> model('customize/country');
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;
		
		$data['country'] = $this -> model_customize_country -> getCountry();
		//end load country model

		//data render website
		$data['self'] = $this;

		//error validate
		$data['error'] = $this -> error;


		if ($this->request->server['REQUEST_METHOD'] === 'POST'){
			$this -> load -> model('customize/register');
			$tmp = $this -> model_customize_register -> addCustomer($this->request->post);

			//send email to partner
			
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->request->post['email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode("Bitbanks Global", ENT_QUOTES, 'UTF-8'));
			$mail->setSubject("Bitbanks Global - Congratulations Your Registration is Confirmed!");
			$mail->setHtml('
				<h1><span style="font-size:12px">Congratulations Your Registration is Confirmed!</span></h1>
				<p><span style="font-size:12px"><strong>What is Next?</strong></span></p>
				<p><span style="font-size:12px">You can now&nbsp;<a href="'.$this -> url -> link("account/login", "", "SSL").'" style="color:rgb(0,72,153);background:transparent" target="_blank">login</a>&nbsp;using your chosen&nbsp;<strong>user name and&nbsp;</strong><strong>password</strong>, and begin to use this website.</span></p>
				<p><span style="font-size:12px">Please assess our website via:&nbsp;<a href="'.$server.'" target="_blank">bitbanks.net</a> for the next step</span></p>
				<p><span style="font-size:12px">- Your user name : '.$this->request->post["username"].'</span></p>
				<p><span style="font-size:12px">- Your Password : '.$this->request->post["password"].'</span></p>
				<p><span style="font-size:12px">- Your Transaction Password : '.$this->request->post["transaction_password"].'</span></p>
				<p><span style="font-size:12px"><span style="font-family:arial,helvetica,sans-serif">If you have any questions, feel free to contact us by using our support center in the adress belov</span></span></p>
				<p><strong><span style="font-size:12px">Bitbanks Global support team!</span></strong></p>
			');
			$mail->send();
		}

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/register.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/register.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/register.tpl', $data));
		}

	}

	public function checkuser() {
		if ($this -> request -> get['username']) {
			$this -> load -> model('customize/register');
			$json['success'] = intval($this -> model_customize_register -> checkExitUserName($this -> request -> get['username'])) === 1 ? 1 : 0;
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function checkemail() {
		if ($this -> request -> get['email']) {
			$this -> load -> model('customize/register');

			$json['success'] = intval($this -> model_customize_register -> checkExitEmail($this -> request -> get['email'])) < 6 ? 0 : 1;
			$this -> response -> setOutput(json_encode($json));
		}
	}
	public function checkphone() {
		if ($this -> request -> get['phone']) {
			$this -> load -> model('customize/register');
			$json['success'] = intval($this -> model_customize_register -> checkExitPhone($this -> request -> get['phone'])) < 6 ? 0 : 1;
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function checkcmnd() {
		if ($this -> request -> get['cmnd']) {
			$this -> load -> model('customize/register');
			$json['success'] = intval($this -> model_customize_register -> checkExitCMND($this -> request -> get['cmnd'])) < 6 ? 0 : 1;
			$this -> response -> setOutput(json_encode($json));
		}
	}

	

}
