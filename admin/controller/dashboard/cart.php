<?php
class ControllerDashboardCart extends Controller {
	public function index() {
		$this->load->language('dashboard/customer');

		$data['heading_title'] = $this->language->get('heading_title_cart');

		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['token'];

		// Total Orders
		$this->load->model('sale/customer_code');

		$data['percentage'] = 0;

		$customer_total = $this->model_sale_customer_code->getTotalCustomerCodes();

	
		
		$data['total'] = $customer_total;

		$data['customer'] = $this->url->link('sale/customer_code', 'token=' . $this->session->data['token'], 'SSL');

		return $this->load->view('dashboard/customer.tpl', $data);
	}
}