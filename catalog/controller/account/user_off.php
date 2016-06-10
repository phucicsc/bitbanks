<?php
class ControllerAccountUseroff extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/user_off', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->load->language('account/user_off');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/user_off', '', 'SSL')
		);

		$data['heading_title'] = $this->language->get('heading_title');
		
		
		$this->load->model('account/customer');
		
		$customer_id = $this->customer->getId();
		$listIdChild = $this->model_account_customer->getListIdChild($customer_id);
		$listIdChild = substr($listIdChild, 1);
		$listUserOff = $this->model_account_customer->getUserOff($listIdChild);
		
		foreach ($listUserOff as &$item) {
			$item['p_node'] = $this->model_account_customer->getNameParent($item['p_node']);
		}
		
		$data['listUserOff'] = $listUserOff;
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/user_off.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/user_off.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/user_off.tpl', $data));
		}
	}

}