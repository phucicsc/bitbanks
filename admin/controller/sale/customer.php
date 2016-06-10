<?php
class ControllerSaleCustomer extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');

		$this->getList();
	}
	
	public function OffUser12Thang() {
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');

		$json = array();
		if ($this->request->server['REQUEST_METHOD'] == 'POST'){
			$this->model_sale_customer->OffUser12Thang();
			$json['success'] = $this->language->get('Thành công : Off hội viên hoạt động đủ 12 tháng ');
		}else{
			$json['success'] = $this->language->get('Thất bại : Off hội viên hoạt động đủ 12 tháng ');
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	public function makeHPDuKien() {
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');

		$json = array();
		if ($this->request->server['REQUEST_METHOD'] == 'POST'){
			$this->model_sale_customer->makeHPDuKien();
			$json['success'] = $this->language->get('Thành công : tính hội phí dự kiến ');
		}else{
			$json['success'] = $this->language->get('Thất bại : tính hội phí dự kiến ');
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	/*
	public function makeHPFromCTP() {
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');

		$json = array();
		if ($this->request->server['REQUEST_METHOD'] == 'POST'){
			$this->model_sale_customer->makeHPFromCTP();
			$json['success'] = $this->language->get('Thành công : tính hội phí từ công tác phí');
		}else{
			$json['success'] = $this->language->get('Thất bại : tính hội phí từ công tác phí');
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	*/
	
	public function offUser() {
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');

		$json = array();
		if ($this->request->server['REQUEST_METHOD'] == 'POST'){
			$this->model_sale_customer->checkOffUser();
			$json['success'] = $this->language->get('Thành công : off các hội viên chưa đóng phí');
		}else{
			$json['success'] = $this->language->get('Thất bại : off các hội viên chưa đóng phí');
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function deleteAllProfit() {

		$this->load->model('sale/customer');

		$json = array();
		if ($this->request->server['REQUEST_METHOD'] == 'POST'){
			$this->model_sale_customer->deleteAllProfit();
			$json['success'] = $this->language->get('Thành công : Xóa dữ liệu lợi nhuận, hoa hồng, tặng thưởng và thanh toán');
		}else{
			$json['success'] = $this->language->get('Thất bại : Xóa dữ liệu lợi nhuận, hoa hồng, tặng thưởng và thanh toán');
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function profit() {
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');

		$json = array();
		if ($this->request->server['REQUEST_METHOD'] == 'POST'){
			$this->model_sale_customer->makeProfitAllUser($this->request->post['date_start'],$this->request->post['date_end']);
			$json['success'] = $this->language->get('Thành công : Tính lợi nhuận cho các hội viên');
		}else{
			$json['success'] = $this->language->get('Thất bại : Tính lợi nhuận cho các hội viên');
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function commission() {
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');
		$json = array();
		if ($this->request->server['REQUEST_METHOD'] == 'POST'){
			$this->model_sale_customer->makeCommissionAllUser($this->request->post['date_start'],$this->request->post['date_end']);
			$json['success'] = $this->language->get('Thành công : Tính hoa hồng cho các hội viên');
		}else{
			$json['success'] = $this->language->get('Thất bại : Tính hoa hồng cho các hội viên');
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	

	public function add() {
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) { // && $this->validateForm()
			$this->model_sale_customer->addCustomer($this->request->post);

			if(utf8_strlen($this->request->post['email']) > 0){
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
	
				$mail->setTo($this->request->post['email']);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender("5fcapital");
				$mail->setSubject("Thông tin đăng ký tài khoản tại website giupdocongdong.com.vn");
				$mail->setText("Xin chào ".$this->request->post['lastname'].' '.$this->request->post['firstname']."\n\n Bạn đã được đăng ký tài khoản tại websiste giupdocongdong.com.vn\n\n Bạn có thể đăng nhập vào tài khoản của mình tại website giupdocongdong.com.vn với thông tin đăng nhập như sau: \n\n Tên đăng nhâp:".$this->request->post['username'] ."\n\nMật khẩu: ".$this->request->post['password']);
				$mail->send();
				$this->session->data['success'] = $this->language->get('text_success').' Mail xác nhận đã được gửi tới hội viên của bạn';
			}else{
				$this->session->data['success'] = $this->language->get('text_success');
			}
			

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}


			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		
		}

		$this->getForm();
	}
	public function editpin() {
		$this->load->model('sale/customer');	
		if (isset($this->request->post['submit'])){
			$pin_old= $this->model_sale_customer->getPin($this->request->get['customer_id']);
			$pin =$this->request->post['pin'];
			if ($pin > 0) {				
				$pinadd ="+ ".$pin;
			}else{
				$pinadd = " ".$pin;
			}	

			$this->model_sale_customer->update_pin($pin, $this->request->get['customer_id']);
			$abc=$this->model_sale_customer->update_amount((string)$pinadd, $this->request->get['customer_id']);					
			$this->session->data['success'] = $this->language->get('update success');
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			$this->response->redirect($this->url->link('sale/customer/', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}		
	}
	public function editcwallet() {
		$this->load->model('sale/customer');	
		if (isset($this->request->post['submit'])){
			$pin_old= $this->model_sale_customer->getPin($this->request->get['customer_id']);
			$amount =$this->request->post['amount'];
			//echo "<pre>"; print_r($this->request); echo "</pre>"; die();
			//$this->model_sale_customer->getR_Wallet($pin, $this->request->get['customer_id']);
			$this->model_sale_customer->update_C_Wallet($amount, $this->request->get['customer_id']);					
			$this->session->data['success'] = $this->language->get('update success');
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			$this->response->redirect($this->url->link('sale/customer/', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}		
	}
	public function editrwallet() {
		$this->load->model('sale/customer');	
		if (isset($this->request->post['submit'])){
			$pin_old= $this->model_sale_customer->getPin($this->request->get['customer_id']);
			$amount =$this->request->post['amount'];
			//echo "<pre>"; print_r($this->request); echo "</pre>"; die();
			//$this->model_sale_customer->getR_Wallet($pin, $this->request->get['customer_id']);
			$this->model_sale_customer->update_R_Wallet($amount, $this->request->get['customer_id']);					
			$this->session->data['success'] = $this->language->get('update success');
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			$this->response->redirect($this->url->link('sale/customer/', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}		
	}
	public function editlevel() {
		$this->load->model('sale/customer');	
		if (isset($this->request->post['submit'])){
			$level =$this->request->post['level'];
			if( is_numeric($level) && intval($level) !== 0 && $level > 0 ){
				$json['level'] = 1;
			}else{
				$json['level'] = -1;
			}
			if($json['level'] === 1 ){
				$this->model_sale_customer->update_level($level, $this->request->get['customer_id']);
				$this->session->data['success'] = $this->language->get('update success');
				$this->response->redirect($this->url->link('sale/customer/', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			}else{
				die('error sever');
			}
		}		
	}

	public function edit() {

		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');
	
		//$data'name_parent'  	 => $this->model_sale_customer->getNameParent($result['p_node']),
		$this->document->addScript('http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js');
		$this->document->addScript('view/javascript/validatecustomerform.js');
		
	//
		if (($this->request->server['REQUEST_METHOD'] == 'POST') ) {
			
			$this->model_sale_customer->update_status($this->request->post['status'], $this->request->get['customer_id']);
			$this->model_sale_customer->editCustomer($this->request->get['customer_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}


			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}


			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $customer_id) {
				$this->model_sale_customer->deleteCustomer($customer_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_customer_group_id'])) {
				$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_approved'])) {
				$url .= '&filter_approved=' . $this->request->get['filter_approved'];
			}

			if (isset($this->request->get['filter_ip'])) {
				$url .= '&filter_ip=' . $this->request->get['filter_ip'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function approve() {
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');

		$customers = array();

		if (isset($this->request->post['selected'])) {
			$customers = $this->request->post['selected'];
		} elseif (isset($this->request->get['customer_id'])) {
			$customers[] = $this->request->get['customer_id'];
		}

		if ($customers && $this->validateApprove()) {
			$this->model_sale_customer->approve($this->request->get['customer_id']);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_customer_group_id'])) {
				$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_approved'])) {
				$url .= '&filter_approved=' . $this->request->get['filter_approved'];
			}

			if (isset($this->request->get['filter_ip'])) {
				$url .= '&filter_ip=' . $this->request->get['filter_ip'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function unlock() {
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');

		if (isset($this->request->get['email']) && $this->validateUnlock()) {
			$this->model_sale_customer->deleteLoginAttempts($this->request->get['email']);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_customer_group_id'])) {
				$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_approved'])) {
				$url .= '&filter_approved=' . $this->request->get['filter_approved'];
			}

			if (isset($this->request->get['filter_ip'])) {
				$url .= '&filter_ip=' . $this->request->get['filter_ip'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}

		if (isset($this->request->get['filter_username'])) {
			$filter_username = $this->request->get['filter_username'];
		} else {
			$filter_username = null;
		}
		
		if (isset($this->request->get['filter_customer_code'])) {
			$filter_customer_code = $this->request->get['filter_customer_code'];
		} else {
			$filter_customer_code = null;
		}
		
		if (isset($this->request->get['filter_email'])) {
			$filter_email = $this->request->get['filter_email'];
		} else {
			$filter_email = null;
		}

		if (isset($this->request->get['filter_phone'])) {
			$filter_phone = $this->request->get['filter_phone'];
		} else {
			$filter_phone = null;
		}

		if (isset($this->request->get['filter_customer_group_id'])) {
			$filter_customer_group_id = $this->request->get['filter_customer_group_id'];
		} else {
			$filter_customer_group_id = null;
		}

		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}

		if (isset($this->request->get['filter_approved'])) {
			$filter_approved = $this->request->get['filter_approved'];
		} else {
			$filter_approved = null;
		}

		if (isset($this->request->get['filter_ip'])) {
			$filter_ip = $this->request->get['filter_ip'];
		} else {
			$filter_ip = null;
		}

		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = ' CONVERT(c.username, DECIMAL) ';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_username'])) {
			$url .= '&filter_username=' . urlencode(html_entity_decode($this->request->get['filter_username'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_customer_code'])) {
			$url .= '&filter_customer_code=' . urlencode(html_entity_decode($this->request->get['filter_customer_code'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_phone'])) {
			$url .= '&filter_phone=' . urlencode(html_entity_decode($this->request->get['filter_phone'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_customer_group_id'])) {
			$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_approved'])) {
			$url .= '&filter_approved=' . $this->request->get['filter_approved'];
		}

		if (isset($this->request->get['filter_ip'])) {
			$url .= '&filter_ip=' . $this->request->get['filter_ip'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);
		
		$data['add'] = $this->url->link('sale/customer/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('sale/customer/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['customers'] = array();
		$filter_data = array(
			'filter_name'              => $filter_name,
			'filter_email'             => $filter_email,
			'filter_username'          => $filter_username,
			'filter_customer_code'     => $filter_customer_code,
			'filter_phone'             => $filter_phone,
			'filter_customer_group_id' => $filter_customer_group_id,
			'filter_status'            => $filter_status,
			'filter_approved'          => $filter_approved,
			'filter_date_added'        => $filter_date_added,
			'filter_ip'                => $filter_ip,
			'sort'                     => $sort,
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
		);

		$customer_total = $this->model_sale_customer->getTotalCustomers($filter_data);

		$results = $this->model_sale_customer->getCustomers($filter_data);
		//$all_hoivien_phi = 0;
		//$all_congtac_phi = 0;
		//$all_total_payout = 0;
		$date = strtotime(date('Y-m-d'));
		$monthNow = date('m',$date);
		$yearNow = date('Y',$date);
		foreach ($results as $result) {
			$hvNew = false;
			$date_added = strtotime($result['date_added']);
			$month = date('m',$date_added);
			$year = date('Y',$date_added);
			if($monthNow == $month && $yearNow == $year){
				$hvNew = true;
			}
		//	$total_hoivien_phi = $this->model_sale_customer->getAllProfitByType($result['customer_id'],'1');
		//	$total_congtac_phi = $this->model_sale_customer->getAllProfitByType($result['customer_id'],'2');
		//	$total_payout = $this->model_sale_customer->getAllProfitByType($result['customer_id'],'3');
			
		//	$all_hoivien_phi = $all_hoivien_phi + $total_hoivien_phi;
		//	$all_congtac_phi = $all_congtac_phi + $total_congtac_phi;
		//	$all_total_payout = $all_total_payout + $total_payout;
			$data['customers'][] = array(
				'customer_id'    => $result['customer_id'],
				'name'           => $result['name'],
				'username'       => $result['username'],
				'customer_code'  => $result['customer_code'],
				'name_parent'  	 => $this->model_sale_customer->getNameParent($result['p_node']),						
				'telephone'      => $result['telephone'],
				'address'      => $result['address_cus'],
				'country_id'	=> $result['country_id'],
				'name_country'  	 => $this->model_sale_customer->getCountryId($result['country_id']),
				'email'          => $result['email'],

				'hvOff'			 => $result['status'],
				'hvNew'			 => $hvNew,
				'status'         => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'ip'             => $result['ip'],
				'date_birth'     => date($this->language->get('date_format_short'), strtotime($result['date_birth'])),
		//		'total_hoivien_phi'   => $total_hoivien_phi,
		//		'total_congtac_phi' => $total_congtac_phi,
		//		'total_payout'     => $total_payout,
				'edit'           => $this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id=' . $result['customer_id'] . $url, 'SSL')
			);


		}
	//	$data['all_total_profit'] = $all_hoivien_phi;
	//	$data['all_total_commission'] = $all_congtac_phi;
	//	$data['all_total_payout'] = $all_total_payout;
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_email'] = $this->language->get('column_email');
		
		$data['column_package'] = $this->language->get('column_package');
		$data['column_p_node'] = $this->language->get('column_p_node');
		$data['column_type_contract'] = $this->language->get('column_type_contract');
		$data['column_month_invest'] = $this->language->get('column_month_invest');
		$data['column_money_invest'] = $this->language->get('column_money_invest');
		
		$data['column_total_profit'] = $this->language->get('column_total_profit');
		$data['column_total_commission'] = $this->language->get('column_total_commission');
		$data['column_total_gift'] = $this->language->get('column_total_gift');
		$data['column_total_payout'] = $this->language->get('column_total_payout');
		$data['column_total_balance'] = $this->language->get('column_total_balance');
		
		$data['column_customer_group'] = $this->language->get('column_customer_group');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_approved'] = $this->language->get('column_approved');
		$data['column_ip'] = $this->language->get('column_ip');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_approved'] = $this->language->get('entry_approved');
		$data['entry_ip'] = $this->language->get('entry_ip');
		$data['entry_date_added'] = $this->language->get('entry_date_added');

		$data['button_approve'] = $this->language->get('button_approve');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_login'] = $this->language->get('button_login');
		$data['button_unlock'] = $this->language->get('button_unlock');

		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_username'])) {
			$url .= '&filter_username=' . urlencode(html_entity_decode($this->request->get['filter_username'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_phone'])) {
			$url .= '&filter_phone=' . urlencode(html_entity_decode($this->request->get['filter_phone'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_customer_group_id'])) {
			$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_approved'])) {
			$url .= '&filter_approved=' . $this->request->get['filter_approved'];
		}

		if (isset($this->request->get['filter_ip'])) {
			$url .= '&filter_ip=' . $this->request->get['filter_ip'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$data['sort_email'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=c.email' . $url, 'SSL');
		$data['sort_customer_group'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=customer_group' . $url, 'SSL');
		$data['sort_status'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=c.status' . $url, 'SSL');
		$data['sort_ip'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=c.ip' . $url, 'SSL');
		$data['sort_date_added'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=c.date_added' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['filter_username'])) {
			$url .= '&filter_username=' . urlencode(html_entity_decode($this->request->get['filter_username'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_phone'])) {
			$url .= '&filter_phone=' . urlencode(html_entity_decode($this->request->get['filter_phone'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_customer_group_id'])) {
			$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_approved'])) {
			$url .= '&filter_approved=' . $this->request->get['filter_approved'];
		}

		if (isset($this->request->get['filter_ip'])) {
			$url .= '&filter_ip=' . $this->request->get['filter_ip'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $customer_total;

		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($customer_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($customer_total - $this->config->get('config_limit_admin'))) ? $customer_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $customer_total, ceil($customer_total / $this->config->get('config_limit_admin')));

		$data['filter_name'] = $filter_name;
		$data['filter_email'] = $filter_email;
		$data['filter_username'] = $filter_username;
		$data['filter_customer_code'] = $filter_customer_code;
		$data['filter_phone'] = $filter_phone;
		$data['filter_customer_group_id'] = $filter_customer_group_id;
		$data['filter_status'] = $filter_status;
		$data['filter_approved'] = $filter_approved;
		$data['filter_ip'] = $filter_ip;
		$data['filter_date_added'] = $filter_date_added;
		$data['month_filter'] = '';
		$data['type_filter'] = '';
		$data['year_filter'] = '';
		
		$this->load->model('sale/customer_group');

		$data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();

		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['getGroupId'] = $this->user->getGroupId();
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('sale/customer_list.tpl', $data));
	}

	protected function getForm() {
		$this->load->model('tool/image');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['customer_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_loading'] = $this->language->get('text_loading');
		$data['text_add_ban_ip'] = $this->language->get('text_add_ban_ip');
		$data['text_remove_ban_ip'] = $this->language->get('text_remove_ban_ip');

		$data['entry_package'] = $this->language->get('column_package');
		$data['entry_p_node'] = $this->language->get('column_p_node');
		$data['entry_type_contract'] = $this->language->get('column_type_contract');
		$data['entry_month_invest'] = $this->language->get('column_month_invest');
		$data['entry_money_invest'] = $this->language->get('column_money_invest');
		
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_fax'] = $this->language->get('entry_fax');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_confirm'] = $this->language->get('entry_confirm');
		$data['entry_newsletter'] = $this->language->get('entry_newsletter');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_approved'] = $this->language->get('entry_approved');
		$data['entry_safe'] = $this->language->get('entry_safe');
		$data['entry_company'] = $this->language->get('entry_company');
		$data['entry_address_1'] = $this->language->get('entry_address_1');
		$data['entry_address_2'] = $this->language->get('entry_address_2');
		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_postcode'] = $this->language->get('entry_postcode');
		$data['entry_zone'] = $this->language->get('entry_zone');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_default'] = $this->language->get('entry_default');
		$data['entry_comment'] = $this->language->get('entry_comment');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_amount'] = $this->language->get('entry_amount');
		$data['entry_points'] = $this->language->get('entry_points');
		$data['entry_date_added'] = $this->language->get('entry_date_added');
		
		$data['entry_account_bank'] = $this->language->get('entry_account_bank');
		$data['entry_address_bank'] = $this->language->get('entry_address_bank');
		$data['entry_wallet'] = $this->language->get('entry_wallet');

		$data['help_safe'] = $this->language->get('help_safe');
		$data['help_points'] = $this->language->get('help_points');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_address_add'] = $this->language->get('button_address_add');
		$data['button_history_add'] = $this->language->get('button_history_add');
		$data['button_package_add'] = $this->language->get('button_package_add');
		$data['button_transaction_add'] = $this->language->get('button_transaction_add');
		$data['button_reward_add'] = $this->language->get('button_reward_add');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_upload'] = $this->language->get('button_upload');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_address'] = $this->language->get('tab_address');
		$data['tab_history'] = $this->language->get('tab_history');
		$data['tab_package'] = $this->language->get('tab_package');
		$data['tab_transaction'] = $this->language->get('tab_transaction');
		$data['tab_reward'] = $this->language->get('tab_reward');
		$data['tab_ip'] = $this->language->get('tab_ip');

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->get['customer_id'])) {
			$data['customer_id'] = $this->request->get['customer_id'];
		} else {
			$data['customer_id'] = 0;
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['p_node'])) {
			$data['error_p_node'] = $this->error['p_node'];
		} else {
			$data['error_p_node'] = '';
		}
		
		if (isset($this->error['username'])) {
			$data['error_username'] = $this->error['username'];
		} else {
			$data['error_username'] = '';
		}
		
		if (isset($this->error['customer_code'])) {
			$data['error_customer_code'] = $this->error['customer_code'];
		} else {
			$data['error_customer_code'] = '';
		}
		

		if (isset($this->error['firstname'])) {
			$data['error_firstname'] = $this->error['firstname'];
		} else {
			$data['error_firstname'] = '';
		}

		if (isset($this->error['lastname'])) {
			$data['error_lastname'] = $this->error['lastname'];
		} else {
			$data['error_lastname'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}
		
		if (isset($this->error['date_birth'])) {
			$data['error_date_birth'] = $this->error['date_birth'];
		} else {
			$data['error_date_birth'] = '';
		}

		if (isset($this->error['telephone'])) {
			$data['error_telephone'] = $this->error['telephone'];
		} else {
			$data['error_telephone'] = '';
		}
		
	if (isset($this->error['cmnd'])) {
			$data['error_cmnd'] = $this->error['cmnd'];
		} else {
			$data['error_cmnd'] = '';
		}

	if (isset($this->error['account_bank'])) {
			$data['error_account_bank'] = $this->error['account_bank'];
		} else {
			$data['error_account_bank'] = '';
		}
	if (isset($this->error['address_bank'])) {
			$data['error_address_bank'] = $this->error['address_bank'];
		} else {
			$data['error_address_bank'] = '';
		}
			if (isset($this->error['wallet'])) {
			$data['error_wallet'] = $this->error['wallet'];
		} else {
			$data['error_wallet'] = '';
		}

		if (isset($this->error['password'])) {
			$data['error_password'] = $this->error['password'];
		} else {
			$data['error_password'] = '';
		}

		if (isset($this->error['confirm'])) {
			$data['error_confirm'] = $this->error['confirm'];
		} else {
			$data['error_confirm'] = '';
		}

		if (isset($this->error['custom_field'])) {
			$data['error_custom_field'] = $this->error['custom_field'];
		} else {
			$data['error_custom_field'] = array();
		}

		if (isset($this->error['address'])) {
			$data['error_address'] = $this->error['address'];
		} else {
			$data['error_address'] = array();
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}


		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_approved'])) {
			$url .= '&filter_approved=' . $this->request->get['filter_approved'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		if (!isset($this->request->get['customer_id'])) {
			$data['action'] = $this->url->link('sale/customer/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id=' . $this->request->get['customer_id'] . $url, 'SSL');
		}
		$data['actions'] = $this->url->link('sale/customer/editpin', 'token=' . $this->session->data['token'] . '&customer_id=' . $this->request->get['customer_id'] . $url, 'SSL');
		$data['actionscwallet'] = $this->url->link('sale/customer/editcwallet', 'token=' . $this->session->data['token'] . '&customer_id=' . $this->request->get['customer_id'] . $url, 'SSL');
		$data['actionsrwallet'] = $this->url->link('sale/customer/editrwallet', 'token=' . $this->session->data['token'] . '&customer_id=' . $this->request->get['customer_id'] . $url, 'SSL');
				
		$data['actionlevel'] = $this->url->link('sale/customer/editlevel', 'token=' . $this->session->data['token'] . '&customer_id=' . $this->request->get['customer_id'] . $url, 'SSL');
		$data['cancel'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['numHP'] = 0;
		$data['listHp'] = array();
		$data['listCTP'] = array();
		if (isset($this->request->get['customer_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$customer_info = $this->model_sale_customer->getCustomer($this->request->get['customer_id']);
			$data['country'] = $this ->model_sale_customer-> getCountry();
			$data['country_id'] = $customer_info['country_id'];
			
			$numHP = $this->model_sale_customer->countProfitByType($this->request->get['customer_id'],1);
			$data['numHP'] = $numHP;
			
			$resultsHp = $this->model_sale_customer->getAllTransactionsProfit($this->request->get['customer_id'],1);
			foreach ($resultsHp as $result) {
				$data['listHp'][] = array(
					'amount'      => $result['receive'],
					'description' => $result['description'],
					'date_added'  => date($this->language->get('date_format_short'),$result['date'] )
				);
			}
			
			$listCTP = $this->model_sale_customer->getListCTP($this->request->get['customer_id']);
			$data['listCTP'] = $listCTP;
		}
		$data['country'] = $this ->model_sale_customer-> getCountry();
		
		$data['memberLevels'] = $this->model_sale_customer->getListMemberLevel();

				
		$customerListCustomer = $this->model_sale_customer->getListCustomers();
		
		$numCus = count($customerListCustomer);
		$nextcus = $numCus+1;

		
		
		if (isset($this->request->post['customer_code'])) {
			$data['customer_code'] = $this->request->post['customer_code'];
		} elseif (!empty($customer_info)) {
			$data['customer_code'] = $customer_info['customer_code'];
		} else {
			$customer_code = 'HV';
			$numFor = 6 - strlen($nextcus);
			if($numFor>0){
				for($n=0;$n<$numFor;$n++){
					$customer_code .= '0';
				}
			}
			$customer_code .=  $nextcus;
			$data['customer_code'] = $customer_code;
		}
		if (isset($this->request->post['username'])) {
			$data['username'] = $this->request->post['username'];
		} elseif (!empty($customer_info)) {
			$data['username'] = $customer_info['username'];
		} else {
			$data['username'] = '';
		}

		// if (isset($this->request->post['level'])) {
		// 	$data['level'] = $this->request->post['level'];
		// } elseif (!empty($customer_info)) {
		// 	$data['level'] = $customer_info['level'];
		// } else {
		// 	$data['level'] = '';
		// }

		if (isset($this->request->post['firstname'])) {
			$data['firstname'] = $this->request->post['firstname'];
		} elseif (!empty($customer_info)) {
			$data['firstname'] = $customer_info['firstname'];
		} else {
			$data['firstname'] = '';
		}
			if (isset($this->request->post['country_id'])) {
			$data['country_id'] = $this->request->post['country_id'];
		} elseif (!empty($customer_info)) {
			$data['country_id'] = $customer_info['country_id'];
		} else {
			$data['country_id'] = '';
		}

		if (isset($this->request->post['lastname'])) {
			$data['lastname'] = $this->request->post['lastname'];
		} elseif (!empty($customer_info)) {
			$data['lastname'] = $customer_info['lastname'];
		} else {
			$data['lastname'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif (!empty($customer_info)) {
			$data['email'] = $customer_info['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['telephone'])) {
			$data['telephone'] = $this->request->post['telephone'];
		} elseif (!empty($customer_info)) {
			$data['telephone'] = $customer_info['telephone'];
		} else {
			$data['telephone'] = '';
		}
		
			
		

		if (isset($this->request->post['fax'])) {
			$data['fax'] = $this->request->post['fax'];
		} elseif (!empty($customer_info)) {
			$data['fax'] = $customer_info['fax'];
		} else {
			$data['fax'] = '';
		}
		
		if (isset($this->request->post['ma_thue'])) {
			$data['ma_thue'] = $this->request->post['ma_thue'];
		} elseif (!empty($customer_info)) {
			$data['ma_thue'] = $customer_info['ma_thue'];
		} else {
			$data['ma_thue'] = '';
		}
		
	if (isset($this->request->post['cmnd'])) {
			$data['cmnd'] = $this->request->post['cmnd'];
		} elseif (!empty($customer_info)) {
			$data['cmnd'] = $customer_info['cmnd'];
		} else {
			$data['cmnd'] = '';
		}
		
	if (isset($this->request->post['account_bank'])) {
			$data['account_bank'] = $this->request->post['account_bank'];
		} elseif (!empty($customer_info)) {
			$data['account_bank'] = $customer_info['account_bank'];
		} else {
			$data['account_bank'] = '';
		}
		
		if (isset($this->request->post['address_bank'])) {
			$data['address_bank'] = $this->request->post['address_bank'];
		} elseif (!empty($customer_info)) {
			$data['address_bank'] = $customer_info['address_bank'];
		} else {
			$data['address_bank'] = '';
		}
		if (isset($this->request->post['wallet'])) {
			$data['wallet'] = $this->request->post['wallet'];
		} elseif (!empty($customer_info)) {
			$data['wallet'] = $customer_info['wallet'];
		} else {
			$data['wallet'] = '';
		}
		
		if (isset($this->request->post['address_cus'])) {
			$data['address_cmnd'] = $this->request->post['address_cmnd'];
		} elseif (!empty($customer_info)) {
			$data['address_cmnd'] = $customer_info['address_cmnd'];
		} else {
			$data['address_cmnd'] = '';
		}
		
		if (isset($this->request->post['address_cus'])) {
			$data['address_cus'] = $this->request->post['address_cus'];
		} elseif (!empty($customer_info)) {
			$data['address_cus'] = $customer_info['address_cus'];
		} else {
			$data['address_cus'] = '';
		}
		
		if (isset($this->request->post[''])) {
			$data['note'] = $this->request->post['note'];
		} elseif (!empty($customer_info)) {
			$data['note'] = $customer_info['note'];
		} else {
			$data['note'] = '';
		}
		
		$data['hv_phi'] = $this->config->get('config_hoiphi');
		
		if (isset($this->request->post['img_profile'])) {
			$data['img_profile'] = $this->request->post['img_profile'];
		} elseif (!empty($customer_info)) {
			$data['img_profile'] = $customer_info['img_profile'];
		} else {
			$data['img_profile'] = '';
		}
		
		if (isset($this->request->post['img_profile']) && is_file(DIR_IMAGE . $this->request->post['img_profile'])) {
			$data['img_pro'] = $this->model_tool_image->resize($this->request->post['img_profile'], 100, 100);
		}elseif (!empty($customer_info) && is_file(DIR_IMAGE . $customer_info['img_profile'])) {
			$data['img_pro'] = $this->model_tool_image->resize($customer_info['img_profile'], 100, 100);
		} else {
			$data['img_pro'] = $this->model_tool_image->resize('catalog/logo.png', 100, 100);
		}
		
		
		$data['no_img_pro'] = $this->model_tool_image->resize('catalog/logo.png', 100, 100);
		
		if (isset($this->request->post['date_birth'])) {
			$data['date_birth'] = $this->request->post['date_birth'];
		} elseif (!empty($customer_info)) {
			$data['date_birth'] = date($this->language->get('date_format_short'), strtotime($customer_info['date_birth']));
		} else {
			$data['date_birth'] = '';
		}
		
		if (isset($this->request->post['date_cmnd'])) {
			$data['date_cmnd'] = $this->request->post['date_cmnd'];
		} elseif (!empty($customer_info)) {
			$data['date_cmnd'] = date($this->language->get('date_format_short'), strtotime($customer_info['date_cmnd']));
		} else {
			$data['date_cmnd'] = '';
		}
		
		if (isset($this->request->post['date_create'])) {
			$data['date_create'] = $this->request->post['date_create'];
		} elseif (!empty($customer_info)) {
			$data['date_create'] = date($this->language->get('date_format_short'), strtotime($customer_info['date_added']));
		} else {
			$data['date_create'] = date('d/m/Y');
		}
		
		if (isset($this->request->post['p_node_cus'])) {
			$data['p_node_cus'] = $this->request->post['p_node_cus'];
		} elseif (!empty($customer_info) && $customer_info['p_node'] != 0) {
			$data['p_node_cus'] = $this->model_sale_customer->getFullNameParent($customer_info['p_node']);
		} else {
			$data['p_node_cus'] = '';
		}
		
		if (isset($this->request->post['p_node'])) {
			$data['p_node'] = $this->request->post['p_node'];
		} elseif (!empty($customer_info)) {
			$data['p_node'] = $customer_info['p_node'];
		} else {
			$data['p_node'] = '';
		}

		// Custom Fields
		$this->load->model('sale/custom_field');

		$data['custom_fields'] = array();

		$filter_data = array(
			'sort'  => 'cf.sort_order',
			'order' => 'ASC'
		);

		$custom_fields = $this->model_sale_custom_field->getCustomFields($filter_data);
		$this->load->model('sale/customer');
		
		$id_ = $this -> request -> get['customer_id'];

		

		$data['pnode']= $this->model_sale_customer->getPnode($id_);
		
	//	$data['nameParrent']= $this->model_sale_customer->getNameparrent($data['pnode']);
		$data['name_parrent'] = $this->model_sale_customer->getNameParent($data['pnode']);	
		foreach ($custom_fields as $custom_field) {
			$data['custom_fields'][] = array(
				'custom_field_id'    => $custom_field['custom_field_id'],
				'custom_field_value' => $this->model_sale_custom_field->getCustomFieldValues($custom_field['custom_field_id']),
				'name'               => $custom_field['name'],
				'value'              => $custom_field['value'],
				'type'               => $custom_field['type'],
				'location'           => $custom_field['location'],
				'sort_order'         => $custom_field['sort_order']
			);
		}
		
		if (isset($this->request->post['custom_field'])) {
			$data['account_custom_field'] = $this->request->post['custom_field'];
		} elseif (!empty($customer_info)) {
			$data['account_custom_field'] = unserialize($customer_info['custom_field']);
		} else {
			$data['account_custom_field'] = array();
		}

		if (isset($this->request->post['newsletter'])) {
			$data['newsletter'] = $this->request->post['newsletter'];
		} elseif (!empty($customer_info)) {
			$data['newsletter'] = $customer_info['newsletter'];
		} else {
			$data['newsletter'] = '';
		}

		$data['disableStatus'] = false;
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($customer_info)) {
			$data['status'] = $customer_info['status'];
			if(($customer_info['status'] == 0)|| $customer_info['status'] == 1){
				$data['disableStatus'] = true;
			}
		} else {
			$data['status'] = true;
		}
		
		

		if (isset($this->request->post['approved'])) {
			$data['approved'] = $this->request->post['approved'];
		} elseif (!empty($customer_info)) {
			$data['approved'] = $customer_info['approved'];
		} else {
			$data['approved'] = true;
		}

		if (isset($this->request->post['safe'])) {
			$data['safe'] = $this->request->post['safe'];
		} elseif (!empty($customer_info)) {
			$data['safe'] = $customer_info['safe'];
		} else {
			$data['safe'] = 0;
		}

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}
		if (isset($this->request->post['transaction_password'])) {
			$data['transaction_password'] = $this->request->post['transaction_password'];
		} else {
			$data['transaction_password'] = '';
		}

		if (isset($this->request->post['confirm'])) {
			$data['confirm'] = $this->request->post['confirm'];
		} else {
			$data['confirm'] = '';
		}

		$this->load->model('localisation/country');

		$data['countries'] = $this->model_localisation_country->getCountries();

		if (isset($this->request->post['address'])) {
			$data['addresses'] = $this->request->post['address'];
		} elseif (isset($this->request->get['customer_id'])) {
			$data['addresses'] = $this->model_sale_customer->getAddresses($this->request->get['customer_id']);
		} else {
			$data['addresses'] = array();
		}

		if (isset($this->request->post['address_id'])) {
			$data['address_id'] = $this->request->post['address_id'];
		} elseif (!empty($customer_info)) {
			$data['address_id'] = $customer_info['address_id'];
		} else {
			$data['address_id'] = '';
		}
		
		$data['pin'] = $customer_info['ping'];
		$data['level'] = $customer_info['level'];

		//check if not empty in table sm_customer_r_wallet
		$this -> load -> model('sale/customer');

		$checkR_Wallet = $this -> model_sale_customer -> checkR_Wallet(intval($this -> request -> get['customer_id']));
		if(intval($checkR_Wallet['number'])  === 0){
			$this -> model_sale_customer -> insertR_Wallet(intval($this -> request -> get['customer_id'])) === false && die('error sever');
		}

		$checkC_Wallet = $this -> model_sale_customer -> checkC_Wallet(intval($this -> request -> get['customer_id']));
		if(intval($checkC_Wallet['number'])  === 0){
			$this -> model_sale_customer -> insertC_Wallet(intval($this -> request -> get['customer_id'])) === false && die('error sever');
		}

		$data['cwallet'] = $this->model_sale_customer->getC_Wallet($customer_info['customer_id']);

		$data['cwallet'] = number_format($data['cwallet'] , 6, '.', ',');

		$data['rwallet'] = $this->model_sale_customer->getR_Wallet($customer_info['customer_id']);
		$data['rwallet'] = number_format($data['rwallet'] , 6, '.', ',') ;		

		$data['getpd'] = $this->model_sale_customer->getTotalPD($customer_info['customer_id']);

		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;
		$limit = 20;
		$start = ($page - 1) * 10;
		$pd_total = $data['getpd'];
		$pagination = new Pagination();
		$pagination -> total = $pd_total;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination->url = $this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
		$data['pagination'] = $pagination -> render();
		
		$this->load->model('report/activity');
		$data['pds'] = $this -> model_sale_customer -> getPDById($customer_info['customer_id'], $limit, $start);
		$data['totalStatusWatting'] = $this->model_report_activity->getTotalStatusProvide(0,$customer_info['customer_id']);
		$data['totalStatusMarched'] = $this->model_report_activity->getTotalStatusProvide(1,$customer_info['customer_id']);
		$data['totalStatusFinish'] = $this->model_report_activity->getTotalStatusProvide(2,$customer_info['customer_id']);


		$data['getgd'] = $this->model_sale_customer->getTotalGD($customer_info['customer_id']);	
		$data['level'] = $this->model_sale_customer->getLevel($customer_info['customer_id']);		
		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;
		$limit = 20;
		$start = ($page - 1) * 10;
		$pd_total = $data['getgd'];
		$pagination = new Pagination();
		$pagination -> total = $pd_total;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination->url = $this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
		$data['pagination'] = $pagination -> render();
		
		$this->load->model('report/activity');
		$data['gds'] = $this -> model_sale_customer -> getGDById($customer_info['customer_id'], $limit, $start);
		
		$data['totalStatusWattingGD'] = $this->model_report_activity->getTotalStatusDonation(0,$customer_info['customer_id']);
		$data['totalStatusMarchedGD'] = $this->model_report_activity->getTotalStatusDonation(1,$customer_info['customer_id']);
		$data['totalStatusFinishGD'] = $this->model_report_activity->getTotalStatusDonation(2,$customer_info['customer_id']);



		$data['getGroupId'] = $this->user->getGroupId();
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('sale/customer_form.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'sale/customer')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ((utf8_strlen($this->request->post['customer_code']) < 1)) {
			$this->error['customer_code'] = $this->language->get('error_customer_code');
		}
		
		$customer_customer_code = $this->model_sale_customer->getCustomerByCustomerCode($this->request->post['customer_code']);

		if (!isset($this->request->get['customer_id'])) {
			if ($customer_customer_code) {
				$this->error['warning'] = $this->language->get('error_exists_customer_code');
			}
		} else {
			if ($customer_customer_code && ($this->request->get['customer_id'] != $customer_customer_code['customer_id'])) {
				$this->error['warning'] = $this->language->get('error_exists_customer_code');
			}
		}
		
		if (utf8_strlen($this->request->post['firstname']) < 1) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}

		if(utf8_strlen($this->request->post['email']) > 0){
		
			if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email'])) {
				$this->error['email'] = $this->language->get('error_email');
			}

			$customer_info = $this->model_sale_customer->getCustomerByEmail($this->request->post['email']);
	
			if (!isset($this->request->get['customer_id'])) {
				if ($customer_info) {
					$this->error['warning'] = $this->language->get('error_exists');
				}
			} else {
				if ($customer_info && ($this->request->get['customer_id'] != $customer_info['customer_id'])) {
					$this->error['warning'] = $this->language->get('error_exists');
				}
			}
		}
		
		if (utf8_strlen($this->request->post['telephone']) < 1) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}
		
		
		$customer_telephone= $this->model_sale_customer->getCustomerByTelephone($this->request->post['telephone']);
	
		if (!isset($this->request->get['customer_id'])) {
			if ($customer_telephone) {
				$this->error['warning'] = $this->language->get('error_exists_telephone');
			}
		} else {
			if ($customer_telephone && ($this->request->get['customer_id'] != $customer_telephone['customer_id'])) {
				$this->error['warning'] = $this->language->get('error_exists_telephone');
			}
		}
		
		
		if(utf8_strlen($this->request->post['cmnd']) > 0){
			if ((utf8_strlen($this->request->post['cmnd']) < 9) || (utf8_strlen($this->request->post['cmnd']) > 12)) {
				$this->error['cmnd'] = $this->language->get('error_cmnd');
			}
			$customer_cmnd = $this->model_sale_customer->getCustomerByCmnd($this->request->post['cmnd']);
	
			if (!isset($this->request->get['customer_id'])) {
				if ($customer_cmnd) {
					$this->error['warning'] = $this->language->get('error_exists_cmnd');
				}
			} else {
				if ($customer_cmnd && ($this->request->get['customer_id'] != $customer_cmnd['customer_id'])) {
					$this->error['warning'] = $this->language->get('error_exists_cmnd');
				}
			}
		}
		
		if ((utf8_strlen($this->request->post['account_bank']) < 1)) {
			$this->error['account_bank'] = $this->language->get('error_account_bank');
		}
		
		$customer_account_bank = $this->model_sale_customer->getCustomerByAccountBank($this->request->post['account_bank']);

		if (!isset($this->request->get['customer_id'])) {
			if ($customer_account_bank) {
				$this->error['warning'] = $this->language->get('error_exists_account_bank');
			}
		} else {
			if ($customer_account_bank && ($this->request->get['customer_id'] != $customer_account_bank['customer_id'])) {
				$this->error['warning'] = $this->language->get('error_exists_account_bank');
			}
		}
		
		if ((utf8_strlen($this->request->post['username']) < 1)) {
			$this->error['username'] = $this->language->get('error_username');
		}
		
		$customer_username = $this->model_sale_customer->getCustomerByUsername($this->request->post['username']);

		if (!isset($this->request->get['customer_id'])) {
			if ($customer_username) {
				$this->error['warning'] = $this->language->get('error_exists_username');
			}
		} else {
			if ($customer_username && ($this->request->get['customer_id'] != $customer_username['customer_id'])) {
				$this->error['warning'] = $this->language->get('error_exists_username');
			}
		}
		
		if(utf8_strlen(trim($this->request->post['p_node'])) < 1 ){
			$this->error['p_node'] = $this->language->get('error_p_node');
		}

		// Custom field validation
		$this->load->model('sale/custom_field');

		$custom_fields = array();

		foreach ($custom_fields as $custom_field) {
			if (($custom_field['location'] == 'account') && $custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['custom_field_id']])) {
				$this->error['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
			}
		}

		if ($this->request->post['password'] || (!isset($this->request->get['customer_id']))) {
			if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
				$this->error['password'] = $this->language->get('error_password');
			}
/*
			if ($this->request->post['password'] != $this->request->post['confirm']) {
				$this->error['confirm'] = $this->language->get('error_confirm');
			}
			*/
		}
		if ($this->request->post['transaction_password'] || (!isset($this->request->get['customer_id']))) {
			if ((utf8_strlen($this->request->post['transaction_password']) < 4) || (utf8_strlen($this->request->post['transaction_password']) > 20)) {
				$this->error['password'] = $this->language->get('error_password');
			}
/*
			if ($this->request->post['password'] != $this->request->post['confirm']) {
				$this->error['confirm'] = $this->language->get('error_confirm');
			}
			*/
		}

		if (isset($this->request->post['address'])) {
			foreach ($this->request->post['address'] as $key => $value) {
				if ((utf8_strlen($value['firstname']) < 1) || (utf8_strlen($value['firstname']) > 32)) {
					$this->error['address'][$key]['firstname'] = $this->language->get('error_firstname');
				}

				if ((utf8_strlen($value['lastname']) < 1) || (utf8_strlen($value['lastname']) > 32)) {
					$this->error['address'][$key]['lastname'] = $this->language->get('error_lastname');
				}

				if ((utf8_strlen($value['address_1']) < 3) || (utf8_strlen($value['address_1']) > 128)) {
					$this->error['address'][$key]['address_1'] = $this->language->get('error_address_1');
				}

				if ((utf8_strlen($value['city']) < 2) || (utf8_strlen($value['city']) > 128)) {
					$this->error['address'][$key]['city'] = $this->language->get('error_city');
				}

				$this->load->model('localisation/country');

				$country_info = $this->model_localisation_country->getCountry($value['country_id']);

				if ($country_info && $country_info['postcode_required'] && (utf8_strlen($value['postcode']) < 2 || utf8_strlen($value['postcode']) > 10)) {
					$this->error['address'][$key]['postcode'] = $this->language->get('error_postcode');
				}

				if ($value['country_id'] == '') {
					$this->error['address'][$key]['country'] = $this->language->get('error_country');
				}

				if (!isset($value['zone_id']) || $value['zone_id'] == '') {
					$this->error['address'][$key]['zone'] = $this->language->get('error_zone');
				}

				foreach ($custom_fields as $custom_field) {
					if (($custom_field['location'] == 'address') && $custom_field['required'] && empty($value['custom_field'][$custom_field['custom_field_id']])) {
						$this->error['address'][$key]['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
					}
				}
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'sale/customer')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validateApprove() {
		if (!$this->user->hasPermission('modify', 'sale/customer')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validateUnlock() {
		if (!$this->user->hasPermission('modify', 'sale/customer')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
	
	protected function validatePackage() {
		
		if (!$this->user->hasPermission('modify', 'sale/customer')) {
			$this->error['warning'] =  $this->language->get('error_permission');
		}
		if(utf8_strlen(trim($this->request->post['p_node'])) < 1){
			$this->error['warning'] = $this->language->get('error_p_node');
		}

		if ( utf8_strlen($this->request->post['money_invest']) < 1) {
			$this->error['warning'] =  $this->language->get('error_money_invest');
		}
		
		if (( trim($this->request->post['money_invest'])+0) < ($this->config->get('config_package1')+0)) {
			$this->error['warning'] =  $this->language->get('error_money_invest_package1').$this->config->get('config_package1');
		}
		
		if ( utf8_strlen($this->request->post['type_contract_']) < 1) {
			$this->error['warning'] =  $this->language->get('error_type_contract');
		}
		
	if ( utf8_strlen($this->request->post['date_added']) < 1) {
			$this->error['warning'] =  $this->language->get('error_date_added');
		}

		return !$this->error;
	}
	
	
	protected function validateTranction() {
		
		if (!$this->user->hasPermission('modify', 'sale/customer')) {
			$this->error['warning'] =  $this->language->get('error_permission');
		}

		if ( utf8_strlen($this->request->post['amount']) < 1) {
			$this->error['warning'] =  $this->language->get('error_amount');
		}
		
		if($this->model_sale_customer->getTransactionProfitTotal($this->request->post['id_package']) < $this->request->post['amount']){
			$this->error['warning'] =  $this->language->get('error_payout');
		}

		return !$this->error;
	}
	protected function validateHistory() {
		if (!$this->user->hasPermission('modify', 'sale/customer')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!isset($this->request->post['comment']) || utf8_strlen($this->request->post['comment']) < 1) {
			$this->error['warning'] = $this->language->get('error_comment');
		}

		return !$this->error;
	}

	public function login() {

		$json = array();

		if (isset($this->request->get['customer_id'])) {
			$customer_id = $this->request->get['customer_id'];
		} else {
			$customer_id = 0;
		}

		$this->load->model('sale/customer');

		$customer_info = $this->model_sale_customer->getCustomer($customer_id);

		if ($customer_info) {
			$token = md5(mt_rand());

			$this->model_sale_customer->editToken($customer_id, $token);

			if (isset($this->request->get['store_id'])) {
				$store_id = $this->request->get['store_id'];
			} else {
				$store_id = 0;
			}

			$this->load->model('setting/store');

			$store_info = $this->model_setting_store->getStore($store_id);

			if ($store_info) {
				$this->response->redirect($store_info['url'] . 'index.php?route=account/login&token=' . $token);
			} else {
				$this->response->redirect(HTTP_CATALOG . 'index.php?route=account/login&token=' . $token);
			}
		} else {
			$this->load->language('error/not_found');

			$this->document->setTitle($this->language->get('heading_title'));

			$data['heading_title'] = $this->language->get('heading_title');

			$data['text_not_found'] = $this->language->get('text_not_found');

			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
			);

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('error/not_found', 'token=' . $this->session->data['token'], 'SSL')
			);

			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');

			$this->response->setOutput($this->load->view('error/not_found.tpl', $data));
		}
	}
	
	
	public  function filterUserNew() {
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');
		
		if (isset($this->request->get['month_filter'])) {
			$month_filter = $this->request->get['month_filter'];
		} else {
			$month_filter = null;
		}
		
		if (isset($this->request->get['year_filter'])) {
			$year_filter = $this->request->get['year_filter'];
		} else {
			$year_filter = null;
		}
		

		$sort = ' CONVERT(c.username, DECIMAL) ';

		$order = 'ASC';

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['month_filter'])) {
			$url .= '&month_filter=' . urlencode(html_entity_decode($this->request->get['month_filter'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['year_filter'])) {
			$url .= '&year_filter=' . urlencode(html_entity_decode($this->request->get['year_filter'], ENT_QUOTES, 'UTF-8'));
		}

		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);
		
		$data['add'] = $this->url->link('sale/customer/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('sale/customer/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['customers'] = array();
		$filter_data = array(
			'month_filter'                => $month_filter,
			'year_filter'                => $year_filter,
			'sort'                     => $sort,
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
		);

		$customer_total = $this->model_sale_customer->getTotalCustomersNew($filter_data);

		$results = $this->model_sale_customer->getCustomersNew($filter_data);

		foreach ($results as $result) {
		//	$total_hoivien_phi = $this->model_sale_customer->getAllProfitByType($result['customer_id'],'1');
		//	$total_congtac_phi = $this->model_sale_customer->getAllProfitByType($result['customer_id'],'2');
		//	$total_payout = $this->model_sale_customer->getAllProfitByType($result['customer_id'],'3');
			
			$data['customers'][] = array(
				'customer_id'    => $result['customer_id'],
				'name'           => $result['name'],
				'username'       => $result['username'],
				'customer_code'  => $result['customer_code'],
				'name_parent'  	 => $this->model_sale_customer->getNameParent($result['p_node']),
				'telephone'      => $result['telephone'],
				'email'          => $result['email'],
	
				'hvOff'			 => 1,
				'hvNew'			 => true,
				'status'         => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'ip'             => $result['ip'],
				'date_birth'     => date($this->language->get('date_format_short'), strtotime($result['date_birth'])),
		//		'total_hoivien_phi'   => $total_hoivien_phi,
		//		'total_congtac_phi' => $total_congtac_phi,
		//		'total_payout'     => $total_payout,
				'edit'           => $this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id=' . $result['customer_id'] . $url, 'SSL')
			);
		}
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = 'Danh sách hội viên mới';
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_email'] = $this->language->get('column_email');
		
		$data['column_package'] = $this->language->get('column_package');
		$data['column_p_node'] = $this->language->get('column_p_node');
		$data['column_type_contract'] = $this->language->get('column_type_contract');
		$data['column_month_invest'] = $this->language->get('column_month_invest');
		$data['column_money_invest'] = $this->language->get('column_money_invest');
		
		$data['column_total_profit'] = $this->language->get('column_total_profit');
		$data['column_total_commission'] = $this->language->get('column_total_commission');
		$data['column_total_gift'] = $this->language->get('column_total_gift');
		$data['column_total_payout'] = $this->language->get('column_total_payout');
		$data['column_total_balance'] = $this->language->get('column_total_balance');
		
		$data['column_customer_group'] = $this->language->get('column_customer_group');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_approved'] = $this->language->get('column_approved');
		$data['column_ip'] = $this->language->get('column_ip');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_approved'] = $this->language->get('entry_approved');
		$data['entry_ip'] = $this->language->get('entry_ip');
		$data['entry_date_added'] = $this->language->get('entry_date_added');

		$data['button_approve'] = $this->language->get('button_approve');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_login'] = $this->language->get('button_login');
		$data['button_unlock'] = $this->language->get('button_unlock');
		$data['getGroupId'] = $this->user->getGroupId();
		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['month_filter'])) {
			$url .= '&month_filter=' . urlencode(html_entity_decode($this->request->get['month_filter'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['year_filter'])) {
			$url .= '&year_filter=' . urlencode(html_entity_decode($this->request->get['year_filter'], ENT_QUOTES, 'UTF-8'));
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		$data['filter_name'] = '';
		$data['filter_email'] = '';
		$data['filter_username'] = '';
		$data['filter_customer_code'] = '';
		$data['filter_phone'] = '';
		$data['filter_customer_group_id'] = '';
		$data['filter_status'] = '';
		$data['filter_approved'] = '';
		$data['filter_ip'] = '';
		$data['filter_date_added'] = '';
		$data['month_filter'] = $month_filter;
		$data['year_filter'] = $year_filter;
		$data['type_filter'] = 'filterUserNew';

		$pagination = new Pagination();
		$pagination->total = $customer_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($customer_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($customer_total - $this->config->get('config_limit_admin'))) ? $customer_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $customer_total, ceil($customer_total / $this->config->get('config_limit_admin')));


		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['test'] = 1;

		$this->response->setOutput($this->load->view('sale/customer_list.tpl', $data));
	}
	
	public  function filterUserNotHP() {
		
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');
		
		if (isset($this->request->get['month_filter'])) {
			$month_filter = $this->request->get['month_filter'];
		} else {
			$month_filter = null;
		}

		if (isset($this->request->get['year_filter'])) {
			$year_filter = $this->request->get['year_filter'];
		} else {
			$year_filter = null;
		}

		$sort = ' CONVERT(c.username, DECIMAL) ';

		$order = 'ASC';

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['month_filter'])) {
			$url .= '&month_filter=' . urlencode(html_entity_decode($this->request->get['month_filter'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['year_filter'])) {
			$url .= '&year_filter=' . urlencode(html_entity_decode($this->request->get['year_filter'], ENT_QUOTES, 'UTF-8'));
		}

		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);
		
		$data['add'] = $this->url->link('sale/customer/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('sale/customer/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['customers'] = array();
		$filter_data = array(
			'month_filter'                => $month_filter,
			'year_filter'                => $year_filter,
			'sort'                     => $sort,
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
		);

		$customer_total = $this->model_sale_customer->getTotalCustomersNotHP($filter_data);

		$results = $this->model_sale_customer->getCustomersNotHP($filter_data);

		foreach ($results as $result) {
		//	$total_hoivien_phi = $this->model_sale_customer->getAllProfitByType($result['customer_id'],'1');
		//	$total_congtac_phi = $this->model_sale_customer->getAllProfitByType($result['customer_id'],'2');
		//	$total_payout = $this->model_sale_customer->getAllProfitByType($result['customer_id'],'3');
			
			$data['customers'][] = array(
				'customer_id'    => $result['customer_id'],
				'name'           => $result['name'],
				'username'       => $result['username'],
				'customer_code'  => $result['customer_code'],
				'name_parent'  	 => $this->model_sale_customer->getNameParent($result['p_node']),
				'telephone'      => $result['telephone'],
				'email'          => $result['email'],
				'hvOff'			 => 1,
				'hvNew'			 => false,
				'status'         => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'ip'             => $result['ip'],
				'date_birth'     => date($this->language->get('date_format_short'), strtotime($result['date_birth'])),
			//	'total_hoivien_phi'   => $total_hoivien_phi,
			//	'total_congtac_phi' => $total_congtac_phi,
			//	'total_payout'     => $total_payout,
				'edit'           => $this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id=' . $result['customer_id'] . $url, 'SSL')
			);
		}
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = 'Danh sách hội viên chưa đóng phí';
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_email'] = $this->language->get('column_email');
		
		$data['column_package'] = $this->language->get('column_package');
		$data['column_p_node'] = $this->language->get('column_p_node');
		$data['column_type_contract'] = $this->language->get('column_type_contract');
		$data['column_month_invest'] = $this->language->get('column_month_invest');
		$data['column_money_invest'] = $this->language->get('column_money_invest');
		
		$data['column_total_profit'] = $this->language->get('column_total_profit');
		$data['column_total_commission'] = $this->language->get('column_total_commission');
		$data['column_total_gift'] = $this->language->get('column_total_gift');
		$data['column_total_payout'] = $this->language->get('column_total_payout');
		$data['column_total_balance'] = $this->language->get('column_total_balance');
		
		$data['column_customer_group'] = $this->language->get('column_customer_group');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_approved'] = $this->language->get('column_approved');
		$data['column_ip'] = $this->language->get('column_ip');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_approved'] = $this->language->get('entry_approved');
		$data['entry_ip'] = $this->language->get('entry_ip');
		$data['entry_date_added'] = $this->language->get('entry_date_added');

		$data['button_approve'] = $this->language->get('button_approve');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_login'] = $this->language->get('button_login');
		$data['button_unlock'] = $this->language->get('button_unlock');
		$data['getGroupId'] = $this->user->getGroupId();
		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['month_filter'])) {
			$url .= '&month_filter=' . urlencode(html_entity_decode($this->request->get['month_filter'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['year_filter'])) {
			$url .= '&year_filter=' . urlencode(html_entity_decode($this->request->get['year_filter'], ENT_QUOTES, 'UTF-8'));
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		$data['filter_name'] = '';
		$data['filter_email'] = '';
		$data['filter_username'] = '';
		$data['filter_customer_code'] = '';
		$data['filter_phone'] = '';
		$data['filter_customer_group_id'] = '';
		$data['filter_status'] = '';
		$data['filter_approved'] = '';
		$data['filter_ip'] = '';
		$data['filter_date_added'] = '';
		$data['month_filter'] = $month_filter;
		$data['year_filter'] = $year_filter;
		$data['type_filter'] = 'filterUserNotHP';

		$pagination = new Pagination();
		$pagination->total = $customer_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($customer_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($customer_total - $this->config->get('config_limit_admin'))) ? $customer_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $customer_total, ceil($customer_total / $this->config->get('config_limit_admin')));


		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('sale/customer_list.tpl', $data));
	}
	
	public  function filterUserOff() {
		
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');
		
		if (isset($this->request->get['month_filter'])) {
			$month_filter = $this->request->get['month_filter'];
		} else {
			$month_filter = null;
		}

		if (isset($this->request->get['year_filter'])) {
			$year_filter = $this->request->get['year_filter'];
		} else {
			$year_filter = null;
		}

		$sort = ' CONVERT(c.username, DECIMAL) ';

		$order = 'ASC';

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['month_filter'])) {
			$url .= '&month_filter=' . urlencode(html_entity_decode($this->request->get['month_filter'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['year_filter'])) {
			$url .= '&year_filter=' . urlencode(html_entity_decode($this->request->get['year_filter'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);
		
		$data['add'] = $this->url->link('sale/customer/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('sale/customer/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['customers'] = array();
		$filter_data = array(
			'month_filter'                => $month_filter,
			'year_filter'                => $year_filter,
			'sort'                     => $sort,
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
		);

		$customer_total = $this->model_sale_customer->getTotalCustomersOff($filter_data);

		$results = $this->model_sale_customer->getCustomersOff($filter_data);

		foreach ($results as $result) {
		//	$total_hoivien_phi = $this->model_sale_customer->getAllProfitByType($result['customer_id'],'1');
		//	$total_congtac_phi = $this->model_sale_customer->getAllProfitByType($result['customer_id'],'2');
		//	$total_payout = $this->model_sale_customer->getAllProfitByType($result['customer_id'],'3');
			
			$data['customers'][] = array(
				'customer_id'    => $result['customer_id'],
				'name'           => $result['name'],
				'username'       => $result['username'],
				'customer_code'  => $result['customer_code'],
				'name_parent'  	 => $this->model_sale_customer->getNameParent($result['p_node']),
				'telephone'      => $result['telephone'],
				'email'          => $result['email'],
				'hvOff'			 => 0,
				'hvNew'			 => false,
				'status'         => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'ip'             => $result['ip'],
				'date_birth'     => date($this->language->get('date_format_short'), strtotime($result['date_birth'])),
			//	'total_hoivien_phi'   => $total_hoivien_phi,
			//	'total_congtac_phi' => $total_congtac_phi,
			//	'total_payout'     => $total_payout,
				'edit'           => $this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id=' . $result['customer_id'] . $url, 'SSL')
			);
		}
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = 'Danh sách hội viên bị off';
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_email'] = $this->language->get('column_email');
		
		$data['column_package'] = $this->language->get('column_package');
		$data['column_p_node'] = $this->language->get('column_p_node');
		$data['column_type_contract'] = $this->language->get('column_type_contract');
		$data['column_month_invest'] = $this->language->get('column_month_invest');
		$data['column_money_invest'] = $this->language->get('column_money_invest');
		
		$data['column_total_profit'] = $this->language->get('column_total_profit');
		$data['column_total_commission'] = $this->language->get('column_total_commission');
		$data['column_total_gift'] = $this->language->get('column_total_gift');
		$data['column_total_payout'] = $this->language->get('column_total_payout');
		$data['column_total_balance'] = $this->language->get('column_total_balance');
		
		$data['column_customer_group'] = $this->language->get('column_customer_group');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_approved'] = $this->language->get('column_approved');
		$data['column_ip'] = $this->language->get('column_ip');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_approved'] = $this->language->get('entry_approved');
		$data['entry_ip'] = $this->language->get('entry_ip');
		$data['entry_date_added'] = $this->language->get('entry_date_added');

		$data['button_approve'] = $this->language->get('button_approve');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_login'] = $this->language->get('button_login');
		$data['button_unlock'] = $this->language->get('button_unlock');

		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['month_filter'])) {
			$url .= '&month_filter=' . urlencode(html_entity_decode($this->request->get['month_filter'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['year_filter'])) {
			$url .= '&year_filter=' . urlencode(html_entity_decode($this->request->get['year_filter'], ENT_QUOTES, 'UTF-8'));
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		$data['getGroupId'] = $this->user->getGroupId();
		$data['filter_name'] = '';
		$data['filter_email'] = '';
		$data['filter_username'] = '';
		$data['filter_customer_code'] = '';
		$data['filter_phone'] = '';
		$data['filter_customer_group_id'] = '';
		$data['filter_status'] = '';
		$data['filter_approved'] = '';
		$data['filter_ip'] = '';
		$data['filter_date_added'] = '';
		$data['month_filter'] = $month_filter;
		$data['year_filter'] = $year_filter;
		$data['type_filter'] = 'filterUserOff';

		$pagination = new Pagination();
		$pagination->total = $customer_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($customer_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($customer_total - $this->config->get('config_limit_admin'))) ? $customer_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $customer_total, ceil($customer_total / $this->config->get('config_limit_admin')));


		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('sale/customer_list.tpl', $data));
	}
	
	public  function filterUserCTP() {
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');
		
		if (isset($this->request->get['month_filter'])) {
			$month_filter = $this->request->get['month_filter'];
		} else {
			$month_filter = null;
		}

		if (isset($this->request->get['year_filter'])) {
			$year_filter = $this->request->get['year_filter'];
		} else {
			$year_filter = null;
		}

		$sort = ' CONVERT(c.username, DECIMAL) ';

		$order = 'ASC';

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['month_filter'])) {
			$url .= '&month_filter=' . urlencode(html_entity_decode($this->request->get['month_filter'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['year_filter'])) {
			$url .= '&year_filter=' . urlencode(html_entity_decode($this->request->get['year_filter'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);
		
		$data['add'] = $this->url->link('sale/customer/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('sale/customer/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['customers'] = array();
		$filter_data = array(
			'month_filter'                => $month_filter,
			'year_filter'                => $year_filter,
			'sort'                     => $sort,
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
		);

		$customer_total = $this->model_sale_customer->getTotalCustomersCTP($filter_data);

		$results = $this->model_sale_customer->getCustomersCTP($filter_data);

		foreach ($results as $result) {
		//	$total_hoivien_phi = $this->model_sale_customer->getAllProfitByType($result['customer_id'],'1');
		//	$total_congtac_phi = $this->model_sale_customer->getAllProfitByType($result['customer_id'],'2');
		//	$total_payout = $this->model_sale_customer->getAllProfitByType($result['customer_id'],'3');
			
			$data['customers'][] = array(
				'customer_id'    => $result['customer_id'],
				'name'           => $result['name'],
				'username'       => $result['username'],
				'customer_code'  => $result['customer_code'],
				'name_parent'  	 => $this->model_sale_customer->getNameParent($result['p_node']),
				'telephone'      => $result['telephone'],
				'email'          => $result['email'],
				'hvOff'			 => 1,
				'hvNew'			 => false,
				'status'         => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'ip'             => $result['ip'],
				'date_birth'     => date($this->language->get('date_format_short'), strtotime($result['date_birth'])),
		//		'total_hoivien_phi'   => $total_hoivien_phi,
		//		'total_congtac_phi' => $total_congtac_phi,
		//		'total_payout'     => $total_payout,
				'edit'           => $this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id=' . $result['customer_id'] . $url, 'SSL')
			);
		}
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = 'Công tác phí của hội viên';
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_email'] = $this->language->get('column_email');
		
		$data['column_package'] = $this->language->get('column_package');
		$data['column_p_node'] = $this->language->get('column_p_node');
		$data['column_type_contract'] = $this->language->get('column_type_contract');
		$data['column_month_invest'] = $this->language->get('column_month_invest');
		$data['column_money_invest'] = $this->language->get('column_money_invest');
		
		$data['column_total_profit'] = $this->language->get('column_total_profit');
		$data['column_total_commission'] = $this->language->get('column_total_commission');
		$data['column_total_gift'] = $this->language->get('column_total_gift');
		$data['column_total_payout'] = $this->language->get('column_total_payout');
		$data['column_total_balance'] = $this->language->get('column_total_balance');
		
		$data['column_customer_group'] = $this->language->get('column_customer_group');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_approved'] = $this->language->get('column_approved');
		$data['column_ip'] = $this->language->get('column_ip');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_approved'] = $this->language->get('entry_approved');
		$data['entry_ip'] = $this->language->get('entry_ip');
		$data['entry_date_added'] = $this->language->get('entry_date_added');

		$data['button_approve'] = $this->language->get('button_approve');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_login'] = $this->language->get('button_login');
		$data['button_unlock'] = $this->language->get('button_unlock');
		$data['getGroupId'] = $this->user->getGroupId();
		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['month_filter'])) {
			$url .= '&month_filter=' . urlencode(html_entity_decode($this->request->get['month_filter'], ENT_QUOTES, 'UTF-8'));
		}
		
		if (isset($this->request->get['year_filter'])) {
			$url .= '&year_filter=' . urlencode(html_entity_decode($this->request->get['year_filter'], ENT_QUOTES, 'UTF-8'));
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		$data['filter_name'] = '';
		$data['filter_email'] = '';
		$data['filter_username'] = '';
		$data['filter_customer_code'] = '';
		$data['filter_phone'] = '';
		$data['filter_customer_group_id'] = '';
		$data['filter_status'] = '';
		$data['filter_approved'] = '';
		$data['filter_ip'] = '';
		$data['filter_date_added'] = '';
		$data['month_filter'] = $month_filter;
		$data['year_filter'] = $year_filter;
		$data['type_filter'] = 'filterUserCTP';

		$pagination = new Pagination();
		$pagination->total = $customer_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($customer_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($customer_total - $this->config->get('config_limit_admin'))) ? $customer_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $customer_total, ceil($customer_total / $this->config->get('config_limit_admin')));


		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('sale/customer_list.tpl', $data));
	}

	public function history() {
		$this->load->language('sale/customer');

		$this->load->model('sale/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateHistory()) {
			$this->model_sale_customer->addHistory($this->request->get['customer_id'], $this->request->post['comment']);

			$data['success'] = $this->language->get('text_success');
		} else {
			$data['success'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_comment'] = $this->language->get('column_comment');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['histories'] = array();

		$results = $this->model_sale_customer->getHistories($this->request->get['customer_id'], ($page - 1) * 10, 10);

		foreach ($results as $result) {
			$data['histories'][] = array(
				'comment'     => $result['comment'],
				'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$history_total = $this->model_sale_customer->getTotalHistories($this->request->get['customer_id']);

		$pagination = new Pagination();
		$pagination->total = $history_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->url = $this->url->link('sale/customer/history', 'token=' . $this->session->data['token'] . '&customer_id=' . $this->request->get['customer_id'] . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($history_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($history_total - 10)) ? $history_total : ((($page - 1) * 10) + 10), $history_total, ceil($history_total / 10));

		$this->response->setOutput($this->load->view('sale/customer_history.tpl', $data));
	}
	
	public function hoiPhiCustomer() {
		$this->load->language('sale/customer');

		$this->load->model('sale/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			$arrHP =  explode(",",$this->request->post['selected']);
			foreach ($arrHP as $hp) {
				$this->model_sale_customer->addHoiPhi($this->request->get['customer_id'],$hp);
			}
			$data['success'] = $this->language->get('text_success');
		} else {
			$data['success'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		$data['token'] = $this->session->data['token'];
		
		$data['customer_id'] =  $this->request->get['customer_id'];
		
		$this->response->setOutput($this->load->view('sale/customer_package.tpl', $data));
	}
	


	public function payoutCustomer() {
		$this->load->language('sale/customer');
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');
		$json = array();
		if ($this->request->server['REQUEST_METHOD'] == 'POST'){
			$arrCustomers =  explode(",",$this->request->post['selected']);
			foreach ($arrCustomers as $customers_id) {
				$this->model_sale_customer->makePayoutUser((int)$customers_id,$this->request->post['date_start'],$this->request->post['date_end']);
			}
			//$this->model_sale_customer->makePayoutAllUser($this->request->post['date_start'],$this->request->post['date_end']);
			$json['success'] = $this->language->get('Thành công : thanh tóan cho các hội viên');
		}else{
			$json['success'] = $this->language->get('Thất bại : thanh toán cho các hội viên');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}
	
public function transaction() {
		$this->load->language('sale/customer');

		$this->load->model('sale/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateTranction()) {
			$this->model_sale_customer->payout($this->request->post['id_package'],$this->request->get['customer_id'], $this->request->post['description'], $this->request->post['amount']);

			$data['success'] = $this->language->get('text_success');
		} else {
			$data['success'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->request->post['month_filter'])) {
			$month_filter = $this->request->post['month_filter'];
		} else {
			$date = strtotime(date('Y-m-d'));
			$month = date('m',$date);
			$month_filter = $month;
		}
		$data['month_filter'] = $month_filter;
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_balance'] = $this->language->get('text_balance');
		
		$data['text_profit'] = $this->language->get('column_total_profit');
		$data['text_commission'] = $this->language->get('column_total_commission');
		$data['text_gift'] = $this->language->get('column_total_gift');
		$data['text_payout'] = $this->language->get('column_total_payout');

		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_description'] = $this->language->get('column_description');
		$data['column_amount'] = $this->language->get('column_amount');
		$data['column_from_user'] = $this->language->get('column_from_user');
		$data['column_money_invest'] = $this->language->get('column_money_invest');

		$data['entry_package'] = $this->language->get('column_package');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_amount'] = $this->language->get('entry_amount');
		
		$data['button_transaction_add'] = $this->language->get('button_transaction_add');

		$data['transactions'] = array();
		$results = $this->model_sale_customer->getTransactionsProfitByMonth($this->request->get['customer_id'],$month_filter,2,0);

		foreach ($results as $result) {
			$data['transactions'][] = array(
				'amount'      => $result['receive'],
				'type_profit'      => $result['type_profit'],
				'description' => $result['description'],
				'from_userid' => $result['name_from'],
				'description' => $result['description'],
				'month' => $result['month'],
				'year' => $result['year'],
				'url_customer_from'	=> $this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id='.$result['from_userid'], 'SSL'),
				'date_added'  => date($this->language->get('date_format_short'),$result['date'] )
			);
		}
		
		$resultsHp = $this->model_sale_customer->getTransactionsProfitByMonth($this->request->get['customer_id'],$month_filter,1,1);
		foreach ($resultsHp as $result) {
			$data['transactions'][] = array(
				'amount'      => $result['receive'],
				'type_profit'      => $result['type_profit'],
				'description' => $result['description'],
				'from_userid' => $result['name_from'],
				'description' => $result['description'],
				'month' => $result['month'],
				'year' => $result['year'],
				'url_customer_from'	=> $this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id='.$result['from_userid'], 'SSL'),
				'date_added'  => date($this->language->get('date_format_short'),$result['date'] )
			);
		}
		$dateNow = date("Y-m-d H:i:s");
		$year= date('Y',strtotime($dateNow));
		$tongctphi = $this->model_sale_customer->getAllProfitByTypeMonth($this->request->get['customer_id'],'2',$month_filter,$year);
		
		$data['tongctphi'] = $tongctphi;
		
		$tongPHFromCTP = $this->model_sale_customer->getAllHPFromCTPMonth($this->request->get['customer_id'],$month_filter,$year);
		
		$data['tongPHFromCTP'] = $tongPHFromCTP;
		
		
		$this->response->setOutput($this->load->view('sale/customer_transaction.tpl', $data));
	}
	
public function searchPackage() {
		$this->load->language('sale/customer');

		$this->load->model('sale/customer');

		$data['success'] = '';

		$data['error_warning'] = '';

		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_balance'] = $this->language->get('text_balance');
		
		$data['text_profit'] = $this->language->get('column_total_profit');
		$data['text_commission'] = $this->language->get('column_total_commission');
		$data['text_gift'] = $this->language->get('column_total_gift');
		$data['text_payout'] = $this->language->get('column_total_payout');

		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_description'] = $this->language->get('column_description');
		$data['column_amount'] = $this->language->get('column_amount');
		$data['column_from_user'] = $this->language->get('column_from_user');
		$data['column_money_invest'] = $this->language->get('column_money_invest');

		$data['entry_package'] = $this->language->get('column_package');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_amount'] = $this->language->get('entry_amount');
		
		$data['button_transaction_add'] = $this->language->get('button_transaction_add');
		
		$data['month_filter'] = '';
		if (isset($this->request->post['month_filter'])) {
			$month_filter = $this->request->post['month_filter'];
		} else {
			$date = strtotime(date('Y-m-d'));
			$month = date('m',$date);
			$month_filter = $month;
		}
		$data['month_filter'] = $month_filter;
		$data['transactions'] = array();
		$results = $this->model_sale_customer->getTransactionsProfitByMonth($this->request->get['customer_id'],$month_filter,2,0);

		foreach ($results as $result) {
			$data['transactions'][] = array(
				'amount'      => $result['receive'],
				'type_profit'      => $result['type_profit'],
				'description' => $result['description'],
				'from_userid' => $result['name_from'],
				'description' => $result['description'],
				'month' => $result['month'],
				'year' => $result['year'],
				'url_customer_from'	=> $this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id='.$result['from_userid'], 'SSL'),
				'date_added'  => date($this->language->get('date_format_short'),$result['date'] )
			);
		}
		
		$resultsHp = $this->model_sale_customer->getTransactionsProfitByMonth($this->request->get['customer_id'],$month_filter,1,1);
		foreach ($resultsHp as $result) {
			$data['transactions'][] = array(
				'amount'      => $result['receive'],
				'type_profit'      => $result['type_profit'],
				'description' => $result['description'],
				'from_userid' => $result['name_from'],
				'description' => $result['description'],
				'month' => $result['month'],
				'year' => $result['year'],
				'url_customer_from'	=> $this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id='.$result['from_userid'], 'SSL'),
				'date_added'  => date($this->language->get('date_format_short'),$result['date'] )
			);
		}
		$dateNow = date("Y-m-d H:i:s");
		$year= date('Y',strtotime($dateNow));
		$tongctphi = $this->model_sale_customer->getAllProfitByTypeMonth($this->request->get['customer_id'],'2',$month_filter,$year);
		
		$data['tongctphi'] = $tongctphi;
		
		$tongPHFromCTP = $this->model_sale_customer->getAllHPFromCTPMonth($this->request->get['customer_id'],$month_filter,$year);
		
		$data['tongPHFromCTP'] = $tongPHFromCTP;
		
		//$data['tongctphithuc'] = $tongctphi - $tongPHFromCTP;
		
		$this->response->setOutput($this->load->view('sale/customer_transaction.tpl', $data));
	}
	
	public function personal() {
		$this->load->language('sale/customer');

		$this->load->model('sale/customer');
		$data['id_customer'] = $this->request->get['customer_id'];

		$data['token'] = $this->session->data['token'];
		
		$this->response->setOutput($this->load->view('sale/customer_personal.tpl', $data));
	}
	
	public function getJsonPersonalTree(){
		$this->load->model('sale/customer');
		$id_customer = $this->request->get['id_customer'];
		
		$user = $this->model_sale_customer->getCustomer($id_customer);

		$node = new stdClass();

		$node->id = $user['customer_id'];

		$node->text = $user['username'];
		$date = strtotime(date('Y-m-d'));
		$monthNow = date('m',$date);
		$yearNow = date('Y',$date);
		$date_added = strtotime($user['date_added']);
		$month = date('m',$date_added);
		$year = date('Y',$date_added);
		
		if($user['status'] == 0){
			$node->iconCls = "level3";
		}else if($monthNow == $month && $yearNow == $year){
			$node->iconCls = "level1";
		}else{
			$node->iconCls = "level2";
		}

		$this->getPersonChild($node);

		$node = array($node);

	//	ob_clean();

		echo json_encode($node);

		exit();

	}	
	
	public function getPersonChild(&$node){

		$this->load->model('sale/customer');
		$listChild = $this->model_sale_customer->getListChild($node->id);
			$node->children = array();
	
			foreach ($listChild as $child) {
				$childNode = new stdClass();
	
				$childNode->id = $child['customer_id'];
				$childNode->text = $child['username'];
	
				$date = strtotime(date('Y-m-d'));
				$monthNow = date('m',$date);
				$yearNow = date('Y',$date);
				$date_added = strtotime($child['cus_date_added']);
				$month = date('m',$date_added);
				$year = date('Y',$date_added);
				
				if($child['cus_status'] == 0){
					$childNode->iconCls = "level3";
				}else if($monthNow == $month && $yearNow == $year){
					$childNode->iconCls = "level1";
				}else{
					$childNode->iconCls = "level2";
				}
	
				array_push($node->children , $childNode);
	
				$this->getPersonChild($childNode);
				
	
			}
			if(count($node->children) ==0) $node->children = 0;
		return;

	}
	
	public function binary() {
		$this->load->language('sale/customer');

		$this->load->model('sale/customer');
		$data['id_customer'] = $this->request->get['customer_id'];
		$data['token'] = $this->session->data['token'];
		
		$this->response->setOutput($this->load->view('sale/customer_binary.tpl', $data));
	}
	
	public function getJsonBinaryTreeUplevel(){

		$this->load->model('sale/customer');

		$id = $this->request->get['customer_id'];

		$user = $this->model_sale_customer->getInfoUsers($id);

		$this->getJsonBinaryTree($user->p_binary);

	}
	
	public function getJsonBinaryTree($id=0){

		$this->load->model('sale/customer');
		
		$id = $this->request->get['id'];

		$user = $this->model_sale_customer->getInfoUsers($id);
		$node = new stdClass();

		$node->id = $id;
		
		$node->text = $user['firstname'].' (ĐT:'.$user['telephone'].')';

		$node->name = $user['firstname'].' (ĐT:'.$user['telephone'].')';
	
		$node->level_user = $user["level_member"];
		
		$date = strtotime(date('Y-m-d'));
		$monthNow = date('m',$date);
		$yearNow = date('Y',$date);
		$date_added = strtotime($user['date_added']);
		$month = date('m',$date_added);
		$year = date('Y',$date_added);
		
		if($user['status'] == 0){
			$node->iconCls = "level4";
		}else if($monthNow == $month && $yearNow == $year){
			$node->iconCls = "level2";
		}else{
			$node->iconCls = "level3";
		}

		$node->fl = 1;

		$this->getBinaryChild($node);

		$node = array($node);
	//	ob_clean();
		echo json_encode($node);

		exit();

	}	

	public function getBinaryChild(&$node){
		$date = strtotime(date('Y-m-d'));
		$monthNow = date('m',$date);
		$yearNow = date('Y',$date);
		
		$this->load->model('sale/customer');
		$left_row = $this->model_sale_customer->getLeftO($node->id);
		$left = new stdClass();
		
	    foreach ($left_row as $key => $value) {
	        $left->$key = $value;
	    } 
		
		$node->children = array();
		if(isset($left_row["id"])){

			$left->fl = $node->fl +1;

			if($left->fl<6)

				$this->getBinaryChild($left);

			else $left->children = 1;
			$date_added = strtotime($left->date_added);
			$month = date('m',$date_added);
			$year = date('Y',$date_added);
			
			if($left->status == 0){
				$left->iconCls = "level4 left";
			}else if($monthNow == $month && $yearNow == $year){
				$left->iconCls = "level2 left";
			}else{
				$left->iconCls = "level3 left";
			}

			array_push($node->children , $left);			

		}

		$right_row = $this->model_sale_customer->getRightO($node->id);

		$right = new stdClass();
	    foreach ($right_row as $key => $value) {
	        $right->$key = $value;
	    } 
		
		if(isset($right_row["id"])){

			$right->fl = $node->fl +1;

			if($right->fl<6)

				$this->getBinaryChild($right);

			else $right->children = 1;

			$date_added = strtotime($right->date_added);
			$month = date('m',$date_added);
			$year = date('Y',$date_added);
			
			if($right->status == 0){
				$right->iconCls = "level4 right";
			}else if($monthNow == $month && $yearNow == $year){
				$right->iconCls = "level2 right";
			}else{
				$right->iconCls = "level3 right";
			}
			array_push($node->children , $right);

		}

		if(count($node->children) ==0) $node->children = 0;

		return;

	}	
	
	public function getInfoUser(){

		$id = $this->request->get['id'];
		
		$this->load->model('sale/customer');

		$user = $this->model_sale_customer->getInfoUsers($id);
		
		$user['total_left'] = $this->model_sale_customer->getSumLeft($id);	

		$user['total_right'] = $this->model_sale_customer->getSumRight($id);
		
		$user['floor'] = $this->model_sale_customer->getSumFloor($id);
		
		$user['total'] = $user['total_left'] + $user['total_right'];

		echo json_encode($user);

		exit();

	}

	public function reward() {
		$this->load->language('sale/customer');

		$this->load->model('sale/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->user->hasPermission('modify', 'sale/customer')) {
			$this->model_sale_customer->addReward($this->request->get['customer_id'], $this->request->post['description'], $this->request->post['points']);

			$data['success'] = $this->language->get('text_success');
		} else {
			$data['success'] = '';
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && !$this->user->hasPermission('modify', 'sale/customer')) {
			$data['error_warning'] = $this->language->get('error_permission');
		} else {
			$data['error_warning'] = '';
		}

		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_balance'] = $this->language->get('text_balance');

		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_description'] = $this->language->get('column_description');
		$data['column_points'] = $this->language->get('column_points');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['rewards'] = array();

		$results = $this->model_sale_customer->getRewards($this->request->get['customer_id'], ($page - 1) * 10, 10);

		foreach ($results as $result) {
			$data['rewards'][] = array(
				'points'      => $result['points'],
				'description' => $result['description'],
				'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$data['balance'] = $this->model_sale_customer->getRewardTotal($this->request->get['customer_id']);

		$reward_total = $this->model_sale_customer->getTotalRewards($this->request->get['customer_id']);

		$pagination = new Pagination();
		$pagination->total = $reward_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->url = $this->url->link('sale/customer/reward', 'token=' . $this->session->data['token'] . '&customer_id=' . $this->request->get['customer_id'] . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($reward_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($reward_total - 10)) ? $reward_total : ((($page - 1) * 10) + 10), $reward_total, ceil($reward_total / 10));

		$this->response->setOutput($this->load->view('sale/customer_reward.tpl', $data));
	}

	public function ip() {
		$this->load->language('sale/customer');

		$this->load->model('sale/customer');

		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_add_ban_ip'] = $this->language->get('text_add_ban_ip');
		$data['text_remove_ban_ip'] = $this->language->get('text_remove_ban_ip');
		$data['text_loading'] = $this->language->get('text_loading');

		$data['column_ip'] = $this->language->get('column_ip');
		$data['column_total'] = $this->language->get('column_total');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['ips'] = array();

		$results = $this->model_sale_customer->getIps($this->request->get['customer_id'], ($page - 1) * 10, 10);

		foreach ($results as $result) {
			$ban_ip_total = $this->model_sale_customer->getTotalBanIpsByIp($result['ip']);

			$data['ips'][] = array(
				'ip'         => $result['ip'],
				'total'      => $this->model_sale_customer->getTotalCustomersByIp($result['ip']),
				'date_added' => date('d/m/y', strtotime($result['date_added'])),
				'filter_ip'  => $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&filter_ip=' . $result['ip'], 'SSL'),
				'ban_ip'     => $ban_ip_total
			);
		}

		$ip_total = $this->model_sale_customer->getTotalIps($this->request->get['customer_id']);

		$pagination = new Pagination();
		$pagination->total = $ip_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->url = $this->url->link('sale/customer/ip', 'token=' . $this->session->data['token'] . '&customer_id=' . $this->request->get['customer_id'] . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($ip_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($ip_total - 10)) ? $ip_total : ((($page - 1) * 10) + 10), $ip_total, ceil($ip_total / 10));

		$this->response->setOutput($this->load->view('sale/customer_ip.tpl', $data));
	}

	public function addBanIp() {
		$this->load->language('sale/customer');

		$json = array();

		if (isset($this->request->post['ip'])) {
			if (!$this->user->hasPermission('modify', 'sale/customer')) {
				$json['error'] = $this->language->get('error_permission');
			} else {
				$this->load->model('sale/customer');

				$this->model_sale_customer->addBanIp($this->request->post['ip']);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function removeBanIp() {
		$this->load->language('sale/customer');

		$json = array();

		if (isset($this->request->post['ip'])) {
			if (!$this->user->hasPermission('modify', 'sale/customer')) {
				$json['error'] = $this->language->get('error_permission');
			} else {
				$this->load->model('sale/customer');

				$this->model_sale_customer->removeBanIp($this->request->post['ip']);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_email'])) {
			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}

			if (isset($this->request->get['filter_email'])) {
				$filter_email = $this->request->get['filter_email'];
			} else {
				$filter_email = '';
			}

			$this->load->model('sale/customer');

			$filter_data = array(
				'filter_name'  => $filter_name,
				'filter_email' => $filter_email,
				'start'        => 0,
				'limit'        => 5
			);

			$results = $this->model_sale_customer->getCustomers($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'customer_id'       => $result['customer_id'],
					'customer_group_id' => $result['customer_group_id'],
					'name'              => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
//					'customer_group'    => $result['customer_group'],
					'firstname'         => $result['firstname'],
					'lastname'          => $result['lastname'],
					'email'             => $result['email'],
					'telephone'         => $result['telephone'],
					'fax'               => $result['fax'],
					'custom_field'      => unserialize($result['custom_field']),
					'address'           => $this->model_sale_customer->getAddresses($result['customer_id'])
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function customfield() {
		$json = array();

		$this->load->model('sale/custom_field');

		// Customer Group
		if (isset($this->request->get['customer_group_id'])) {
			$customer_group_id = $this->request->get['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$custom_fields = $this->model_sale_custom_field->getCustomFields(array('filter_customer_group_id' => $customer_group_id));

		foreach ($custom_fields as $custom_field) {
			$json[] = array(
				'custom_field_id' => $custom_field['custom_field_id'],
				'required'        => empty($custom_field['required']) || $custom_field['required'] == 0 ? false : true
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function address() {
		$json = array();

		if (!empty($this->request->get['address_id'])) {
			$this->load->model('sale/customer');

			$json = $this->model_sale_customer->getAddress($this->request->get['address_id']);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function autocompleteParent() {
		$json = array();

		if (isset($this->request->get['p_node'])) {
			if (isset($this->request->get['p_node'])) {
				$p_node = $this->request->get['p_node'];
			} else {
				$p_node = '';
			}

			$this->load->model('sale/customer');

			$filter_data = array(
				'p_node'  => $p_node,
				'start'        => 0,
				'limit'        => 500
			);

			$results = $this->model_sale_customer->getAutoCustomerPackages($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'id_package'       => $result['id_package'],
					'name_package'              => $result['name_package']
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name_package'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function autocompleteCustomer() {
		$json = array();

		if (isset($this->request->get['p_node'])) {
			if (isset($this->request->get['p_node'])) {
				$p_node = $this->request->get['p_node'];
			} else {
				$p_node = '';
			}

			$this->load->model('sale/customer');

			$filter_data = array(
				'p_node'  => $p_node,
				'start'        => 0,
				'limit'        => 500
			);

			$results = $this->model_sale_customer->getAutoCustomer($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'customer_id'       => $result['customer_id'],
					'name_customer'              => $result['name_customer']
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name_customer'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

}
