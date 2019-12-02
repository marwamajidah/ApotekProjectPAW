<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cashier extends CI_Controller {
  public function __construct(){
    parent::__construct();
    $this->load->model('cashier_model');
    $this->load->model('home_model');
  }

  //cek apakah cashier sudah login
  private function cekLogin(){
    if(!$this->session->userdata('login_user')){
      redirect(site_url('login'));
    }
  }

  public function index(){
    $this->cekLogin();

    $data['view_name'] = 'dashboard';
    $this->load->view('admin/index_view', $data);
  }

  public function login(){
    if($this->session->userdata('login_user'))
      redirect(site_url('cashier'));

    if($this->input->post('login')){
      $username = $this->input->post('username');
      $password = $this->input->post('password');

      //jika cashier terdaftar
      if($this->cashier_model->checkUser($username, $password, $role)->num_rows() > 0){
        $cashier = $this->cashier_model->getUser($username);

        $data_session = array(
          'login_user' => true,
          'username'    => $cashier->username,
          'nama'        => $cashier->nama
        );

        $this->session->set_userdata($data_session);
        redirect(site_url('admin'));
      }
      else {
        $message = '<div class="alert alert-danger">Username atau password salah</div>';
        $this->session->set_flashdata('msg', $message);
      }
    }
    else {
      $data['message'] = $this->session->flashdata('msg');
      $this->load->view('admin/login', $data);
    }
  }

  public function logout(){
    $this->session->sess_destroy();
    redirect(site_url('admin'));
  }

  public function transaksi($kode = NULL){
    $this->cekLogin();

    if($kode == NULL){
      $data['transaksi'] = $this->cashier_model->getPemesanan();

      $data['view_name'] = 'transaksi';
      $this->load->view('admin/index_view', $data);
    }
    else {
      $data['pemesanan'] = $this->cashier_model->getPemesananByKode($kode);
      $data['detail_pemesanan'] = $this->cashier_model->getDetailPemesanan($kode);
      //$data['pembeli'] = $this->admin_model->getDetailPembeliByPemesanan($kode);

      $data['view_name'] = 'transaksi_detail';
      $this->load->view('admin/index_view', $data);
    }
  }

  public function obat(){
    $this->cekLogin();

    $data['view_name'] = 'obat';
    $this->load->view('admin/index_view', $data);
  }

  public function daftar_obat(){
    $this->cekLogin();

    $data['obat'] = $this->home_model->getObat();

    $data['view_name'] = 'daftar_obat';
    $this->load->view('admin/index_view', $data);
  }

}
