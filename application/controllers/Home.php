<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Home extends MY_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('catalog_model');
		$this->load->model('products_model');
		$this->load->model('slide_model');
		// Load setup
		$this->setPage = $this->setup_model->get_setup(['homeProduct1', 'homeProduct2', 'homeAbout', 'seo', 'sort_products', 'sort_catalog']);
	}

	function index()
	{
		// Slide
		$input = [];
		$input['select'] = 'image_link as img, link, name';
		$input['order'] = ['sort_order', 'asc'];
		$this->data['slides'] = $this->slide_model->get_list($input);

		// Home Product 1
		$input = [];
		$input['select'] = 'name, url, image_link as img, price, discount';
		$input['where'] = ['status' => 1, 'home' => 1, 'timer <=' => now()];
		$input['order'] = check_sort($this->setPage->sort_products);
		$input['order1'] = ['id', 'desc'];
		$input['limit'] = [4, 0];
		$this->data['homeProduct1'] = $this->products_model->get_list($input);
		$this->data['homeProduct1Info'] = isJson($this->setPage->homeProduct1);

		// Home Product 2
		$input = [];
		$input['select'] = 'name, url, image_link as img, price, discount';
		$input['where'] = ['status' => 1, 'selling' => 1, 'timer <=' => now()];
		$input['order'] = check_sort($this->setPage->sort_products);
		$input['order1'] = ['id', 'desc'];
		$input['limit'] = [8, 0];
		$this->data['homeProduct2'] = $this->products_model->get_list($input);
		$this->data['homeProduct2Info'] = isJson($this->setPage->homeProduct2);

		// Home Catalog
		$input = [];
		$input['select'] = 'id, name, intro, url, image_link as img';
		$input['where'] = ['status' => 1, 'home' => 1];
		$input['order'] = check_sort($this->setPage->sort_catalog);
		$this->data['homeCatalog'] = $this->catalog_model->get_list($input);

		// Home About
		$this->data['homeAbout'] = isJson($this->setPage->homeAbout);

		// SEO =================================================
		$this->data['url'] = base_url();
		$this->data['title'] = val_seo(isJson($this->setPage->seo)->title, 'Trang chủ');
		$this->data['description'] = val_seo(isJson($this->setPage->seo)->description, 'Trang chủ');
		$this->data['keywords'] = val_seo(isJson($this->setPage->seo)->keyword, 'Trang chủ');
		$this->data['image_seo'] = val_img_seo(isJson($this->setPage->seo)->image_link, '');

		// VIEW
		$this->data['temp'] = 'site/home/index';
		$this->load->view('site/layout', $this->data);
	}
}
