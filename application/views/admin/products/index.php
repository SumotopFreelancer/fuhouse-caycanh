<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<section class="content-header">
  <h1>Sản phẩm
    <a href="<?= admin_url('products/add') ?>" class="btn btn-success btn-flat">
      <i class="fa fa-plus-circle"></i> Thêm mới
    </a>
  </h1>
  <ol class="breadcrumb">
    <li><a href="<?= admin_url() ?>"><i class="fa fa-dashboard"></i>Bảng điều khiển</a></li>
    <li class="active">Sản phẩm</li>
  </ol>
</section>
<section class="content">
  <div class="box">
    <div class="box-header with-border">
      <h3 class="box-title">Danh sách</h3> (<?= $total_rows ?>)
    </div>
    <?php $this->load->view('admin/message', $this->data); ?>
    <div class="msg"></div>
    <div class="box-body table-responsive no-padding mailbox-messages">
      <table class="table table-hover">
        <form method="GET" action="<?= admin_url('products') ?>">
          <tr>
            <th style="width: 30%">
              <div class="input-group">
                <span class="input-group-addon">Tên</span>
                <input name="name" value="<?= $this->input->get('name') ?>" type="text" class="form-control">
              </div>
            </th>
            <th style="width: 30%">
              <div class="form-group">
                <select name="catalog_id" class="form-control select2" style="width: 100%;">
                  <option value="">Chọn danh mục</option>
                  <?php if (isset($catalog) && $catalog) : ?>
                    <?php foreach ($catalog as $row) : ?>
                      <option <?= ($this->input->get('catalog_id') == $row->id) ? 'selected' : '' ?> value="<?= $row->id ?>"><?= $row->name ?></option>
                      <?php if (count($this->catalog_model->menucon_admin($row->id)) > 0) : ?>
                        <?php foreach ($this->catalog_model->menucon_admin($row->id, check_sort($setadmin->sort_catalog)) as $cap2) : ?>
                          <option <?= ($this->input->get('catalog_id') == $cap2->id) ? 'selected' : '' ?> value="<?= $cap2->id ?>">--|<?= $cap2->name ?></option>
                          <?php if (count($this->catalog_model->menucon_admin($cap2->id)) > 0) : ?>
                            <?php foreach ($this->catalog_model->menucon_admin($cap2->id, check_sort($setadmin->sort_catalog)) as $cap3) : ?>
                              <option <?= ($this->input->get('catalog_id') == $cap3->id) ? 'selected' : '' ?> value="<?= $cap3->id ?>">--|--|<?= $cap3->name ?></option>
                              <?php if (count($this->catalog_model->menucon_admin($cap3->id)) > 0) : ?>
                                <?php foreach ($this->catalog_model->menucon_admin($cap3->id, check_sort($setadmin->sort_catalog)) as $cap4) : ?>
                                  <option <?= ($this->input->get('catalog_id') == $cap4->id) ? 'selected' : '' ?> value="<?= $cap4->id ?>">--|--|--|<?= $cap4->name ?></option>
                                <?php endforeach; ?>
                              <?php endif; ?>
                            <?php endforeach; ?>
                          <?php endif; ?>
                        <?php endforeach; ?>
                      <?php endif; ?>
                    <?php endforeach; ?>
                  <?php endif; ?>
                </select>
              </div>
            </th>
            <th class="pull-right">
              <button title="Lọc" class="btn btn-warning" type="submit"><i class="fa fa-search"></i></button>
              <a href="<?= admin_url('products') ?>" title="Làm mới" class="btn btn-default" type="submit"><i class="fa fa-refresh"></i></a>
            </th>
          </tr>
        </form>
      </table>
      <table class="table table-hover cus_text_mid">
        <tr class="btn-default">
          <th class="cus_td_50">
            <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i></button>
          </th>
          <th class="cus_td_50">STT</th>
          <th>Tên</th>
          <th>Danh mục</th>
          <th>Ngày tạo</th>
          <th>Giá</th>
          <th class="text-center">Trạng thái</th>
          <th class="text-center">Trang chủ 1</th>
          <th class="text-center">Trang chủ 2</th>
          <th class="b-active">Hành động</th>
        </tr>
        <?php foreach ($list as $key => $row) : ?>
          <tr class='row_<?= $row->id ?>'>
            <td class="text-center"><input type="checkbox" name="id[]" value="<?= $row->id; ?>"></td>
            <td class="cus_td_50"><?= $key + 1 ?></td>
            <td>
              <div class="info-default">
                <div class="img"><img src="<?= check_image_admin($row->image_link) ?>"></div>
                <div class="name"><a class="text-black line-1" target="_blank" href="<?= site_url(_sp . '/' . $row->url) ?>"><?= $row->name ?></a></div>
              </div>
            </td>
            <td><b class="line-1"><?= $this->catalog_model->get_info($row->catalog_id)->name ?></b></td>
            <td><?= get_date_admin($row->timer) ?></td>
            <td>
              <?php if ($row->price > 0) : ?>
                <?php if ($row->discount > 0 && $row->price > $row->discount) : ?>
                  <b><?= number_format($row->discount) ?></b>
                  <small class="price-old"><?= number_format($row->price) ?></small>
                <?php else : ?>
                  <b><?= number_format($row->price) ?></b>
                <?php endif; ?>
              <?php else : ?>
                <b>Liên hệ</b>
              <?php endif; ?>
            </td>
            <td class="text-center">
              <a id="statusajax<?= $row->id ?>" class="statusajax thea" data-id="<?= $row->id ?>" href="javascript:void(0)">
                <?php if ($row->status == 0) : ?><i class="fa fa-times-circle-o"></i><?php endif ?>
                <?php if ($row->status == 1) : ?><i class="fa fa-check-circle-o"></i><?php endif ?>
              </a>
            </td>
            <td class="text-center">
              <a id="homeajax<?= $row->id ?>" class="homeajax thea" data-id="<?= $row->id ?>" href="javascript:void(0)">
                <?php if ($row->home == 0) : ?><i class="fa fa-times-circle-o"></i><?php endif ?>
                <?php if ($row->home == 1) : ?><i class="fa fa-check-circle-o"></i><?php endif ?>
              </a>
            </td>
            <td class="text-center">
              <a id="sellingajax<?= $row->id ?>" class="sellingajax thea" data-id="<?= $row->id ?>" href="javascript:void(0)">
                <?php if ($row->selling == 0) : ?><i class="fa fa-times-circle-o"></i><?php endif ?>
                <?php if ($row->selling == 1) : ?><i class="fa fa-check-circle-o"></i><?php endif ?>
              </a>
            </td>
            <td class="b-active">
              <a href="<?= admin_url('products/edit/' . $row->id) ?>" class="btn btn-sm btn-social-icon btn-warning" title="Chỉnh sửa"><i class="fa fa-edit fa-fw"></i></a>
              <a href="<?= admin_url('products/delete/' . $row->id) ?>" class="btn btn-sm btn-social-icon btn-danger btn_del_one" title="Xóa"><i class="fa fa-trash-o fa-fw"></i></a>
            </td>
          </tr>
        <?php endforeach; ?>
      </table>
    </div>
    <div class="box-footer clearfix">
      <button type="button" class="btn btn-sm btn-danger btn_del_all" url="<?= admin_url('products/del_all') ?>">Xóa hết</button>
      <?= $phantrang ?>
    </div>
  </div>
