<?php
class ControllerReportCustomerProfit extends Controller {
	public function index() {
		$this->load->language('report/customer_profit');

		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->request->get['filter_customer'])) {
			$filter_customer = $this->request->get['filter_customer'];
		} else {
			$filter_customer = null;
		}
/*
		if (isset($this->request->get['filter_ip'])) {
			$filter_ip = $this->request->get['filter_ip'];
		} else {
			$filter_ip = null;
		}
*/
		if (isset($this->request->get['filter_date_start'])) {
			$filter_date_start = $this->request->get['filter_date_start'];
		} else {
			$filter_date_start = '';
		}

		if (isset($this->request->get['filter_date_end'])) {
			$filter_date_end = $this->request->get['filter_date_end'];
		} else {
			$filter_date_end = '';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
			'text' => $this->language->get('text_home')
		);

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('report/customer_activity', 'token=' . $this->session->data['token'] , 'SSL'),
			'text' => $this->language->get('heading_title')
		);

		$this->load->model('report/customer');

		$data['activities'] = array();

		$filter_data = array(
			'filter_customer'	=> $filter_customer,
			'filter_date_start'	=> $filter_date_start,
			'filter_date_end'	=> $filter_date_end
		);
/*
		$results = $this->model_report_customer->getCustomers($filter_data);

		$all_total_profit = 0;
		$all_total_commission = 0;
		$all_total_gift = 0;
		$all_total_payout = 0;
		
		foreach ($results as $result) {
			
			$total_profit = $this->model_report_customer->getProfitCustomerByType($result['customer_id'],'1',$filter_data);
			$total_commission = $this->model_report_customer->getProfitCustomerByType($result['customer_id'],'2',$filter_data);
			$total_gift = $this->model_report_customer->getProfitCustomerByType($result['customer_id'],'3',$filter_data);
			$total_payout = $this->model_report_customer->getProfitCustomerByType($result['customer_id'],'4',$filter_data);
			
			$all_total_profit = $all_total_profit + $total_profit;
			$all_total_commission = $all_total_commission + $total_commission;
			$all_total_gift = $all_total_gift + $total_gift;
			$all_total_payout = $all_total_payout + $total_payout;
			if($total_profit != 0 || $total_commission != 0 || $total_gift != 0 || $total_payout != 0){
				$data['activities'][] = array(
						'url_customer'	=> $this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id='.$result['customer_id'], 'SSL'),
						'name_customer'    => $result['name'],
						'total_profit'	=> $total_profit,
						'total_commission'	=> $total_commission,
						'total_gift'	=> $total_gift,
						'total_payout'	=> $total_payout
					);
			}
		}
		*/
		$results = $this->model_report_customer->getCustomerProfit($filter_data);
		$all_total_profit = 0;
		$all_total_commission = 0;
		$all_total_gift = 0;
		$all_total_payout = 0;
		
		foreach ($results as $result) {
			$total_profit = $this->model_report_customer->getProfitCustomerByPackage($result['id_package'],'1',$filter_data);
			$total_commission = $this->model_report_customer->getProfitCustomerByPackage($result['id_package'],'2',$filter_data);
			$total_gift = $this->model_report_customer->getProfitCustomerByPackage($result['id_package'],'3',$filter_data);
			$total_payout = $this->model_report_customer->getProfitCustomerByPackage($result['id_package'],'4',$filter_data);
			
			$all_total_profit = $all_total_profit + $total_profit;
			$all_total_commission = $all_total_commission + $total_commission;
			$all_total_gift = $all_total_gift + $total_gift;
			$all_total_payout = $all_total_payout + $total_payout;
			
			$nameParent = $this->model_report_customer->getNameParent($result['p_node']);
			$cmndParent = $this->model_report_customer->getCMNDParent($result['p_node']);
			
			if($result['date_end'] != null && $result['date_end'] != "0000-00-00 00:00:00"){
				$date_end = date($this->language->get('datetime_format'), strtotime($result['date_end']));
			}else{
				$date_end = '';
			}
			$data['activities'][] = array(
					'url_customer'	=> $this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id='.$result['customer_id'], 'SSL'),
					'name_customer'    => $result['name_customer'],
					'name_parent'	=> $nameParent,
					'cmnd_parent'	=> $cmndParent,
					'cmnd'  => $result['cmnd'],
					'address_bank'  => $result['address_bank'],
					'account_bank'  => $result['account_bank'],
					'total_profit'	=> $total_profit,
					'total_commission'	=> $total_commission,
					'total_gift'	=> $total_gift,
					'total_payout'	=> $total_payout
				);
		}
		$data['all_total_profit'] = $all_total_profit;
		$data['all_total_commission'] = $all_total_commission;
		$data['all_total_gift'] = $all_total_gift;
		$data['all_total_payout'] = $all_total_payout;
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_comment'] = $this->language->get('column_comment');
		$data['column_ip'] = $this->language->get('column_ip');
		$data['column_date_added'] = $this->language->get('column_date_added');

		$data['entry_customer'] = $this->language->get('entry_customer');
		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		
		$data['entry_date_added'] = $this->language->get('entry_date_added');
		$data['entry_total_profit'] = $this->language->get('column_total_profit');
		$data['entry_total_commission'] = $this->language->get('column_total_commission');
		$data['entry_total_gift'] = $this->language->get('column_total_gift');
		$data['entry_total_payout'] = $this->language->get('column_total_payout');
		$data['entry_total_package'] = $this->language->get('column_total_package');

		$data['button_filter'] = $this->language->get('button_filter');

		$data['token'] = $this->session->data['token'];


		$data['filter_customer'] = $filter_customer;
	/*	$data['filter_ip'] = $filter_ip;
		*/
		$data['filter_date_start'] = $filter_date_start;
		$data['filter_date_end'] = $filter_date_end;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('report/customer_profit.tpl', $data));
	}
}