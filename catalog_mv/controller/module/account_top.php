<?php
class ControllerModuleAccounttop extends Controller {
	public function index() {
		die('1111111111111111111111');
		function myCheckLoign($self) {
			return $self->customer->isLogged() ? true : false;
		};


		!call_user_func_array("myCheckLoign", array($this)) && $this->response->redirect($this->url->link('account/login', '', 'SSL'));

		$this->load->language('module/accountleft');

		$data['title_account'] = $this->language->get('title_account');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['message'] = $this->url->link('account/message', '', 'SSL');
		$data['edit'] = $this->url->link('account/edit', '', 'SSL');
		$data['password'] = $this->url->link('account/password', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['logged'] = $this->customer->isLogged();
		$data['binary'] = $this->url->link('account/binary', '', 'SSL');
		$data['personal'] = $this->url->link('account/personal', '', 'SSL');
		$data['info_hp'] = $this->url->link('account/info_hp', '', 'SSL');
		$data['info_ctp'] = $this->url->link('account/info_ctp', '', 'SSL');
		$data['user_nothp'] = $this->url->link('account/user_nothp', '', 'SSL');
		$data['user_off'] = $this->url->link('account/user_off', '', 'SSL');
		$data['thongbao'] = $this->url->link('information/information&information_id=7', '', 'SSL');
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/account_top.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/account_top.tpl', $data);
		} else {
			return $this->load->view('default/template/module/account_top.tpl', $data);
		}
	}
}