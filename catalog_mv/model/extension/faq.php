<?php
class ModelExtensionFaq extends Model {	
	
 
	public function getAllFaq($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "faq n LEFT JOIN " . DB_PREFIX . "faq_description nd ON n.faq_id = nd.faq_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n.status = '1' ORDER BY date_added DESC";
		
		if (isset($data['start']) && isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}
			
			if ($data['limit'] < 1) {
				$data['limit'] = 10;
			}	
		
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}	
		
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	
	public function getTotalFaq() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "faq where status=1");
	
		return $query->row['total'];
	}
	
	public function addfaq($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "faq set date_added = NOW(), name = '" . $data['name'] . "', email = '" .$data['email'] . "', status = '0'");
		
       	$faq_id = $this->db->getLastId();
		
		$this->db->query("INSERT INTO " . DB_PREFIX ."faq_description SET faq_id = '" . (int)$faq_id . "', 
            language_id = '2', question = '" . $this->db->escape($data['question']) . "', 
            answer = ''");
		$this->db->query("INSERT INTO " . DB_PREFIX ."faq_description SET faq_id = '" . (int)$faq_id . "', 
            language_id = '1', question = '" . $this->db->escape($data['question']) . "', 
            answer = ''");
		
	}
}