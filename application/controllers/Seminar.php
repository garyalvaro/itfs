<?php
defined('BASEPATH') OR exit('No direct script access allowed');

//Time Zone GMT+7
date_default_timezone_set('Asia/Jakarta');

class Seminar extends CI_Controller { 
        
        //Ganti Variabel di View
        protected $judul_seminar = 'Judul Seminar (set dari controller)';
        protected $nama_pembicara = 'Nama pembicara (set dari controller)';
        protected $tulisan_seminar = "
                Sepatah dua patah kata kata seminar. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero, accusamus, sed, necessitatibus ea nemo hic molestias amet tempora fuga pariatur officia itaque eum quis rerum aliquam minus illo nulla laborum! <br>
                 (set dari controller)
        ";
        
        public function __construct()
	{
		parent::__construct();
		$this->load->model('Seminar_model');
        }
        
	public function index()
	{
                $this->session->unset_userdata('identitas');
                redirect('Home');
	}
        
        //Pengguna baru yg mau daftar
        public function register()
        {
                //Generate kode_seminar
                $huruf_random = substr(str_shuffle('ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 0, 4);
                $tanggal_waktu = date('dmHis');
                                
                if($this->input->post('submit'))
                {
                        $kode_seminar = "ITF-".$huruf_random."-".$tanggal_waktu;
                        $data = array(
                                'kode_seminar' => $kode_seminar,
                                'nama' => $this->input->post('nama'),
                                'email' => $this->input->post('email'),
                                'telepon' => $this->input->post('telepon'),
                                'identitas' => $this->input->post('identitas'),
                                'tgl_lahir' => $this->input->post('tgl_lahir'),
                                'path_bukti' => NULL,
                                'status_pembayaran' => '0'
                        );
                        //Buat nomor identitas ke session
                        $this->session->set_userdata(['identitas' => $this->input->post('identitas') ]);
                        
                        if($this->Seminar_model->register_data($data))
                        {
                                $this->session->set_flashdata('regis_berhasil','Registrasi Berhasil');
                                redirect('Seminar/bayar');
                        }
                }
                else
                {
                        $data = [
                                'judul_seminar' => $this->judul_seminar,
                                'nama_pembicara' => $this->nama_pembicara,
                                'tulisan_seminar' => $this->tulisan_seminar
                        ];
                        $this->load->view('seminar/form_register', $data);
                }
                
        }
        
        //Page 'Bayar Sekarang' atau 'Bayar Nanti'
        public function bayar()
        {
                $this->load->view('seminar/page_bayar');
        }
        
       //Page 'Masukkan Nomor Identitas'
        public function registered()
        {        
                $data = [
                        'judul_seminar' => $this->judul_seminar,
                        'nama_pembicara' => $this->nama_pembicara,
                        'tulisan_seminar' => $this->tulisan_seminar
                ];
                $this->load->view('seminar/form_registered', $data);             
        }
        
        //Page upload bukti pembayaran
        public function upload_bukti()
        {
                $data['identitas'] = $this->input->post('identitas');
                $kode_seminar = $this->Seminar_model->getKode($data['identitas']);
                        
                $config['upload_path']       = './assets/seminar_assets/foto_bukti/';
                $config['allowed_types']    = 'jpg';
                $config['file_name']            = $kode_seminar;
                $config['overwrite']		= true;
                $config['max_size']             = 1024; // 1MB
                
                $this->load->library('upload', $config);
                
                if ( !$this->upload->do_upload('path_bukti') )
                {
                        $this->session->set_flashdata('error_upload', $this->upload->display_errors());
                        redirect('Seminar/registered');
		}
                else
                {
                        $data = array(
                                "path_bukti" => base_url()."assets/seminar_assets/foto_bukti/".$kode_seminar.".jpg"
                        );

                        $this->Seminar_model->registered_update($kode_seminar, $data);
                        $this->session->set_flashdata('upload_berhasil','Upload Berhasil');
                        $this->session->unset_userdata(['identitas' => $this->input->post('identitas') ]);
                        redirect('Seminar/register');
                        //echo "Bayar Berhasil";
		}
        }
        
        
}
