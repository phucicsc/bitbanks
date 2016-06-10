<?php
class ControllerAccountBalance extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/balance', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->load->language('account/balance');
		
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
		
		$this->document->setTitle($this->language->get('heading_title'));
		$data['text_datetime'] = $this->language->get('text_datetime');
		$data['text_amount'] = $this->language->get('text_amount');
		$data['text_description'] = $this->language->get('text_description');
		$data['text_fromuser'] = $this->language->get('text_fromuser');
		
		$data['text_total_profit'] = $this->language->get('text_total_profit');
		$data['text_total_commission'] = $this->language->get('text_total_commission');
		$data['text_total_gift'] = $this->language->get('text_total_gift');
		$data['text_total_payout'] = $this->language->get('text_total_payout');
		$data['text_total_balance'] = $this->language->get('text_total_balance');
		$data['text_money_invest'] = $this->language->get('text_money_invest');
		$data['entry_type_contract'] = $this->language->get('entry_type_contract');
		$data['entry_month_invest'] = $this->language->get('entry_month_invest');
		$data['entry_date_add'] = $this->language->get('entry_date_add');
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/balance', '', 'SSL')
		);
		/*
		if (isset($this->request->get['filter_start_date'])) {
			$filter_start_date = $this->request->get['filter_start_date'];
		} else {
			$filter_start_date= $this->config->get('config_start_date');
		}
		
		if (isset($this->request->get['filter_end_date'])) {
			$filter_end_date = $this->request->get['filter_end_date'];
		} else {
			$filter_end_date= $this->config->get('config_end_date');;
		}
		*/
		
		$filter_start_date= date('01-m-Y');
		$filter_end_date= date('d-m-Y', strtotime('last day of this month'));

		$data['heading_title'] = $this->language->get('heading_title');


		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		$this->load->model('account/customer');
		$this->load->model('account/profit');
		
		$data['has_package'] = false;
		if(isset($this->request->get['id_package'])){
			$id_package = $this->request->get['id_package'];
			$data['has_package'] = true;
			$list_balace = $this->model_account_profit->getListBalance($id_package,$filter_start_date,$filter_end_date);
	
			$data['list_balace'] = $list_balace;
			$packageInfo = $this->model_account_customer->getInfoPackages($id_package);
			$data['name_parent'] = $this->model_account_customer->getNameParent((int)$packageInfo['p_node']);
			$data['money_invest'] = $packageInfo['money_invest'];
			$data['month_invest'] = $packageInfo['month_invest'];
			$data['type_contract'] = $packageInfo['type_contract'];
			$data['date_added'] = date('d-m-Y',strtotime($packageInfo['date_added']));
			$data['total_profit'] = $this->model_account_profit->getProfitByType($id_package,'1');
			$data['total_commission'] = $this->model_account_profit->getProfitByType($id_package,'2');
			$data['total_gift'] = $this->model_account_profit->getProfitByType($id_package,'3');
			$data['total_payout'] = $this->model_account_profit->getProfitByType($id_package,'4');
			$data['total_balance'] = ( $data['total_profit'] + $data['total_commission'] + $data['total_gift']) - $data['total_payout'];
			$data['filter_start_date'] = $filter_start_date;
			$data['filter_end_date'] = $filter_end_date;
			$data['id_package'] = $id_package;
		}else{
			$list_balace = $this->model_account_profit->getListBalanceNotPackage($this->customer->getId(),$filter_start_date,$filter_end_date);
			$data['list_balace'] = $list_balace;
			$data['total_commission'] = $this->model_account_profit->getProfitByTypeNotPackage($this->customer->getId(),'2');
			$data['total_gift'] = $this->model_account_profit->getProfitByTypeNotPackage($this->customer->getId(),'3');
			$data['total_payout'] = $this->model_account_profit->getProfitByTypeNotPackage($this->customer->getId(),'4');
			$data['total_balance'] = ($data['total_commission'] + $data['total_gift']) - $data['total_payout'];
			$data['filter_start_date'] = $filter_start_date;
			$data['filter_end_date'] = $filter_end_date;
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/balance.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/balance.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/balance.tpl', $data));
		}
	}


}