</section>
<script>
  $('.addItem').click(function() {
    var type = $(this).attr('data-type');
    var item = $(this).attr('data-item');
    if (type == 'productService') {
      var name = item + '[]';
      $(this).closest('.box-body').find('.boxParent').append('<div class="form-group relative item"><div class="text-right"><span class="btn btn-xs btn-danger btn-flat" title="Xóa" onclick="delItem(this)">Xóa item</span></div><input class="form-control" name="' + name + '" type="text" placeholder="Nhập nội dung"></div>');
    }
  });

  function delItem(e) {
    $(e).closest('.item').remove();
  }

  $(".statusajax").click(function() {
    var id = $(this).attr('data-id');
    $.ajax({
      type: "post",
      url: "<?= admin_url('products/status') ?>",
      data: {
        id: id
      },
      beforeSend: function() {
        $('#statusajax' + id).html('<i class="fa fa-spinner fa-spin"></i>');
      },
      success: function(data) {
        $('#statusajax' + id).html(data);
      }
    });
  });
  $(".sellingajax").click(function() {
    var id = $(this).attr('data-id');
    $.ajax({
      type: "post",
      url: "<?= admin_url('products/selling') ?>",
      data: {
        id: id
      },
      beforeSend: function() {
        $('#sellingajax' + id).html('<i class="fa fa-spinner fa-spin"></i>');
      },
      success: function(data) {
        $('#sellingajax' + id).html(data);
      }
    });
  });
  $(".homeajax").click(function() {
    var id = $(this).attr('data-id');
    $.ajax({
      type: "post",
      url: "<?= admin_url('products/home') ?>",
      data: {
        id: id
      },
      beforeSend: function() {
        $('#homeajax' + id).html('<i class="fa fa-spinner fa-spin"></i>');
      },
      success: function(data) {
        $('#homeajax' + id).html(data);
      }
    });
  });
</script>