<?php
class ControllerDashboardCustomeraccount extends Controller {
	public function index() {
		$this->load->language('dashboard/customer');

		$data['heading_title'] = $this->language->get('heading_title_customer_account');

		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['token'];

		// Total Orders

		
		$data['percentage'] = 0;


		return $this->load->view('dashboard/customer.tpl', $data);
	}
}