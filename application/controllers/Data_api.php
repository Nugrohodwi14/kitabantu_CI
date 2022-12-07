<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Data_api extends CI_Controller {

    function __construct(){
        parent::__construct();
        $this->load->model('mymodel');
    }

    function index(){
        //$relawan = $this->mymodel->Get('relawan');
        //$relawan = $this->db->query('SELECT username,email FROM relawan')->result();

        $id_relawan = $this->input->Get('id_relawan');
        if($id_relawan == ''){ //tidak ada id relawan
            $relawan = $this->mymodel->Get('relawan');
        }
        else{
            $relawan = $this->mymodel->GetWhere('relawan',array('id_relawan'=>$id_relawan));
        }
        echo json_encode($relawan);
    }

    function daftar_relawan(){
        $data = array(
            'username' => $this->input->post('username'),
            'email' => $this->input->post('email'),
            'password' => md5($this->input->post('password'))
        );

        $query = $this->mymodel->Insert('relawan', $data);

        if($query){
            $hasil = array('status'=>'berhasil daftar relawan');
            echo json_encode($hasil);
        }
        else{
            $hasil = array('status'=>'gagal daftar relawan');
            echo json_encode($hasil);
        }
    }

    function update_username_relawan(){
        $data = array(
            'username' => $this->input->post('username')
        );

        $where = array(
            'id_relawan' => $this->input->post('id_relawan')
        );

        $query = $this->mymodel->Update('relawan',$data,$where);
        if($query){
            $hasil = array('status'=>'berhasil edit username relawan');
            echo json_encode($hasil);
        }
        else{
            $hasil = array('status'=>'gagal edit username relawan');
            echo json_encode($hasil);
        }
    }

    function hapus_relawan($id_relawan){
        $id_relawan = array(
            'id_relawan' => $id_relawan
        );

        $query = $this->mymodel->Delete('relawan',$id_relawan);
        if($query){
            $hasil = array('status'=>'berhasil hapus  relawan');
            echo json_encode($hasil);
        }
        else{
            $hasil = array('status'=>'gagal hapus relawan');
            echo json_encode($hasil);
        }
    }
}
?>