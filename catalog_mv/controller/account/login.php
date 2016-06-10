<?php
class ControllerAccountLogin extends Controller {
	private $error = array();

	public function index() {
		die('website is updated, please wait');
		//kiem tra user system login
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/dashboard', '', 'SSL'));
		!$this -> request -> get['route'] && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));

		$this -> load -> model('account/customer');

		// Login override for admin users
		if (!empty($this -> request -> get['token'])) {
			$this -> event -> trigger('pre.customer.login');

			$this -> customer -> logout();
			$this -> cart -> clear();

			unset($this -> session -> data['wishlist']);
			unset($this -> session -> data['payment_address']);
			unset($this -> session -> data['payment_method']);
			unset($this -> session -> data['payment_methods']);
			unset($this -> session -> data['shipping_address']);
			unset($this -> session -> data['shipping_method']);
			unset($this -> session -> data['shipping_methods']);
			unset($this -> session -> data['comment']);
			unset($this -> session -> data['order_id']);
			unset($this -> session -> data['coupon']);
			unset($this -> session -> data['reward']);
			unset($this -> session -> data['voucher']);
			unset($this -> session -> data['vouchers']);

			$customer_info = $this -> model_account_customer -> getCustomerByToken($this -> request -> get['token']);

			if ($customer_info && $this -> customer -> login($customer_info['email'], '', true)) {
				// Default Addresses
				$this -> load -> model('account/address');

				if ($this -> config -> get('config_tax_customer') == 'payment') {
					$this -> session -> data['payment_address'] = $this -> model_account_address -> getAddress($this -> customer -> getAddressId());
				}

				if ($this -> config -> get('config_tax_customer') == 'shipping') {
					$this -> session -> data['shipping_address'] = $this -> model_account_address -> getAddress($this -> customer -> getAddressId());
				}

				$this -> event -> trigger('post.customer.login');

				$this -> response -> redirect($this -> url -> link('account/dashboard', '', 'SSL'));
			}
		}

		$this -> load -> language('account/login');
		if ($this -> request -> server['HTTPS']) {
			$server = $this -> config -> get('config_ssl');
		} else {
			$server = $this -> config -> get('config_url');
		}

		$data['base'] = $server;
		$this -> document -> setTitle($this -> language -> get('heading_title'));

		if (($this -> request -> server['REQUEST_METHOD'] == 'POST') && $this -> validate()) {
			unset($this -> session -> data['guest']);

			// Default Shipping Address
			$this -> load -> model('account/address');

			if ($this -> config -> get('config_tax_customer') == 'payment') {
				$this -> session -> data['payment_address'] = $this -> model_account_address -> getAddress($this -> customer -> getAddressId());
			}

			if ($this -> config -> get('config_tax_customer') == 'shipping') {
				$this -> session -> data['shipping_address'] = $this -> model_account_address -> getAddress($this -> customer -> getAddressId());
			}

			// Add to activity log
			$this -> load -> model('account/activity');

			$activity_data = array('customer_id' => $this -> customer -> getId(), 'name' => $this -> customer -> getFirstName() . ' ' . $this -> customer -> getLastName());

			$this -> model_account_activity -> addActivity('login', $activity_data);

			// Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
			if (isset($this -> request -> post['redirect']) && (strpos($this -> request -> post['redirect'], $this -> config -> get('config_url')) !== false || strpos($this -> request -> post['redirect'], $this -> config -> get('config_ssl')) !== false)) {
				$this -> response -> redirect(str_replace('&amp;', '&', $this -> request -> post['redirect']));
			} else {
				$this -> response -> redirect($this -> url -> link('account/dashboard', '', 'SSL'));
			}
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array('text' => $this -> language -> get('text_home'), 'href' => $this -> url -> link('common/home'));

		$data['breadcrumbs'][] = array('text' => $this -> language -> get('text_account'), 'href' => $this -> url -> link('account/exit', '', 'SSL'));

		$data['breadcrumbs'][] = array('text' => $this -> language -> get('text_login'), 'href' => $this -> url -> link('account/login', '', 'SSL'));

		$data['heading_title'] = $this -> language -> get('heading_title');
		$data['text_new_customer'] = $this -> language -> get('text_new_customer');
		$data['text_register'] = $this -> language -> get('text_register');
		$data['text_register_account'] = $this -> language -> get('text_register_account');
		$data['text_returning_customer'] = $this -> language -> get('text_returning_customer');
		$data['text_i_am_returning_customer'] = $this -> language -> get('text_i_am_returning_customer');
		$data['text_forgotten'] = $this -> language -> get('text_forgotten');

		$data['entry_email'] = $this -> language -> get('text_account');
		$data['text_login'] = $this -> language -> get('text_login');
		$data['entry_password'] = $this -> language -> get('entry_password');
		$data['button_continue'] = $this -> language -> get('button_continue');
		$data['button_login'] = $this -> language -> get('button_login');

		if (isset($this -> error['warning'])) {
			$data['error_warning'] = $this -> error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['action'] = $this -> url -> link('account/login', '', 'SSL');
		$data['register'] = $this -> url -> link('account/register', '', 'SSL');
		$data['forgotten'] = $this -> url -> link('account/forgotten', '', 'SSL');
		$data['capcha'] = $this -> url -> link('account/capcha', '', 'SSL');

		// Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
		if (isset($this -> request -> post['redirect']) && (strpos($this -> request -> post['redirect'], $this -> config -> get('config_url')) !== false || strpos($this -> request -> post['redirect'], $this -> config -> get('config_ssl')) !== false)) {
			$data['redirect'] = $this -> request -> post['redirect'];
		} elseif (isset($this -> session -> data['redirect'])) {
			$data['redirect'] = $this -> session -> data['redirect'];

			unset($this -> session -> data['redirect']);
		} else {
			$data['redirect'] = '';
		}

		if (isset($this -> session -> data['success'])) {
			$data['success'] = $this -> session -> data['success'];

			unset($this -> session -> data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this -> request -> post['email'])) {
			$data['email'] = $this -> request -> post['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this -> request -> post['password'])) {
			$data['password'] = $this -> request -> post['password'];
		} else {
			$data['password'] = '';
		}

		//	$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this -> load -> controller('common/column_right');
		$data['content_top'] = $this -> load -> controller('common/content_top');
		$data['content_bottom'] = $this -> load -> controller('common/content_bottom');

		//load header footer temaplte

		$data['footer'] = $this -> load -> controller('common/footer');
		$data['header'] = $this -> load -> controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/login.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/login.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/login.tpl', $data));
		}
	}

	protected function validate() {

		function myHasLogin($email, $password, $self) {
			if (!$self -> login($email, $password))
				return true;
			return false;
		};

		function myHasLoginLimit($email, $self, $selfConfig) {
			$login_info = $self -> getLoginAttempts($email);
			if ($login_info && ($login_info['total'] >= $selfConfig -> get('config_login_attempts')) && strtotime('-1 hour') < strtotime($login_info['date_modified'])) {
				return false;
			}
			return false;
		};

		$this -> event -> trigger('pre.customer.login');

		// kiem tra gioi hang login cua 1 tai khoan.
		if (call_user_func_array("myHasLoginLimit", array($this -> request -> post['email'], $this -> model_account_customer, $this -> config))) {
			$this -> error['warning'] = $this -> language -> get('error_attempts');

		}

		// Check if customer has been approved.
		$customer_info = $this -> model_account_customer -> getCustomerByUsername($this -> request -> post['email']);

		if ($customer_info && !$customer_info['status']) {
			$this -> error['warning'] = $this -> language -> get('error_approved');
		}

		if ($this -> request -> post['capcha'] !== $_SESSION['cap_code']) {
			$this -> error['warning'] = "Warning: No match for Capcha Image.";
		}

		if (!$this -> error) {
			if (call_user_func_array("myHasLogin", array($this -> request -> post['email'], $this -> request -> post['password'], $this -> customer))) {
				$this -> error['warning'] = $this -> language -> get('error_login');
				$this -> model_account_customer -> addLoginAttempt($this -> request -> post['email']);
			} else {
				$this -> model_account_customer -> deleteLoginAttempts($this -> request -> post['email']);
				$this -> event -> trigger('post.customer.login');
			}
		}

		return !$this -> error;
	}

}
?>