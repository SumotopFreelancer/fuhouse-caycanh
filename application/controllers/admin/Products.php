<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Products extends MY_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('products_model');
		$this->load->model('catalog_model');
		$this->load->model('productscatalog_model');
		$this->load->model('menu_model');
		$this->load->model('tagsproduct_model');
		$this->load->model('tagsproductproducts_model');

		// Load danh mục cha
		$input = [];
		$input['where'] = ['parent_id' => 0];
		$input['order'] = check_sort($this->setadmin->sort_catalog);
		$this->data['catalog'] = $this->catalog_model->get_list($input);
	}
	function index()
	{
		$input = [];
		if ($this->input->get()) {
			if ($this->input->get('name')) {
				$input['like'] = ['name' => $this->input->get('name', TRUE)];
			}
			if ($this->input->get('catalog_id')) {
				$catalog_id = $this->input->get('catalog_id');
				$catalog = $this->catalog_model->get_info($catalog_id);
				if ($catalog) {
					$catalog_subs = $this->catalog_model->get_sub_full_admin($catalog, check_sort($this->setadmin->sort_catalog));
					if ($catalog_subs) {
						$input['where_in'] = ['catalog_id', $catalog_subs];
					}
				}
			}
		}
		// Pagination
		$config = $this->adminpagination->config($this->products_model->get_total($input), admin_url('products'), 20, $_GET, admin_url('products'), 3);
		$this->pagination->initialize($config);
		$segment = (intval($this->uri->segment(3)) == 0) ? 0 : ($this->uri->segment(3) * $config['per_page']) - $config['per_page'];
		$this->data['phantrang'] = $this->pagination->create_links();
		$input['limit'] = [$config['per_page'], $segment];
		$input['order'] = check_sort($this->setadmin->sort_products);
		$input['order1'] = ['id', 'desc'];
		$this->data['list'] = $this->products_model->get_list($input);
		$this->data['total_rows'] = $config['total_rows'];
		// Load view
		$this->data['temp'] = 'admin/products/index';
		$this->load->view('admin/main', $this->data);
	}
	// Check mã sản phẩm tồn tại hay chưa
	function check_code()
	{
		$action = $this->uri->rsegment(2);
		$code = $this->input->post('code');
		$where = ['code' => $code];
		// kiem tra xem tai khoan da ton tai hay chua
		$check = true;
		if ($action == 'edit') {
			$info = $this->data['info'];
			if ($info->code == $code) {
				$check = false;
			}
		}
		if ($check && $this->products_model->check_exists($where)) {
			$this->form_validation->set_message(__FUNCTION__, 'Mã sản phẩm đã tồn tại');
			return false;
		}
		return true;
	}
	function add()
	{
		if ($this->input->post()) {
			$this->form_validation->set_rules('catalog_ids[]', 'Danh mục', 'required');
			$this->form_validation->set_rules('name', 'Tên', 'required');
			$this->form_validation->set_rules('code', 'Mã sản phẩm', 'required|callback_check_code');
			if ($this->form_validation->run()) {
				$name = trim($this->input->post('name', TRUE));
				$url = get_url_add(chuyenurl($this->input->post('url', TRUE)), $name, 'products_model');
				$catalog_id = main_catalog($this->input->post('catalog_id'), $this->input->post('catalog_ids'));

				$data = [
					'catalog_id' => $catalog_id,
					'name' => $name,
					'url' => $url,
					'price' => str_replace(',', '', $this->input->post('price')),
					'discount' => str_replace(',', '', $this->input->post('discount')),
					'intro' => $this->input->post('intro'),
					'content' => $this->input->post('content'),
					'content_1' => $this->input->post('content_1'),
					'image_link' => $this->input->post('image_link'),
					'image_seo' => $this->input->post('image_seo'),
					'image_list' => merge($this->input->post('gallery'), $this->input->post('altGallery')),
					'title' => $this->input->post('title', TRUE),
					'description' => $this->input->post('description', TRUE),
					'keyword' => $this->input->post('keyword', TRUE),
					'created' => now(),
					'updated' => now(),
					'timer' => convert_time_admin($this->input->post('timer')),
					'status' => $this->input->post('status'),
					'productStatus' => $this->input->post('productStatus'),
					'home' => $this->input->post('home'),
					'selling' => $this->input->post('selling'),
					'code' => $this->input->post('code', TRUE),
					'gift' => $this->input->post('gift')
				];
				// Check tag
				$this->checkTag($this->input->post('listtagpost'));
				if ($this->products_model->create($data)) {
					$insert_id = $this->db->insert_id();
					// Thêm catalog
					$this->createCatalogid($insert_id, $this->input->post('catalog_ids'));
					// Thêm tags
					$this->createTag($insert_id, $this->input->post('listtagpost'));
					$this->session->set_flashdata('message', '<div class="callout callout-success">Xóa thành công</div>');
				} else {
					$this->session->set_flashdata('message', '<div class="callout callout-danger">Không thêm được. Thử lại sau</div>');
				}
				$this->load->helper('xml');
				sitemapUpdate();
				$this->db->cache_delete_all();
				redirect(admin_url('products'));
			}
		}
		$this->data['temp'] = 'admin/products/add';
		$this->load->view('admin/main', $this->data);
	}
	function edit()
	{
		$id = intval($this->uri->rsegment('3'));
		$info = $this->products_model->get_info($id);
		if (!$info) {
			$this->session->set_flashdata('message', '<div class="callout callout-danger">Không tồn tại</div>');
			redirect(admin_url('products'));
		}
		$this->data['info'] = $info;
		$this->data['catalog_ids'] = $this->productscatalog_model->get_list_catalog_by_product_id($id);
		$this->data['listtags'] = $this->tagsproduct_model->get_list_tag_by_product_id($id);

		if ($this->input->post()) {
			$this->form_validation->set_rules('catalog_ids[]', 'Danh mục', 'required');
			$this->form_validation->set_rules('name', 'Tên', 'required');
			$this->form_validation->set_rules('code', 'Mã sản phẩm', 'required|callback_check_code');
			if ($this->form_validation->run()) {
				$name = trim($this->input->post('name', TRUE));
				$url = get_url_edit(chuyenurl($this->input->post('url', TRUE)), $name, 'products_model', $id);
				$catalog_id = main_catalog($this->input->post('catalog_id'), $this->input->post('catalog_ids'));
				$data = [
					'catalog_id' => $catalog_id,
					'name' => $name,
					'url' => $url,
					'price' => str_replace(',', '', $this->input->post('price')),
					'discount' => str_replace(',', '', $this->input->post('discount')),
					'intro' => $this->input->post('intro'),
					'content' => $this->input->post('content'),
					'content_1' => $this->input->post('content_1'),
					'image_link' => $this->input->post('image_link'),
					'image_seo' => $this->input->post('image_seo'),
					'image_list' => merge($this->input->post('gallery'), $this->input->post('altGallery')),
					'title' => $this->input->post('title', TRUE),
					'description' => $this->input->post('description', TRUE),
					'keyword' => $this->input->post('keyword', TRUE),
					'updated' => now(),
					'timer' => convert_time_admin($this->input->post('timer')),
					'status' => $this->input->post('status'),
					'productStatus' => $this->input->post('productStatus'),
					'home' => $this->input->post('home'),
					'selling' => $this->input->post('selling'),
					'code' => $this->input->post('code', TRUE),
					'gift' => $this->input->post('gift')
				];
				// Check tag
				$this->checkTag($this->input->post('listtagpost'));
				if ($this->products_model->update($id, $data)) {
					// Sửa catalog
					$this->createCatalogid($id, $this->input->post('catalog_ids'), 'edit');
					// Sửa tag
					$this->createTag($id, $this->input->post('listtagpost'), 'edit');
					// Sửa menu
					$this->menu_model->updateMenu($id, 'products', $url);
					$this->session->set_flashdata('message', '<div class="callout callout-success">Chỉnh sửa thành công</div>');
				} else {
					$this->session->set_flashdata('message', '<div class="callout callout-danger">Không chỉnh sửa được</div>');
				}
				$this->load->helper('xml');
				sitemapUpdate();
				$this->db->cache_delete_all();
				if ($this->input->post('cus_btn_save') == 'Lưu lại') {
					redirect(admin_url('products/edit/' . $id));
				} else {
					redirect(admin_url('products'));
				}
			}
		}
		$this->data['temp'] = 'admin/products/edit';
		$this->load->view('admin/main', $this->data);
	}
	// Xóa
	function delete()
	{
		$id = intval($this->uri->rsegment('3'));
		$this->_del($id, FALSE);
		$this->session->set_flashdata('message', '<div class="callout callout-success">Xóa thành công</div>');
		$this->load->helper('xml');
		sitemapUpdate();
		$this->db->cache_delete_all();
		redirect(admin_url('products'));
	}
	// Xóa nhiều
	function del_all()
	{
		$ids = $this->input->post('ids');
		foreach ($ids as $id) {
			$this->_del($id);
		}
		$this->load->helper('xml');
		sitemapUpdate();
		$this->db->cache_delete_all();
	}
	private function _del($id, $ajax = TRUE)
	{
		$info = $this->products_model->get_info($id);
		if (!$info) {
			if ($ajax) {
				echo '<div class="callout callout-danger">Không tồn tại</div>';
				return FALSE;
			} else {
				$this->session->set_flashdata('message', '<div class="callout callout-danger">Không tồn tại</div>');
				redirect(admin_url('products'));
			}
		}
		if ($this->products_model->delete($id)) {
			// Xóa product_id trong bảng products_catalog
			$this->productscatalog_model->del_rule(['product_id' => $id]);
			// Xóa product_id trong bảng tagsproduct
			$this->tagsproductproducts_model->del_rule(['product_id' => $id]);
			echo '<span class="id_delete hidden">' . $id . '</span>';
		}
	}
	function status()
	{
		$id = intval($this->input->post('id'));
		$info = $this->products_model->get_info($id);
		if (!$info) {
			$this->session->set_flashdata('message', '<div class="callout callout-danger">Không tồn tại</div>');
			redirect(admin_url('products'));
		}
		if ($info->status == 1) {
			$data = ['status' => 0];
			$this->products_model->update($id, $data);
			echo '<i class="fa fa-times-circle-o"></i>';
		}
		if ($info->status == 0) {
			$data = ['status' => 1];
			$this->products_model->update($id, $data);
			echo '<i class="fa fa-check-circle-o"></i>';
		}
		$this->load->helper('xml');
		sitemapUpdate();
		$this->db->cache_delete_all();
	}
	function home()
	{
		$id = intval($this->input->post('id'));
		$info = $this->products_model->get_info($id);
		if (!$info) {
			$this->session->set_flashdata('message', '<div class="callout callout-danger">Không tồn tại</div>');
			redirect(admin_url('products'));
		}
		if ($info->home == 1) {
			$data = ['home' => 0];
			$this->products_model->update($id, $data);
			echo '<i class="fa fa-times-circle-o"></i>';
		}
		if ($info->home == 0) {
			$data = ['home' => 1];
			$this->products_model->update($id, $data);
			echo '<i class="fa fa-check-circle-o"></i>';
		}
		$this->load->helper('xml');
		sitemapUpdate();
		$this->db->cache_delete_all();
	}
	function selling()
	{
		$id = intval($this->input->post('id'));
		$info = $this->products_model->get_info($id);
		if (!$info) {
			$this->session->set_flashdata('message', '<div class="callout callout-danger">Không tồn tại</div>');
			redirect(admin_url('products'));
		}
		if ($info->selling == 1) {
			$data = ['selling' => 0];
			$this->products_model->update($id, $data);
			echo '<i class="fa fa-times-circle-o"></i>';
		}
		if ($info->selling == 0) {
			$data = ['selling' => 1];
			$this->products_model->update($id, $data);
			echo '<i class="fa fa-check-circle-o"></i>';
		}
		$this->load->helper('xml');
		sitemapUpdate();
		$this->db->cache_delete_all();
	}
	public function autocomplete()
	{
		$search_data = $this->input->post('search_data', TRUE);
		$input = [];
		$input['like'] = ['name' => $search_data];
		$input['order'] = ['sort_order', 'desc'];
		$ketqua = $this->tagsproduct_model->get_list($input);
		$html = '';
		if (!empty($ketqua)) {
			$html .= "<ul>";
			foreach ($ketqua as $row) {
				$html .= '<li onclick="addtag(this)" class="litag">' . $row->name . '</li>';
			}
			$html .= "</ul>";
		}
		echo $html;
	}
	function checkTag($stringTag = '')
	{
		if (!empty($stringTag)) {
			$tags = explode(',', $stringTag);
			foreach ($tags as $row) {
				if (!$this->tagsproduct_model->check_name_tags($row)) { // Nếu tên tags này chưa có
					$url = chuyenurl($row);
					$where = ['url' => $url];
					if ($this->tagsproduct_model->check_exists($where)) { // Nếu như url này đã tồn tại
						$input = [];
						$input['where'] = ['name' => mb_strtolower($row)];
						$num = $this->tagsproduct_model->get_total($input);
						$url = $url . '-' . $num;
					}
					$data = [
						'name' => mb_strtolower($row),
						'url' => $url,
						'created' => now(),
					];
					$this->tagsproduct_model->create($data);
				}
			}
		}
	}
	function createTag($id, $stringTag = '', $action = 'add')
	{
		if ($action == 'edit') {
			$where = ['product_id' => $id];
			$this->tagsproductproducts_model->del_rule($where);
		}
		if (!empty($stringTag)) {
			$tags = explode(',', $stringTag);
			foreach ($tags as $row) {
				$tag_id = $this->tagsproduct_model->get_info_tags($row)->id;
				$input = [];
				$input['where'] = ['product_id' => $id, 'tag_id' => $tag_id];
				if ($this->tagsproductproducts_model->get_total_tags($input) <= 0) {
					$data = [
						'product_id' => $id,
						'tag_id' => $tag_id,
					];
					$this->tagsproductproducts_model->create($data);
				}
			}
		}
	}
	function createCatalogid($id, $catalog_ids = [], $action = 'add')
	{
		if ($action == 'edit') {
			$where = ['product_id' => $id];
			$this->productscatalog_model->del_rule($where);
		}
		foreach ($catalog_ids as $catalog_id) {
			$data = [
				'product_id' => $id,
				'catalog_id' => $catalog_id,
			];
			$this->productscatalog_model->create($data);
		}
	}
}
