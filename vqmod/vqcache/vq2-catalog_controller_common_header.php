<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		$data['title'] = $this->document->getTitle();

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');

		if ($this->config->get('config_google_analytics_status')) {
			$data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		} else {
			$data['google_analytics'] = '';
		}

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$data['icon'] = $server . 'image/logo.png';
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');
		$this->load->language('common/footer');

		$data['text_home'] = $this->language->get('text_home');
		$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');
		$data['text_contact'] = $this->language->get('text_contact');

		$data['home'] = $this->url->link('account/login');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['account_edit'] = $this->url->link('account/edit', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');
		
		$this->load->language('account/login');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['button_login'] = $this->language->get('button_login');
		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}
		$data['action_login'] = $this->url->link('account/login', '', 'SSL');

		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// Menu
		/*
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		
				
				if(isset($this->request->get['route'])) {
					$route = $this->request->get['route'];
				} else {
					$route = 'common/home';
				}
				
				$route = explode("/", $route);
                
				if($this->config->get('simple_blog_status')) {
    				$this->load->model('simple_blog/article');
    				
    				$count = $this->model_simple_blog_article->getTotalCategories(0);
                }
    				
				if($route[0] == 'simple_blog' && $count && $this->config->get('simple_blog_display_category') && $this->config->get('simple_blog_status')) {
					
					$categories = $this->model_simple_blog_article->getCategories(0);
					
					foreach ($categories as $category) {
						if ($category['top']) {
							// Level 2
							$children_data = array();

							$children = $this->model_simple_blog_article->getCategories($category['simple_blog_category_id']);
							
							foreach ($children as $child) {
								
								$article_total = $this->model_simple_blog_article->getTotalArticles($child['simple_blog_category_id']);
			
								$children_data[] = array(
									'name'  => $child['name'],
									'href'  => $this->url->link('simple_blog/category', 'simple_blog_category_id=' . $category['simple_blog_category_id'] . '_' . $child['simple_blog_category_id'])
								);						
							}
							
							// Level 1
							$data['categories'][] = array(
								'name'     => $category['name'],
								'children' => $children_data,
								'column'   => $category['blog_category_column'] ? $category['blog_category_column'] : 1,
								'href'     => $this->url->link('simple_blog/category', 'simple_blog_category_id=' . $category['simple_blog_category_id'])
							);						
						}
					}
										
				} else {
					$categories = $this->model_catalog_category->getCategories(0);
					
					foreach ($categories as $category) {
						if ($category['top']) {
							// Level 2
							$children_data = array();
			
							$children = $this->model_catalog_category->getCategories($category['category_id']);
			
							foreach ($children as $child) {
								$filter_data = array(
									'filter_category_id'  => $child['category_id'],
									'filter_sub_category' => true
								);
			
								$product_total = $this->model_catalog_product->getTotalProducts($filter_data);
			
								$children_data[] = array(
									'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
									'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
								);						
							}
			
							// Level 1
							$data['categories'][] = array(
								'name'     => $category['name'],
								'children' => $children_data,
								'column'   => $category['column'] ? $category['column'] : 1,
								'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
							);
						}
					}
				}			
			






























		*/
		
		// KDung add
		$this->load->model('simple_blog/article');
		$data['categories'] = array();
		$categories = $this->model_simple_blog_article->getCategories(0);
		foreach ($categories as $category) {
			$data['categories'][] = array(
					'simple_blog_category_id' => $category['simple_blog_category_id'],
					'name'     => $category['name'],
					'href'     => $this->url->link('simple_blog/category', 'simple_blog_category_id=' . $category['simple_blog_category_id'])
				);
		}
		// End KDung add

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');
		$data['content_top'] = $this->load->controller('common/content_top');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
		} else {
			return $this->load->view('default/template/common/header.tpl', $data);
		}
	}
}