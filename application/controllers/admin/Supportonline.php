<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Supportonline extends MY_Controller
{
	function __construct()
	{
		parent::__construct();
		redirect();
		$this->load->model('supportonline_model');
	}
	// hien thi danh sach 
	function index()
	{
		// Pagination
		$config = $this->adminpagination->config($this->supportonline_model->get_total(), admin_url('supportonline'), 10, $_GET, admin_url('supportonline'), 3);
		$this->pagination->initialize($config);
		$segment = (intval($this->uri->segment(3)) == 0) ? 0 : ($this->uri->segment(3) * $config['per_page']) - $config['per_page'];
		$this->data['phantrang'] = $this->pagination->create_links();
		// Data
		$input = [];
		$input['limit'] = [$config['per_page'], $segment];
		$this->data['list'] = $this->supportonline_model->get_list($input);
		$this->data['total_rows'] = $config['total_rows'];

		$this->data['temp'] = 'admin/supportonline/index';
		$this->load->view('admin/main', $this->data);
	}
	function add()
	{
		if ($this->input->post()) {
			$this->form_validation->set_rules('name', 'Tên', 'required');
			if ($this->form_validation->run()) {
				$data = [
					'name' => $this->input->post('name', TRUE),
					'phone' => $this->input->post('phone', TRUE),
					'chucdanh' => $this->input->post('chucdanh', TRUE),
					'image_link' => $this->input->post('image_link'),
					'sort_order' => intval($this->input->post('sort_order'))
				];
				if ($this->supportonline_model->create($data)) {
					$this->session->set_flashdata('message', '<div class="callout callout-success">Thêm thành công</div>');
				} else {
					$this->session->set_flashdata('message', '<div class="callout callout-danger">Không thêm được. Thử lại sau</div>');
				}
				redirect(admin_url('supportonline'));
			}
		}
		$this->data['temp'] = 'admin/supportonline/add';
		$this->load->view('admin/main', $this->data);
		$this->db->cache_delete_all();
	}
	function edit()
	{
		$id = intval($this->uri->rsegment('3'));
		$info = $this->supportonline_model->get_info($id);
		if (!$info) {
			$this->session->set_flashdata('message', '<div class="callout callout-danger">Không tồn tại</div>');
			redirect(admin_url('supportonline'));
		}
		$this->data['info'] = $info;
		if ($this->input->post()) {
			$this->form_validation->set_rules('name', 'Tên', 'required');
			if ($this->form_validation->run()) {
				$data = [
					'name' => $this->input->post('name', TRUE),
					'phone' => $this->input->post('phone', TRUE),
					'chucdanh' => $this->input->post('chucdanh', TRUE),
					'image_link' => $this->input->post('image_link'),
					'sort_order' => intval($this->input->post('sort_order'))
				];
				if ($this->supportonline_model->update($id, $data)) {
					$this->session->set_flashdata('message', '<div class="callout callout-success">Chỉnh sửa thành công</div>');
				} else {
					$this->session->set_flashdata('message', '<div class="callout callout-danger">Không chỉnh sửa được</div>');
				}
				if ($this->input->post('cus_btn_save') == 'Lưu lại') {
					redirect(admin_url('supportonline/edit/' . $id));
				} else {
					redirect(admin_url('supportonline'));
				}
			}
		}
		$this->data['temp'] = 'admin/supportonline/edit';
		$this->load->view('admin/main', $this->data);
		$this->db->cache_delete_all();
	}
	// Xóa
	function delete()
	{
		$id = intval($this->uri->rsegment('3'));
		$this->_del($id, FALSE);
		$this->session->set_flashdata('message', '<div class="callout callout-success">Xóa thành công</div>');
		redirect(admin_url('supportonline'));
		$this->db->cache_delete_all();
	}
	// Xóa nhiều
	function del_all()
	{
		$ids = $this->input->post('ids');
		foreach ($ids as $id) {
			$this->_del($id);
		}
		$this->db->cache_delete_all();
	}
	private function _del($id, $ajax = TRUE)
	{
		$info = $this->supportonline_model->get_info($id);
		if (!$info) {
			if ($ajax) {
				echo '<div class="callout callout-danger">Không tồn tại</div>';
				return FALSE;
			} else {
				$this->session->set_flashdata('message', '<div class="callout callout-danger">Không tồn tại</div>');
				redirect(admin_url('supportonline'));
			}
		}
		if ($this->supportonline_model->delete($id)) {
			echo '<span class="id_delete hidden">' . $id . '</span>';
		}
		$this->db->cache_delete_all();
	}
}
