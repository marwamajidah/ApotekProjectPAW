<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cashier_model extends CI_Model {
    public function checkUser($username, $pass, $role){
        $query = "SELECT * FROM user WHERE username = '". $username ."' AND password = '". $pass ."' AND role_id = '". $role ."'";
        return $this->db->query($query);
      }
    
    public function getUser($username){
        $q = "SELECT * FROM admin WHERE username = '". $username ."'";
        $query = $this->db->query($q);
    
        return $query->row();
    }

    public function getPemesananByKode($kode){
        $q = "SELECT * FROM pemesanan WHERE kode_pesan = '". $kode ."'";
        $query = $this->db->query($q);
        return $query->row();
    }
    
    public function getDetailPemesanan($kode){
        $q = "SELECT o.nama, d.jumlah, o.harga, (d.jumlah * o.harga) AS subtotal
              FROM detail_pemesanan d, obat o
              WHERE d.kode_obat = o.kode_obat
                AND d.kode_pesan = '". $kode ."'";
    
        $query = $this->db->query($q);
        return $query->result();
      }

    public function getDetailPembeliByPemesanan($kode){
        $q = "SELECT nama FROM pembeli WHERE id = (
                SELECT id_pemesan FROM pemesanan WHERE kode_pesan = '$kode'
              )";
        $query = $this->db->query($q);
        return $query->row();
      }
}