<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Home extends My_Controller
{

	function __construct()
	{
		parent::__construct();
	}
	function index()
	{
		$this->data['temp'] = 'admin/home/index';
		$this->load->view('admin/main', $this->data);
	}
	// xóa session va dang xuat
	function logout()
	{
		if ($this->session->userdata('admin')) {
			$this->session->unset_userdata('admin');
		}
		redirect(admin_url('login'));
	}
}
