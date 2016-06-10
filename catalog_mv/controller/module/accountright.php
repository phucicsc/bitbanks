<?php
class ControllerModuleAccountright extends Controller {
	public function index($setting) {
		$this->load->language('module/accountright');

		$data['heading_title'] = $this->language->get('heading_title');
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/accountright.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/accountright.tpl', $data);
		} else {
			return $this->load->view('default/template/module/accountright.tpl', $data);
		}
	}
}