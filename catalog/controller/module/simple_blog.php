<?php
	class ControllerModuleSimpleBlog extends Controller {
		public function index($setting) {
            
			$this->language->load('module/simple_blog');
			
			$data['heading_title'] = $this->language->get('heading_title');
			
			$this->load->model('simple_blog/article');
			
			$data['articles'] = array();
			
			$this->document->addStyle('catalog/view/theme/default/stylesheet/blog-custom.css');
			$setting['category_id'] = 1;
			$setting['article_limit'] = 4;
			$setting['status'] = 1;
			if ($setting['category_id'] == 'all') {
		    	$data['heading_title'] = $this->language->get('text_latest_all');
				$data['article_link'] = $this->url->link('simple_blog/article');
			} elseif($setting['category_id'] == 'popular') {
				$data['heading_title'] = $this->language->get('text_popular_all');
				$data['article_link'] = $this->url->link('simple_blog/article');
			} else {
				$category_info = $this->model_simple_blog_article->getCategory($setting['category_id']);
				$data['heading_title'] = $category_info['name'];
				$data['article_link'] = $this->url->link('simple_blog/simple_category', 'simple_blog_category_id=' . $setting['category_id']);
			}

			if ($setting['category_id'] == 'all') {	
				$filter_data = array(
					'start'           => 0,
					'limit'           => $setting['article_limit'] 
				);
				
			$results = $this->model_simple_blog_article->getArticleModuleWise($filter_data);	
				
			} else if($setting['category_id'] == 'popular') { 
				$filter_data = array(
					'start'           => 0,
					'limit'           => $setting['article_limit'] 
				);
				
				$results = $this->model_simple_blog_article->getPopularArticlesModuleWise($filter_data);
				
			} else {	
				$filter_data = array(
					'filter_category_id' => $setting['category_id'],
					'start'           => 0,
					'limit'           => $setting['article_limit']
				);
			
				$results = $this->model_simple_blog_article->getArticleModuleWise($filter_data);	
			}
            
            if($setting['status']) {                
            
    			foreach($results as $result) {
    				$article_title = utf8_substr(strip_tags(html_entity_decode($result['article_title'], ENT_QUOTES, 'UTF-8')), 0, 60) . '...';
    				$description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 45) . '...';
    				
    				if($result['featured_image']) {
    					$image = HTTP_SERVER . 'image/' . $result['featured_image'];
    				} else if($result['image']) {
    					$image = HTTP_SERVER . 'image/' . $result['image'];
    				} else {
    					$image = $this->model_tool_image->resize('no_image.jpg',90, 70);
    				}
    				
    				// get total comments
    				$total_comments = $this->model_simple_blog_article->getTotalComments($result['simple_blog_article_id']);
    				
    				if($total_comments != 1) {
    					$total_comments .= $this->language->get('text_comments');
    				} else {
    					$total_comments .= $this->language->get('text_comment');
    				}
    				
    				$data['articles'][] = array(
    					'simple_blog_article_id'	=> $result['simple_blog_article_id'],
    					'article_title'		=> $article_title,
    					'author_name'		=> $result['author_name'],
    					'image'				=> $image,
    					'featured_found'	=> '', // $featured_found
    					'date_added'		=> date($this->language->get('text_date_format'), strtotime($result['date_modified'])),
    					'description'		=> $description,
    					'allow_comment'		=> $result['allow_comment'],
    					'total_comment'		=> $total_comments,
    					'href'				=> $this->url->link('simple_blog/article/view', 'simple_blog_article_id=' . $result['simple_blog_article_id'], 'SSL'),
    					'author_href'		=> $this->url->link('simple_blog/author', 'simple_blog_author_id=' . $result['simple_blog_author_id'], 'SSL'),
    					'comment_href'		=> $this->url->link('simple_blog/article/view', 'simple_blog_article_id=' . $result['simple_blog_article_id'] . '#comment-section', 'SSL')
    				);
    			}
            }		
			
			$data['text_no_found'] = $this->language->get('text_no_result');
			
			// content_right
			$category_id_right = 3;
			$category_info_right = $this->model_simple_blog_article->getCategory($category_id_right);
			$data['article_link_right'] = $this->url->link('simple_blog/simple_category', 'simple_blog_category_id=' . $category_id_right);
			
			$filter_data_right = array(
					'filter_category_id' => $category_id_right,
					'start'           => 0,
					'limit'           => 3
				);
			
			$results_right = $this->model_simple_blog_article->getArticleModuleWise($filter_data_right);	
		   
			foreach($results_right as $result_right) {
    			
    			$description_right = utf8_substr(strip_tags(html_entity_decode($result_right['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '...';
    			
    			if($result_right['featured_image']) {
    				$image_right = $this->model_tool_image->resize($result_right['featured_image'], 100, 100);
    			} else if($result_right['image']) {
    				$image_right = $this->model_tool_image->resize($result_right['image'], 100, 100);
    			} else {
    				$image_right = $this->model_tool_image->resize('no_image.jpg', 100, 100);
    			}
    			$article_title_right = utf8_substr(strip_tags(html_entity_decode($result_right['article_title'], ENT_QUOTES, 'UTF-8')), 0, 60) . '...';
    			$data['articles_right'][] = array(
    				'simple_blog_article_id'	=> $result_right['simple_blog_article_id'],
    				'article_title'		=> $article_title_right,
    				'author_name'		=> $result_right['author_name'],
    				'image'				=> $image_right,
    				'featured_found'	=> '', // $featured_found
    				'date_added'		=> date($this->language->get('text_date_format'), strtotime($result['date_modified'])),
    				'description'		=> $description_right,
    				'allow_comment'		=> $result_right['allow_comment'],
    				'href'				=> $this->url->link('simple_blog/article/view', 'simple_blog_article_id=' . $result_right['simple_blog_article_id'], 'SSL'),
    				'author_href'		=> $this->url->link('simple_blog/author', 'simple_blog_author_id=' . $result_right['simple_blog_author_id'], 'SSL'),
    				'comment_href'		=> $this->url->link('simple_blog/article/view', 'simple_blog_article_id=' . $result_right['simple_blog_article_id'] . '#comment-section', 'SSL')
    			);
    		}
			// End content right
			
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/simple_blog.tpl')) {
    			return $this->load->view($this->config->get('config_template') . '/template/module/simple_blog.tpl', $data);
    		} else {
    			return $this->load->view('default/template/module/simple_blog.tpl', $data);
    		}            
		}
	}
?>