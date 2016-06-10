<?php
class ControllerSaleCustomerOrderHitas extends Controller {
	private $error = array();
	
	public function index() {
		$this->language->load('sale/customer_order_hitas');
		
		$this->load->model('sale/customer_order_hitas');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$url = '';
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL')
		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('sale/customer_order_hitas', 'token=' . $this->session->data['token'] . $url, 'SSL')
   		);
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error'] = $this->error['warning'];
		
			unset($this->error['warning']);
		} else {
			$data['error'] = '';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}
        
        if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
            $data['filter_name'] = $this->request->get['filter_name']; //for template
		} else {
			$filter_name = null;
            $data['filter_name'] = ''; //for template
            
		}
        
       	if (isset($this->request->get['filter_date_added'])) {
		    $filter_date_added = $this->request->get['filter_date_added'];
            $data['filter_date_added'] = $this->request->get['filter_date_added']; //for template
		} else {
			$filter_date_added = null;
            $data['filter_date_added'] = ''; //for template
		}
        
        
        
		
		$url = '';
		
		$filter_data = array(
            'filter_name'       => $filter_name,
			'filter_date_added' => $filter_date_added,
			'page' => $page,
			'limit' => $this->config->get('config_limit_admin'),
			'start' => $this->config->get('config_limit_admin') * ($page - 1),
		);
		
		$total = $this->model_sale_customer_order_hitas->getTotalOrderHitas($filter_data);
		
		$pagination = new Pagination();
		$pagination->total = $total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total - $this->config->get('config_limit_admin'))) ? $total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total, ceil($total / $this->config->get('config_limit_admin')));

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['entry_date_added'] = $this->language->get('entry_date_added');
		$data['button_filter'] = $this->language->get('button_filter');
        $data['button_view_all_faq'] = $this->language->get('button_view_all_faq');        
		$data['text_title'] = $this->language->get('text_title');
		$data['text_question'] = $this->language->get('text_question');
        $data['text_answer'] = $this->language->get('text_answer');
		$data['text_date'] = $this->language->get('text_date');
		$data['text_action'] = $this->language->get('text_action');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		
		$data['button_add'] = $this->language->get('button_add');
		$data['button_delete'] = $this->language->get('button_delete');
		
        $data['token'] = $this->session->data['token'];
        
        
        
		$url = '';
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data['add'] = $this->url->link('sale/customer_order_hitas/insert', '&token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('sale/customer_order_hitas/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$data['all_cus_his'] = array();
		
		$all_cus_his = $this->model_sale_customer_order_hitas->getAllOrderHitas($filter_data);
		
		foreach ($all_cus_his as $cus_his) {
			$data['all_cus_his'][] = array (
				'order_cus_id' 			=> $cus_his['id'],
				'floor' 			=> $cus_his['floor'],
				'money_invest' 			=> $cus_his['money_invest'],
				'type_gift' 			=> $cus_his['type_gift'],
				'month_salary' 			=> $cus_his['month_salary'],
				'salary' 			=> $cus_his['salary'],
				'bonus_first' 			=> $cus_his['bonus_first'],
				'bonus_second' 			=> $cus_his['bonus_second'],
				'num_vtna' 			=> $cus_his['num_vtna'],
				'percent_manage' 			=> $cus_his['percent_manage'],
				'date_added' 		=> date($this->language->get('date_format_short'), strtotime($cus_his['date_added'])),
				'edit' 				=> $this->url->link('sale/customer_order_hitas/edit', 'order_cus_id=' . $cus_his['id'] . '&token=' . $this->session->data['token'] . $url, 'SSL')
			);
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('sale/customer_order_hitas_list.tpl', $data));	
	}
	
	public function edit() {
		$this->language->load('sale/customer_order_hitas');
		
		$this->load->model('sale/customer_order_hitas');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_sale_customer_order_hitas->editOrderHitas($this->request->get['order_cus_id'], $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->response->redirect($this->url->link('sale/customer_order_hitas', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->form();
	}
	
	public function insert() {
		$this->language->load('sale/customer_order_hitas');
		
		$this->load->model('sale/customer_order_hitas');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_sale_customer_order_hitas->addOrderHitas($this->request->post);
            
          		
			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->response->redirect($this->url->link('sale/customer_order_hitas', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->form();
	}
	
	protected function form() {
		$this->language->load('sale/customer_order_hitas');
		
		$this->load->model('sale/customer_order_hitas');
		
		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('sale/customer_order_hitas', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		if (isset($this->request->get['order_cus_id'])) {
			$data['action'] = $this->url->link('sale/customer_order_hitas/edit', '&order_cus_id=' . $this->request->get['order_cus_id'] . '&token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('sale/customer_order_hitas/insert', '&token=' . $this->session->data['token'], 'SSL');
		}
		
		$data['cancel'] = $this->url->link('sale/customer_order_hitas', '&token=' . $this->session->data['token'], 'SSL');
		
		$data['heading_title'] = $this->language->get('heading_title');
		
		
		$data['text_status'] = $this->language->get('text_status');
		$data['text_keyword'] = $this->language->get('text_keyword');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_browse'] = $this->language->get('text_browse');
		$data['text_clear'] = $this->language->get('text_clear');
	
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->error['warning'])) {
			$data['error'] = $this->error['warning'];
		} else {
			$data['error'] = '';
		}
		
		if (isset($this->request->get['order_cus_id'])) {
			$order_cus = $this->model_sale_customer_order_hitas->getOrderHitas($this->request->get['order_cus_id']);
			$data['money_invest'] = $order_cus['money_invest'];
			$data['floor'] = $order_cus['floor'];
			$data['percent_manage'] = $order_cus['percent_manage'];
			$data['bonus_first'] = $order_cus['bonus_first'];
			$data['bonus_second'] = $order_cus['bonus_second'];
			$data['num_vtna'] = $order_cus['num_vtna'];
			$data['salary'] = $order_cus['salary'];
			$data['month_salary'] = $order_cus['month_salary'];
			$data['type_gift'] = $order_cus['type_gift'];
			$data['date_added'] = $order_cus['date_added'];
		} else {
			$data['money_invest'] = '';
			$data['floor'] = '';
			$data['percent_manage'] = '';
			$data['bonus_first'] = '';
			$data['bonus_second'] = '';
			$data['num_vtna'] = '';
			$data['salary'] = '';
			$data['month_salary'] = '';
			$data['type_gift'] = '';
			$data['date_added'] = '';
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('sale/customer_order_hitas_form.tpl', $data));
	}
	
	public function delete() {
		$this->language->load('sale/customer_order_hitas');
		
		$this->load->model('sale/customer_order_hitas');

		$this->document->setTitle($this->language->get('heading_title'));
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $order_cus_id) {
				$this->model_sale_customer_order_hitas->deleteOrderHitas($order_cus_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');
		}
		
		$this->response->redirect($this->url->link('sale/customer_order_hitas', 'token=' . $this->session->data['token'], 'SSL'));
	}
	
	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'sale/customer_order_hitas')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
 
		if (!$this->error) {
			return true; 
		} else {
			return false;
		}
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'sale/customer_order_hitas')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}