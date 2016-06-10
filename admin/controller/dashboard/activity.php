<?php
class ControllerDashboardActivity extends Controller {
	public function index() {
		$this->load->language('dashboard/activity');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['token'] = $this->session->data['token'];

		$this->load->model('report/activity');
		
		$data['totalCustomers'] = $this->model_report_activity->getTotalCustomers();

		$data['totalCTP'] = $this->model_report_activity->getAllProfitByType(2);
		
		$data['totalHP'] = $this->model_report_activity->getAllProfitByType(1);
		
		$data['totalNewLast'] = $this->model_report_activity->getTotalCustomersNewLast();
		
		$data['totalNew'] = $this->model_report_activity->getTotalCustomersNew();
		
		$data['totalCusOff'] = $this->model_report_activity->getTotalCustomersOff();
		
		$data['onlineToday'] = $this->model_report_activity->onlineToday();
		
		$data['onlineYesterday'] = $this->model_report_activity->onlineYesterday();
		
		return $this->load->view('dashboard/activity.tpl', $data);
	}
}
