<?php
class ModelExtensionFaq extends Model {
	public function addfaq($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "faq set date_added = NOW(), name = '" . $data['name'] . "', email = '" .$data['email'] . "', status = '" . (int)$data['status'] . "'");
		
       	$faq_id = $this->db->getLastId();
		
		foreach ($data['faq'] as $key => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX ."faq_description SET faq_id = '" . (int)$faq_id . "', 
            language_id = '" . (int)$key . "', question = '" . $this->db->escape($value['question']) . "', 
            answer = '" . $this->db->escape($value['answer']) . "'");
           }
		
		
	}
	
	public function editfaq($faq_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "faq SET  status = '" . (int)$data['status'] . "',name = '" . $data['name'] . "',email = '" . $data['email'] . "' WHERE faq_id = '" . (int)$faq_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "faq_description WHERE faq_id = '" . (int)$faq_id. "'");
		
		foreach ($data['faq'] as $key => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX ."faq_description SET faq_id = '" . (int)$faq_id . "', language_id = '" . (int)$key . "', question = '" . $this->db->escape($value['question']) . "', answer = '" . $this->db->escape($value['answer']) . "'");
		}
		
		
	}
	
	public function getfaq($faq_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq WHERE faq_id = '" . (int)$faq_id . "'"); 
 
		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}
   
	public function getfaqdescription($faq_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq_description WHERE faq_id = '" . (int)$faq_id . "'"); 
		
		foreach ($query->rows as $result) {
			$faq_description[$result['language_id']] = array(
				'question'       			=> $result['question'],
				'answer' 			=> $result['answer']
			);
		}
		
		return $faq_description;
	}
 
	public function getAllfaq($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "faq n LEFT JOIN " . DB_PREFIX . "faq_description nd ON n.faq_id = nd.faq_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ";
		
       
       $implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "nd.question LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		
		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(n.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}
       
       
        
		if (isset($data['start']) && isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}
			
			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
		
			$sql .= " ORDER BY date_added DESC LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}	
		
		$query = $this->db->query($sql);
 
		return $query->rows;
	}
   
	public function deletefaq($faq_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "faq WHERE faq_id = '" . (int)$faq_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "faq_description WHERE faq_id = '" . (int)$faq_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'faq_id=" . (int)$faq_id. "'");
	}
   
	public function getTotalfaq($data) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "faq n LEFT JOIN " . DB_PREFIX . "faq_description nd ON n.faq_id = nd.faq_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ";
		
        $implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "nd.question LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		
		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(n.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
		   $sql .= " AND " . implode(" AND ", $implode);
		}
        
       	$query = $this->db->query($sql);

		return $query->row['total'];
	}
}