<?php
class ControllerAccountStatistic extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/statistic', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->load->language('account/statistic');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/statistic', '', 'SSL')
		);

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_username'] = $this->language->get('text_username');
		$data['text_email'] = $this->language->get('text_email');
		$data['text_phone'] = $this->language->get('text_phone');
		$data['text_date'] = $this->language->get('text_date');
		$data['text_package'] = $this->language->get('text_package');
		$data['text_month_invest'] = $this->language->get('text_month_invest');
		$data['text_money_invest'] = $this->language->get('text_money_invest');
		
		$this->load->model('account/customer');
		if(isset($this->request->get['id_package'])){
			$id_package = $this->request->get['id_package'];
			$listChild = $this->model_account_customer->getListChild($id_package);
		}else{
			$listChild = $this->model_account_customer->getListChildNotPackage($this->customer->getId());
		}
		$data['listChild'] = array();
		foreach ($listChild as $child) {
			$data['listChild'][] = array(
			'username' => $child['username'],
			'name' => $child['name_customer'],
			'cmnd' => $child['cmnd'],
			'money_invest'=>$child['money_invest'],
			'package_vn'=>$child['package_vn'],
			'month_invest'=>$child['month_invest'],
			'date_added'=>$child['date_added']);
			
		}
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/statistic.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/statistic.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/statistic.tpl', $data));
		}
	}

}