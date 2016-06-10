<?php
class ControllerAccountPersonal extends Controller {
	private $error = array();

	public function index() {
		if (!$this -> customer -> isLogged()) {
			$this -> session -> data['redirect'] = $this -> url -> link('account/personal', '', 'SSL');

			$this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		}

		if ($this -> request -> server['HTTPS']) {
			$server = $this -> config -> get('config_ssl');
		} else {
			$server = $this -> config -> get('config_url');
		}

		$data['base'] = $server;

		$this -> load -> language('account/personal');

		$this -> document -> setTitle($this -> language -> get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array('text' => $this -> language -> get('text_home'), 'href' => $this -> url -> link('common/home'));

		$data['breadcrumbs'][] = array('text' => $this -> language -> get('heading_title'), 'href' => $this -> url -> link('account/personal', '', 'SSL'));

		$data['heading_title'] = $this -> language -> get('heading_title');

		$data['column_left'] = $this -> load -> controller('common/column_left');
		$data['column_right'] = $this -> load -> controller('common/column_right');
		$data['content_top'] = $this -> load -> controller('common/content_top');
		$data['content_bottom'] = $this -> load -> controller('common/content_bottom');
		$data['footer'] = $this -> load -> controller('common/footer');
		$data['header'] = $this -> load -> controller('common/header');
		$data['idCustomer'] = $this -> customer -> getId();
		$this -> load -> model('account/customer');
		$id_user = $data['idCustomer'];
		$user = $this -> model_account_customer -> getCustomer($id_user);

		$data['nameCustomer'] = $this -> customer -> getFirstname();
		$data['telephone'] = $this -> customer -> getTelephone();
		$data['total_left'] = $this -> model_account_customer -> getSumLeft($id_user);
		$data['total_right'] = $this -> model_account_customer -> getSumRight($id_user);
		$data['floor'] = $this -> model_account_customer -> getSumFloor($id_user);
		$data['total'] = $data['total_left'] + $data['total_right'];

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/personal.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/personal.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/personal.tpl', $data));
		}
	}

	public function getInfoCustomer() {
		$id_user = $this -> request -> get['id_user'];

		$this -> load -> model('account/customer');

		$user = $this -> model_account_customer -> getCustomer($id_user);
		$json = array();
		$json['nameCustomer'] = $user['firstname'];
		$json['telephone'] = $user['telephone'];
		$json['total_left'] = $this -> model_account_customer -> getSumLeft($id_user);
		$json['total_right'] = $this -> model_account_customer -> getSumRight($id_user);
		$json['floor'] = $this -> model_account_customer -> getSumFloor($id_user);
		$json['total'] = $json['total_left'] + $json['total_right'];
		$this -> response -> addHeader('Content-Type: application/json');
		$this -> response -> setOutput(json_encode($json));

	}

	public function getJsonBinaryTree() {

		$id_user = $this -> request -> get['id_user'];

		$this -> load -> model('account/customer');

		$user = $this -> model_account_customer -> getCustomerCustom($id_user);

		$node = new stdClass();

		$node -> id = $user['customer_id'];

		$node -> text = $user['username'] ;

		switch (intval($user['level'])) {
			case 1 :
				$node -> iconCls = "level1";
				break;
			case 2 :
				$node -> iconCls = "level2";
				break;
			case 3 :
				$node -> iconCls = "level3";
				break;
			case 4 :
				$node -> iconCls = "level4";
				break;
			case 5 :
				$node -> iconCls = "level5";
				break;
			case 6 :
				$node -> iconCls = "level6";
				break;
		}

		$this -> getBinaryChild($node);

		$node = array($node);

		//	ob_clean();

		echo json_encode($node);

		exit();

	}

	public function getBinaryChild(&$node) {

		$this -> load -> model('account/customer');

		$listChild = $this -> model_account_customer -> getListChild($node -> id);

		$node -> children = array();

		foreach ($listChild as $child) {
			$childNode = new stdClass();

			$childNode -> id = $child['customer_id'];

			$childNode -> text = $child['username'];

			switch ($child['level']) {
				case 1 :
					$childNode -> iconCls = "level1";
					break;
				case 2 :
					$childNode -> iconCls = "level2";
					break;
				case 3 :
					$childNode -> iconCls = "level3";
					break;
				case 4 :
					$childNode -> iconCls = "level4";
					break;
				case 5 :
					$childNode -> iconCls = "level5";
					break;
				case 6 :
					$childNode -> iconCls = "level6";
				break;
			}
			array_push($node -> children, $childNode);

			$this -> getBinaryChild($childNode);

		}
		if (count($node -> children) === 0)
			$node -> children = 0;
		return;

	}

}
