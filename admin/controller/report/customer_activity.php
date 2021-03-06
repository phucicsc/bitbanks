<?php
class ControllerReportCustomerActivity extends Controller {
	public function index() {
		$this->load->language('report/customer_activity');

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
		
		if (isset($this->request->get['filter_area'])) {
			$filter_area = $this->request->get['filter_area'];
		} else {
			$filter_area = '';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . urlencode($this->request->get['filter_customer']);
		}
/*
		if (isset($this->request->get['filter_ip'])) {
			$url .= '&filter_ip=' . $this->request->get['filter_ip'];
		}
*/
		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}
		
		if (isset($this->request->get['filter_area'])) {
			$url .= '&filter_area=' . $this->request->get['filter_area'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
			'text' => $this->language->get('text_home')
		);

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('report/customer_activity', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'text' => $this->language->get('heading_title')
		);

		$this->load->model('report/customer');

		$data['activities'] = array();

		$filter_data = array(
			'filter_customer'	=> $filter_customer,
			'filter_date_start'	=> $filter_date_start,
			'filter_date_end'	=> $filter_date_end,
			'filter_area'	=> $filter_area
			//'start'             => ($page - 1) * 20,
			//'limit'             => 20
		);

		$activity_total = $this->model_report_customer->getTotalCustomerPackages($filter_data);

		$results = $this->model_report_customer->getCustomerPackages($filter_data);
/*
		foreach ($results as $result) {
			$comment = vsprintf($this->language->get('text_' . $result['key']), unserialize($result['data']));

			$find = array(
				'customer_id='
			);

			$replace = array(
				$this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id=', 'SSL')
			);

			$data['activities'][] = array(
				'comment'    => str_replace($find, $replace, $comment),
				'ip'         => $result['ip'],
				'date_added' => date($this->language->get('datetime_format'), strtotime($result['date_added']))
			);
		}
		*/
		$totalPackage = 0;
		foreach ($results as $result) {
			$totalPackage = $totalPackage + $result['money_invest'];
			$le = is_int($result['money_invest']+0)? 0:3;
			$nameParent = $this->model_report_customer->getNameParent($result['p_node']);
			$cmndParent = $this->model_report_customer->getCMNDParent($result['p_node']);
			if($result['date_end'] != null && $result['date_end'] != "0000-00-00 00:00:00"){
				$date_end = date($this->language->get('datetime_format'), strtotime($result['date_end']));
			}else{
				$date_end = '';
			}
			
			$ts1 = strtotime($result['date_added']);
			$ts2 = strtotime(date('d/m/Y'));
			
			$fromYear = date('Y', $ts1);
			$toYear = date('Y', $ts2);
			
			$fromMonth = date('m', $ts1);
			$toMonth = date('m', $ts2);
			
			if ($fromYear == $toYear) {
	            $diff = ($toMonth-$fromMonth);
	        } else {
	            $diff = (12-$fromMonth)+$toMonth;
	        }
	        
	        $deadline = $result['month_invest'] - $diff;
			
			$data['activities'][] = array(
					'url_customer'	=> $this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id='.$result['customer_id'], 'SSL'),
					'name_customer'    => $result['name_customer'],
					'cmnd'    => $result['cmnd'],
					'name_parent'	=> $nameParent,
					'cmnd_parent'	=> $cmndParent,
					'money_invest'    => number_format($result['money_invest'],$le,'.',','),
					'month_invest'	=> $result['month_invest'],
					'package_vn'	=> $result['package_vn'],
					'type_contract'	=> $result['type_contract'],
					'number_contract'	=> $result['number_contract'],
					'date_added' => date($this->language->get('datetime_format'), strtotime($result['date_added'])),
					'date_end' => $date_end,
					'deadline' => $deadline
				);
		}
		$data['totalPackage'] = $totalPackage;
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_comment'] = $this->language->get('column_comment');
		$data['column_ip'] = $this->language->get('column_ip');
		$data['column_date_added'] = $this->language->get('column_date_added');

		$data['entry_customer'] = $this->language->get('entry_customer');
		$data['entry_ip'] = $this->language->get('entry_ip');
		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		
		$data['entry_p_node'] = $this->language->get('column_p_node');
		$data['entry_date_added'] = $this->language->get('entry_date_added');
		$data['entry_package'] = $this->language->get('column_package');
		$data['entry_type_contract'] = $this->language->get('column_type_contract');
		$data['entry_month_invest'] = $this->language->get('column_month_invest');
		$data['entry_money_invest'] = $this->language->get('column_money_invest');

		$data['button_filter'] = $this->language->get('button_filter');

		$data['token'] = $this->session->data['token'];

		$url = '';

		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . urlencode($this->request->get['filter_customer']);
		}
/*
		if (isset($this->request->get['filter_ip'])) {
			$url .= '&filter_ip=' . $this->request->get['filter_ip'];
		}
*/
		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}
		
		if (isset($this->request->get['filter_area'])) {
			$url .= '&filter_area=' . $this->request->get['filter_area'];
		}

		$pagination = new Pagination();
		$pagination->total = $activity_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('report/customer_activity', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($activity_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($activity_total - $this->config->get('config_limit_admin'))) ? $activity_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $activity_total, ceil($activity_total / $this->config->get('config_limit_admin')));

		$data['filter_customer'] = $filter_customer;
	/*	$data['filter_ip'] = $filter_ip;
		*/
		$data['filter_date_start'] = $filter_date_start;
		$data['filter_date_end'] = $filter_date_end;
		$data['filter_area'] = $filter_area;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('report/customer_activity.tpl', $data));
	}
}