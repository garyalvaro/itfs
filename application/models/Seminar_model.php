<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Seminar_model extends CI_Model
{
        public function register_data($data)
        {
                $this->db->insert('seminar', $data);
                return TRUE;
        }
        
        public function getKode($identitas)
        {
                $this->db->where('identitas', $identitas);
                $result=$this->db->get('seminar');
                if($result->num_rows()==1)
                        return $result->row(0)->kode_seminar;
                else
                        return false;
        }
        
        public function registered_update($kode_seminar, $data)
        {
                $this->db->where('kode_seminar', $kode_seminar);
                $this->db->update('seminar', $data);
        }
}

?>