<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller 
{

  public function index()
  {
    $this->load->view('auth/login');
  }

  public function ceklog(){
    $username = $this->input->post('username');
    $password = $this->input->post('password');
    $this->load->model('model_userLog');
    $this->model_userLog->ver($username,$password);
  }

  public function logout()
  {
    $this->session->sess_destroy();
    redirect('');
  }

}