<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Search extends MY_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->library('frontpagination');
		$this->load->model('products_model');

		// Load setup
		$this->setPage = $this->setup_model->get_setup(['sort_products', 'pagination_catalog']);
	}
	function index()
	{
		$keyword = '';
		$total = 0;
		if ($this->input->get('keyword')) {
			$keyword = $this->input->get('keyword', TRUE);
			$input = [];
			$input['select'] = 'products.name, products.url, products.image_link as img, products.price, products.discount';
			$input['like'] = ['name' => $keyword];
			$input['where'] = ['products.status' => 1, 'products.timer <=' => now()];
			$total = $this->products_model->get_total($input);
			// Pagination
			$config = $this->frontpagination->config($this->products_model->get_total($input), base_url('tim-kiem'), $this->setPage->pagination_catalog, $_GET, base_url('tim-kiem'), 2);
			$this->pagination->initialize($config);
			$segment = intval($this->uri->segment(2)) == 0 ? 0 : ($this->uri->segment(2) * $config['per_page']) - $config['per_page'];
			// Pagination
			$this->data['phantrang'] = $this->pagination->create_links();
			$input['order'] = check_sort($this->setPage->sort_products, 'products');
			$input['order1'] = ['id', 'desc'];
			$input['limit'] = [$config['per_page'], $segment];
			$this->data['list'] = $this->products_model->get_list($input);
		}
		$this->data['total'] = $total;
		// SEO =================================================
		$this->data['url'] = base_url('tim-kiem');
		$this->data['title'] = val_seo('', 'Kết quả tìm kiếm: ' . $keyword);
		$this->data['description'] = val_seo('', 'Kết quả tìm kiếm: ' . $keyword);
		$this->data['keywords'] = val_seo('', 'Kết quả tìm kiếm: ' . $keyword);
		// Breadcrumb =========================================
		$this->mybreadcrumb->add('Trang chủ', base_url());
		$this->mybreadcrumb->add('Tìm kiếm', base_url('tim-kiem'));
		$this->data['breadcrumb'] = $this->mybreadcrumb->render();
		// View
		$this->data['temp'] = 'site/search/index';
		$this->load->view('site/layout', $this->data);
	}
}
