<?php

defined('BASEPATH') OR exit('No direct script access allowed');



class C_cashier extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('role_id') !== '2') {
			redirect('auth');
		}
		$this->load->library('form_validation');
		$this->load->model('m_cashier');
	}

	public function index()
	{
		// $this->load->view('layout/header');
		// $this->load->view('layout/sidebar');
		// $this->load->view('admin/v_admin');
		// $this->load->view('layout/footer');
		$this->load->view('cashier/dashboard');
		$this->load->view('cashier/index_view');
	}

	public function transaksi($kode = NULL){
		//$this->cekLogin();
	
		if($kode == NULL){
		  $data['transaksi'] = $this->m_cashier->getPemesanan();
	
		  $data['view_name'] = 'transaksi';
		  $this->load->view('cashier/index_view', $data);
		}
		else {
		  $data['pemesanan'] = $this->m_cashier->getPemesananByKode($kode);
		  $data['detail_pemesanan'] = $this->m_cashier->getDetailPemesanan($kode);
		  $data['pembeli'] = $this->m_cashier->getDetailPembeliByPemesanan($kode);
	
		  $data['view_name'] = 'transaksi_detail';
		  $this->load->view('cashier/index_view', $data);
		}
	  }

	public function obat(){
		//$this->cekLogin();
	
		$data['view_name'] = 'obat';
		$this->load->view('cashier/obat', $data);
	  }
	
	public function daftar_obat(){
		//$this->cekLogin();
	
		$data['obat'] = $this->home_model->getObat();
	
		//didapat dari penghapusan obat
		$data['message'] = $this->session->flashdata('msg');
	
		$data['view_name'] = 'daftar_obat';
		$this->load->view('cashier/daftar_obat', $data);
	  }

	public function logout()
	{
		$this->session->sess_destroy();
	    redirect('');
	}
}
