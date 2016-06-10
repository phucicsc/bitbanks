<?php
class ControllerAccountBinary extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/binary', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}
		
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;

		$this->load->language('account/binary');

		$this->document->setTitle($this->language->get('heading_title'));


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/binary', '', 'SSL')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		$data['customer_id'] = $this->customer->getId();
		if(isset($this->request->get['customer_id'])){
			$customer_id = $this->request->get['customer_id'];
			$data['customer_id'] = customer_id;
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/binary.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/binary.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/binary.tpl', $data));
		}
	}

	public function getJsonBinaryTreeUplevel(){

		$this->load->model('account/customer');

		$id_user = $this->customer->getId();
		$id = $this->request->get['id'];

		if($id == $id_user)

			$this->getJsonBinaryTree($id_user);

		else{

			$user = $this->model_account_customer->getInfoUsers($id);

			$this->getJsonBinaryTree($user->p_binary);

		}

	}

	public function goBottomLeft(){

		$this->load->model('account/customer');


		$id = $this->customer->getId();

		$current = $id;

		while($left = $this->model_account_customer->getLeft($current))	

			$current = $left;

		for($i=0;$i<5;$i++){

			$top =  $this->model_account_customer->getBParent($current);

			$current = $top;

			if($top == $id) break;

		}

		$this->getJsonBinaryTree($top);

	}


	public function goBottomRight(){

		$this->load->model('account/customer');


		$id = $this->customer->getId();

		$current = $id;

		while($right = $this->model_account_customer->getRight($current))	

			$current = $right;

		for($i=0;$i<5;$i++){

			$top =  $this->model_account_customer->getBParent($current);

			$current = $top;

			if($top == $id) break;

		}

		$this->getJsonBinaryTree($top);
	}	

	public function getJsonBinaryTree($id=0){

		$this->load->model('account/customer');
		
		$id = $this->request->get['id'];
		if(!isset($id)){
			$id = $this->customer->getId();
		}

		$user = $this->model_account_customer->getInfoUsers($id);
		$node = new stdClass();

		$node->id = $user["customer_id"];

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
		$this->load->model('account/customer');
		$left_row = $this->model_account_customer->getLeftO($node->id);
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

		$right_row = $this->model_account_customer->getRightO($node->id);
		
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
		
		$this->load->model('account/customer');

		$user = $this->model_account_customer->getInfoUsers($id);

		$user['total_left'] = $this->model_account_customer->getSumLeft($id);	

		$user['total_right'] = $this->model_account_customer->getSumRight($id);
		
		$user['floor'] = $this->model_account_customer->getSumFloor($id);
		
		$user['total'] = $user['total_left'] + $user['total_right'];
		echo json_encode($user);

		exit();

	}

}