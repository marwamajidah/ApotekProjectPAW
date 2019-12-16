<?php

defined('BASEPATH') OR exit('No direct script access allowed');



class C_admin extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('role_id') !== '1') {
			redirect('auth');
		}
		$this->load->library('form_validation');
		$this->load->model('m_admin');
	}

	public function index()
	{
		// $this->load->view('layout/header');
		// $this->load->view('layout/sidebar');
		// $this->load->view('admin/v_admin');
		// $this->load->view('layout/footer');
		$this->load->view('admin/dashboard');
		$this->load->view('admin/index_view');
	}

	public function transaksi($kode = NULL){
		//$this->cekLogin();
	
		if($kode == NULL){
		  $data['transaksi'] = $this->m_admin->getPemesanan();
	
		  $data['view_name'] = 'transaksi';
		  $this->load->view('admin/index_view', $data);
		}
		else {
		  $data['pemesanan'] = $this->m_admin->getPemesananByKode($kode);
		  $data['detail_pemesanan'] = $this->m_admin->getDetailPemesanan($kode);
		  $data['pembeli'] = $this->m_admin->getDetailPembeliByPemesanan($kode);
	
		  $data['view_name'] = 'transaksi_detail';
		  $this->load->view('admin/index_view', $data);
		}
	  }

	public function obat(){
		//$this->cekLogin();
	
		$data['view_name'] = 'obat';
		$this->load->view('admin/index_view', $data);
	  }
	
	public function daftar_obat(){
		//$this->cekLogin();
	
		$data['obat'] = $this->home_model->getObat();
	
		//didapat dari penghapusan obat
		$data['message'] = $this->session->flashdata('msg');
	
		$data['view_name'] = 'daftar_obat';
		$this->load->view('admin/index_view', $data);
	  }
	
	public function tambah_obat(){
		//$this->cekLogin();
	
		if($this->input->post('tambah')){
		  if($this->m_admin->insertObat())
			$this->session->set_flashdata('msg', '<div class="alert alert-success">Obat '. $this->input->post('nama') .' berhasil dimasukkan kedalam database</div>');
		  else
			$this->session->set_flashdata('msg', '<div class="alert alert-danger"><b>Terjadi kesalahan</b>, obat gagal dimasukkan kedalam database</div>');
		  redirect(site_url('c_admin/obat/tambah'));
		}
		else {
		  $data['message'] = $this->session->flashdata('msg');
	
		  $data['view_name'] = 'tambah_obat';
		  $this->load->view('admin/index_view', $data);
		}
	}
	
	public function edit_obat($kode){
		//$this->cekLogin();
	
		if($this->input->post('edit')){
		  if($this->m_admin->updateObat($kode))
			$this->session->set_flashdata('msg', '<div class="alert alert-success">Obat dengan kode <b>'.$kode .'</b> berhasil diupdate</div>');
		  else
			$this->session->set_flashdata('msg', '<div class="alert alert-danger"><b>Terjadi kesalahan</b>, obat '. $kode .' gagal diupdate</div>');
		  redirect(site_url('c_admin/obat/daftar/'.$kode));
		}
		else {
		  $data['obat'] = $this->home_model->getObat($kode);
		  $data['message'] = $this->session->flashdata('msg');
	
		  $data['view_name'] = 'edit_obat';
		  $this->load->view('admin/index_view', $data);
		}
	  }
	
	public function hapus_obat($kode){
		//$this->cekLogin();
	
		if($this->m_adminl->deleteObat($kode)){
		  $this->session->set_flashdata('msg', '<div class="alert alert-success text-center">Obat dengan kode <mark>'. $kode ."'</mark> berhasil dihapus</div>");
		  redirect(site_url('c_admin/obat/daftar'));
		}
		else{
		  $this->session->set_flashdata('msg', '<div class="alert alert-danger text-center">Obat dengan kode <mark>'. $kode ."</mark> gagal dihapus</div>");
		  redirect(site_url('c_admin/obat/daftar'));
		}
	}

	public function logout()
	{
		$this->session->sess_destroy();
	    redirect('');
	}
}
