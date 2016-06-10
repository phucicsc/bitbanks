<?php
class ControllerAccountRefferal extends Controller {

	public function index() {	

		function myCheckLoign($self) {
			return $self->customer->isLogged() ? true : false;
		};

		function myConfig($self){
			$self -> load -> model('account/customer');
			$self->document->addScript('catalog/view/javascript/refferal/refferal.js');
		};


		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this->response->redirect($this->url->link('account/login', '', 'SSL'));
		call_user_func_array("myConfig", array($this));		


		//data render website
		//start load country model
		$this -> load -> model('customize/country');
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$page = isset($this->request->get['page']) ? $this->request->get['page'] : 1;      

		$limit = 10;
		$start = ($page - 1) * 10;
		$refferals_total = $this->model_account_customer->getTotalRefferalByID($this -> session -> data['customer_id']);
		$refferals_total = $refferals_total['number'];

		$pagination = new Pagination();
		$pagination->total = $refferals_total;
		$pagination->page = $page;
		$pagination->limit = $limit; 
		$pagination->num_links = 5;
		$pagination->text = 'text';
		$pagination->url = $this->url->link('account/refferal', 'page={page}', 'SSL');

		$data['refferals'] = $this->model_account_customer->getRefferalByID($this -> session -> data['customer_id'] , $limit , $start);
		$data['pagination'] = $pagination->render();

		$data['base'] = $server;
		$data['self'] = $this;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/refferal.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/refferal.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/refferal.tpl', $data));
		}
	}

	public function getlevel(){
		if($this->customer->isLogged() && $this -> request -> get['id'] ) {
			$this->load->model('account/customer');
			$json['success'] = intval($this->model_account_customer->getCountLevelCustom($this -> request -> get['id'] , $this -> request -> get['level']));
			$this -> response -> setOutput(json_encode($json));
		}
	}
}