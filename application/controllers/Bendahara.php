<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Bendahara extends CI_Controller 
{
        public function statusSeminar()
	{
		$dataGet = $this->bendaharaModel->getDatafullTable('seminar');
		$data = [
			'title' => 'Status Seminar',
			'statusSeminar' => $dataGet
		];
		$this->load->view('bendahara/page/statusSeminar', $data);
	}
}
