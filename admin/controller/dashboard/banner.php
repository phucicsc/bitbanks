<?php
class ControllerDashboardBanner extends Controller {
	public function index() {
		$this->load->language('dashboard/customer');

		$data['heading_title'] = $this->language->get('heading_title_banner');

		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['token'];

		// Total Orders
		$this->load->model('design/banner');

		
		$data['percentage'] = 0;

		$customer_total = $this->model_design_banner->getTotalBannersQC();

		
		$data['total'] = $customer_total;

		$data['customer'] = $this->url->link('design/banner', 'token=' . $this->session->data['token'], 'SSL');

		return $this->load->view('dashboard/customer.tpl', $data);
	}
}