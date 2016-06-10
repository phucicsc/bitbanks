<?php
	class ControllerRoomRoom extends Controller {		
		private $error = array();
		
        public function index() {
            $url = $this->request->get['route'];
            $this->getData();
		}

        
        public function getData() {
            $this->language->load('room/room');

			$this->document->setTitle($this->language->get('heading_title'));
	
			$this->load->model('room/room');
	
			$this->getList();
        }
        
		public function insert() {
			$this->language->load('room/room');
	
			$this->document->setTitle($this->language->get('heading_title'));
	
			$this->load->model('room/room');
	
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				$this->model_room_room->addRoom($this->request->post);
	
				$this->session->data['success'] = $this->language->get('text_success');
	
				$url = '';
	
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
	
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
	
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
	
				$this->response->redirect($this->url->link('room/room', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			}
	
			$this->getForm();
		}
		
		public function update() {
			$this->language->load('room/room');
	
			$this->document->setTitle($this->language->get('heading_title'));
	
			$this->load->model('room/room');
	
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				$this->model_room_room->editRoom($this->request->get['room_id'], $this->request->post);
	
				$this->session->data['success'] = $this->language->get('text_success');
	
				$url = '';
	
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
	
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
	
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
	
				$this->response->redirect($this->url->link('room/room', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			}
	
			$this->getForm();
		}
		
		public function delete() {
			$this->language->load('room/room');
	
			$this->document->setTitle($this->language->get('heading_title'));
	
			$this->load->model('room/room');
	
			if (isset($this->request->post['selected']) && $this->validateDelete()) {
				foreach ($this->request->post['selected'] as $room_id) {
					$this->model_room_room->deleteRoom($room_id);
				}
	
				$this->session->data['success'] = $this->language->get('text_success');
	
				$url = '';
	
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
	
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
	
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
	
				$this->response->redirect($this->url->link('room/room', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			}
	
			$this->getList();
		}
		
		public function getList() {
			
			if (isset($this->request->get['sort'])) {
				$sort = $this->request->get['sort'];
			} else {
				$sort = 'r.name';
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
            
            if (isset($this->request->post['selected'])) {
    			$data['selected'] = (array)$this->request->post['selected'];
    		} else {
    			$data['selected'] = array();
    		}
            
			$url = '';
	
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
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
			);
	
			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('room/room', 'token=' . $this->session->data['token'] . $url, 'SSL'),
				'separator' => ' :: '
			);
			
			$data['insert'] = $this->url->link('room/room/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
			$data['delete'] = $this->url->link('room/room/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
	
			$data['rooms'] = array();
	
			$filter_data = array(
				'sort'  => $sort,
				'order' => $order,
				'start' => ($page - 1) * $this->config->get('config_admin_limit'),
				'limit' => $this->config->get('config_admin_limit')
			);
			
			$room_total = $this->model_room_room->getTotalRooms($filter_data);
			
			$results = $this->model_room_room->getRooms($filter_data);
			
			foreach($results as $result) {
				
				$data['rooms'][] = array(
					'room_id' 	=> $result['id'],
					'name'            	=> $result['name'],
					'nameOffice'        => $result['nameOffice'],
					'name_manager'      => $result['name_manager'],
					'name_vice_president' => $result['name_vice_president'],
					'total_money' => $this->model_room_room->getTotalMoneyOrderByRoom($result['id']),
					'status'      		=> ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
					'selected'        	=> isset($this->request->post['selected']) && in_array($result['id'], $this->request->post['selected']),
					'edit'          	=> $this->url->link('room/room/update', 'token=' . $this->session->data['token'] . '&room_id=' . $result['id'] . $url, 'SSL')
				);				
			}		
			
			$data['heading_title'] = $this->language->get('heading_title');
            
            $data['text_confirm'] = $this->language->get('text_confirm');
			$data['text_no_results'] = $this->language->get('text_no_results');
	
			$data['column_author_name'] = $this->language->get('column_author_name');
			$data['column_status'] = $this->language->get('column_status');
			$data['column_date_added'] = $this->language->get('column_date_added');
			$data['column_action'] = $this->language->get('column_action');	
	
			$data['button_insert'] = $this->language->get('button_insert');
			$data['button_delete'] = $this->language->get('button_delete');
            $data['button_edit'] = $this->language->get('button_edit');
			
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
			
			$url = '';

			if ($order == 'ASC') {
				$url .= '&order=DESC';
			} else {
				$url .= '&order=ASC';
			}
	
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
	
			$data['sort_name'] = $this->url->link('room/room', 'token=' . $this->session->data['token'] . '&sort=sba.name' . $url, 'SSL');
			$data['sort_status'] = $this->url->link('room/room', 'token=' . $this->session->data['token'] . '&sort=sba.status' . $url, 'SSL');
			$data['sort_date_added'] = $this->url->link('room/room', 'token=' . $this->session->data['token'] . '&sort=sba.date_added' . $url, 'SSL');
	
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
	
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
	
			$pagination = new Pagination();
			$pagination->total = $room_total;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('config_admin_limit');
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('room/room', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
	
			$data['pagination'] = $pagination->render();
			
            $data['results'] = sprintf($this->language->get('text_pagination'), ($room_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($room_total - $this->config->get('config_limit_admin'))) ? $room_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $room_total, ceil($room_total / $this->config->get('config_limit_admin')));
            
			$data['sort'] = $sort;
			$data['order'] = $order;
            
            $data['header'] = $this->load->controller('common/header');
    		$data['column_left'] = $this->load->controller('common/column_left');
    		$data['footer'] = $this->load->controller('common/footer');
    
    		$this->response->setOutput($this->load->view('room/room_list.tpl', $data));			
		}		
		
		public function getForm() {
			$data['heading_title'] = $this->language->get('heading_title');
			
            $data['text_form'] = !isset($this->request->get['room_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');            
			$data['text_enabled'] = $this->language->get('text_enabled');
			$data['text_disabled'] = $this->language->get('text_disabled');
			$data['text_clear'] = $this->language->get('text_clear');
            
            $data['help_name'] = $this->language->get('help_name');
			$data['help_adminid'] = $this->language->get('help_adminid');		
			
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_adminid'] = $this->language->get('entry_adminid');
			$data['entry_ctitle'] = $this->language->get('entry_ctitle');
			$data['entry_description'] = $this->language->get('entry_description');
			$data['entry_status'] = $this->language->get('entry_status');
	
			$data['button_save'] = $this->language->get('button_save');
			$data['button_cancel'] = $this->language->get('button_cancel');
			
			$data['token'] = $this->session->data['token'];
			
			if (isset($this->request->get['room_id'])) {
				$data['room_id'] = $this->request->get['room_id'];
			} else {
				$data['room_id'] = 0;
			}
			
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
			} else {
				$data['error_warning'] = '';
			}
			
			if (isset($this->error['name'])) {
				$data['error_name'] = $this->error['name'];
			} else {
				$data['error_name'] = '';
			}
			
			if (isset($this->error['id_vice_president'])) {
				$data['error_id_vice_president'] = $this->error['id_vice_president'];
			} else {
				$data['error_id_vice_president'] = '';
			}
            
			$url = '';

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
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
			);
	
			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('room/room', 'token=' . $this->session->data['token'] . $url, 'SSL'),
				'separator' => ' :: '
			);

			if (isset($this->request->get['room_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
				$room_info = $this->model_room_room->getRoom($this->request->get['room_id']);
			}

			if (isset($this->request->post['room_description'])) {
				$data['room_description'] = $this->request->post['room_description'];
			} elseif (!empty($room_info)) {
				$data['room_description'] = $room_info['description'];
			} else {
				$data['room_description'] = '';
			}

			if (isset($this->request->post['name'])) {
				$data['name'] = $this->request->post['name'];
			} elseif (!empty($room_info)) {
				$data['name'] = $room_info['name'];
			} else {	
				$data['name'] = '';
			}
			if (isset($this->request->post['id_office'])) {
				$data['id_office'] = $this->request->post['id_office'];
			} elseif (!empty($room_info)) {
				$data['id_office'] = $room_info['id_office'];
			} else {	
				$data['id_office'] = '';
			}
			$id_manager = 0;
			if (isset($this->request->post['id_manager'])) {
				$data['id_manager'] = $this->request->post['id_manager'];
			} elseif (!empty($room_info)) {
				$data['id_manager'] = $room_info['id_manager'];
				$id_manager = $room_info['id_manager'];
			} else {	
				$data['id_manager'] = '';
			}
			
			if (isset($this->request->post['id_vice_president'])) {
				$data['id_vice_president'] = $this->request->post['id_vice_president'];
			} elseif (!empty($room_info)) {
				$data['id_vice_president'] = $room_info['id_vice_president'];
			} else {	
				$data['id_vice_president'] = '';
			}
			
			
			if (isset($this->request->post['status'])) {
				$data['status'] = $this->request->post['status'];
			} elseif (!empty($room_info)) {
				$data['status'] = $room_info['status'];
			} else {
				$data['status'] = 0;
			}
			
			$listOffice = $this->model_room_room->getListOffice();
			$data['listOffice'] = $listOffice;
			$data['listCustomer'] = array();
			$data['listCustomerNotManager'] = array();
			$data['totalMoneyOrder'] = 0;
			$totalMoneyOrder = 0;
			if (!isset($this->request->get['room_id'])) {
				$data['action'] = $this->url->link('room/room/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
				$data['create'] = true;
			} else {
				$data['action'] = $this->url->link('room/room/update', 'token=' . $this->session->data['token'] . '&room_id=' . $this->request->get['room_id'] . $url, 'SSL');
				$data['create'] = false;
				$listCustomer = $this->model_room_room->getListCustomerInRoom($this->request->get['room_id']);
				$listCustomerNotManager = $this->model_room_room->getListCustomerInRoomNotManager($this->request->get['room_id'],$id_manager);
				foreach ($listCustomer as &$customer) {
					$customer['money_order'] = $this->model_room_room->getTotalMoneyOrder($customer['customer_id']);
					$totalMoneyOrder += $customer['money_order'];
				}
				$data['totalMoneyOrder'] = $totalMoneyOrder;
				$data['listCustomer'] = $listCustomer;
				$data['listCustomerNotManager'] = $listCustomerNotManager;
			}
			
			$data['cancel'] = $this->url->link('room/room', 'token=' . $this->session->data['token'] . $url, 'SSL');
			
			
            $data['header'] = $this->load->controller('common/header');
  		    $data['column_left'] = $this->load->controller('common/column_left');
            $data['footer'] = $this->load->controller('common/footer');
    
            $this->response->setOutput($this->load->view('room/room_form.tpl', $data));			
		}

		protected function validateForm() {
			if (!$this->user->hasPermission('modify', 'room/room')) {
				$this->error['warning'] = $this->language->get('error_permission');
			}
	
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 255)) {
				$this->error['name'] = $this->language->get('error_name');
			} else {
				// check here whether duplicate name occur or not?
				if(!isset($this->request->get['room_id'])) {
					$found = $this->model_room_room->checkRoomName($this->request->post['name'], 0);
					
					if($found) {
						$this->error['warning'] = $this->language->get('error_author_found');
						$this->error['name'] = $this->language->get('error_author_found');
					}
				} else {
					$found = $this->model_room_room->checkRoomName($this->request->post['name'], $this->request->get['room_id']);
					
					if($found) {
						$this->error['warning'] = $this->language->get('error_author_found');
						$this->error['name'] = $this->language->get('error_author_found');
					}
				}
			}
			
			if(isset($this->request->post['id_manager']) && isset($this->request->post['id_vice_president']) && $this->request->post['id_manager'] == $this->request->post['id_vice_president']) {
				$this->error['id_vice_president'] = "Phó phòng phải khác trưởng phòng";
			}
			
			if($this->error && !isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_warning');
			}
			
			if (!$this->error) {
				return true;
			} else {
				return false;
			}
		}
		
		protected function validateDelete() {
			if (!$this->user->hasPermission('modify', 'room/room')) {
				$this->error['warning'] = $this->language->get('error_permission');
			}
	
			$this->load->model('room/room');
	
			foreach ($this->request->post['selected'] as $blog_author_id) {
				$article_total = $this->model_room_room->getTotalCustomerByRoomId($blog_author_id);
	
				if ($article_total) {
					$this->error['warning'] = sprintf($this->language->get('error_article'), $article_total);
				}	
			}
            
			if (!$this->error) {
				return true;
			} else {
				return false;
			}  
		}
		
		public function autocomplete() {
			$json = array();
			
			if (isset($this->request->get['author_name'])) {
				if (isset($this->request->get['author_name'])) {
					$room_name = $this->request->get['author_name'];
				} else {
					$room_name = '';
				}
                
                if($room_name) {
                    $this->load->model('room/room');
    				$filter_data = array('filter_room' => $room_name);
    				$results = $this->model_room_room->getRooms($filter_data);
    				
    				foreach ($results as $result) {
    										
    					$json[] = array(
    						'room_id' 	=> $result['room_id'],
    						'name'       		=> strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))	
    					);	
    				}	    
                }					
			}
	
			$this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
		}
		
	}
?>