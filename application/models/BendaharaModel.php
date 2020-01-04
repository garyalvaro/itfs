<?php
define('PUBPATH',str_replace(SELF,'',FCPATH)); // added
defined('BASEPATH') OR exit('No direct script access allowed');

class BendaharaModel extends CI_Model 
{
        public function getDatafullTable($table){
		$data = $this->db->get($table)->result();
		return $data;
	}
}
?>
