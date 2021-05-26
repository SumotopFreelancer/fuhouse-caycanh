<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Pagehome extends MY_Controller
{
	function __construct()
	{
		parent::__construct();
	}
	function index()
	{
		if ($this->input->post()) {
			$data = [
				'homeProduct1' => json_encode([
					'title' => $this->input->post('homeProduct1Title', TRUE),
					'intro' => $this->input->post('homeProduct1Intro', TRUE)
				]),
				'homeProduct2' => json_encode([
					'title' => $this->input->post('homeProduct2Title', TRUE),
					'intro' => $this->input->post('homeProduct2Intro', TRUE)
				]),
				'homeAbout' => json_encode([
					'img' => $this->input->post('homeAboutImg', TRUE),
					'title' => $this->input->post('homeAboutTitle', TRUE),
					'link' => $this->input->post('homeAboutLink', TRUE),
					'video' => checkYoutube($this->input->post('homeAboutVideo', TRUE)),
					'content' =>  $this->input->post('homeAboutContent', TRUE)
				]),
				'seo' => json_encode([
					'title' => $this->input->post('title_seo', TRUE),
					'description' => $this->input->post('description_seo', TRUE),
					'keyword' => $this->input->post('keyword_seo', TRUE),
					'image_link' => $this->input->post('image_link_seo')
				])
			];
			foreach ($data as $key => $row) {
				if ($this->setup_model->update_rule(['col' => $key], ['value' => $row])) {
					$this->session->set_flashdata('message', '<div class="callout callout-success">Chỉnh sửa thành công</div>');
				} else {
					$this->session->set_flashdata('message', '<div class="callout callout-danger">Không chỉnh sửa được</div>');
				}
			}
			redirect(admin_url('pagehome'));
		}
		$this->data['temp'] = 'admin/pagehome/index';
		$this->load->view('admin/main', $this->data);
		$this->db->cache_delete_all();
	}
}
