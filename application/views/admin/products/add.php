<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>Sản phẩm
        <a href="<?= admin_url('products/add') ?>" class="btn btn-success btn-flat">
            <i class="fa fa-plus-circle"></i> Thêm mới
        </a>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= admin_url() ?>"><i class="fa fa-dashboard"></i>Bảng điều khiển</a></li>
        <li><a href="<?= admin_url('products') ?>">Sản phẩm</a></li>
        <li class="active">Thêm mới</li>
    </ol>
</section>
<section class="content">
    <form action="" method="POST" id="form" data-model="products_model" data-action="add">
        <div class="row">
            <div class="col-md-8">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Nội dung</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label>Tên <span class="label label-danger">(Bắt buộc) <?= form_error('name') ?></span></label>
                            <input type="text" name="name" value="<?= set_value('name') ?>" class="form-control" id="auto_convert_name">
                            <span class="cHelp"><?= _help_name ?></span>
                        </div>
                        <div class="form-group">
                            <label>URL</label>
                            <input type="text" name="url" value="<?= set_value('url') ?>" class="form-control">
                            <span class="cHelp"><?= _help_url ?></span>
                        </div>
                        <div class="form-group">
                            <label>Code</label>
                            <input type="text" name="code" value="<?= set_value('code') ?>" class="form-control" placeholder="Mã code">
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Giá gốc</label>
                                    <input type="text" name="price" value="<?= set_value('price') ?>" class="form-control" data-format_price placeholder="0">
                                    <span class="cHelp"><?= _help_price ?></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Giá bán</label>
                                    <input type="text" name="discount" value="<?= set_value('discount') ?>" class="form-control" data-format_price placeholder="0">
                                    <span class="cHelp"><?= _help_discount ?></span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group hidden">
                            <label>Thuộc tính</label>
                            <textarea name="gift" class="form-control editor"><?= set_value('gift') ?></textarea>
                        </div>
                        <div class="form-group hidden">
                            <label>Mô tả ngắn</label>
                            <textarea name="intro" class="form-control editor"><?= set_value('intro') ?></textarea>
                            <span class="cHelp"><?= _help_intro ?></span>
                        </div>
                        <div class="form-group">
                            <label>Nội dung <a class="cTool" title="<?= _help_content ?>"></a></label>
                            <textarea name="content" class="form-control editor"><?= set_value('content') ?></textarea>
                        </div>
                        <div class="form-group hidden">
                            <label>Nội dung thêm</label>
                            <textarea name="content_1" class="form-control editor"><?= set_value('content_1') ?></textarea>
                        </div>
                        <div class="form-group hidden">
                            <label>Tags</label>
                            <div class="input-group">
                                <input onkeyup="ajaxSearch();" onfocus="focusSearch();" id="name-tag" name="tags" type="text" autocomplete="off" class="form-control">
                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-danger" id="click-tag">Thêm</button>
                                </div>
                            </div>
                            <input type="hidden" name="listtagpost" id="listtagpost">
                            <div class="ssug" id="suggestions">
                                <div id="autoSuggestionsList"></div>
                            </div>
                            <div id="tags-list"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Thông tin thêm </h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label>Danh mục <span class="label label-danger">(Bắt buộc) <?= form_error('catalog_ids[]') ?></span></label>
                            <div class="list_catalog">
                                <?php if (isset($catalog) && $catalog) : ?>
                                    <?php foreach ($catalog as $row) : ?>
                                        <div class="checkbox lv1" id="ctl<?= $row->id ?>">
                                            <label>
                                                <input class="laygiatri" type="checkbox" name="catalog_ids[]" value="<?= $row->id ?>" <?= set_checkbox('catalog_ids[]', $row->id); ?>><?= $row->name ?>
                                            </label>
                                        </div>
                                        <?php if (count($this->catalog_model->menucon_admin($row->id)) > 0) : ?>
                                            <?php foreach ($this->catalog_model->menucon_admin($row->id, check_sort($setadmin->sort_catalog)) as $cap2) : ?>
                                                <div class="checkbox lv2" id="ctl<?= $row->id ?>">
                                                    <label>
                                                        <input class="laygiatri" type="checkbox" name="catalog_ids[]" value="<?= $cap2->id ?>" <?= set_checkbox('catalog_ids[]', $cap2->id); ?>><?= $cap2->name ?>
                                                    </label>
                                                </div>
                                                <?php if (count($this->catalog_model->menucon_admin($cap2->id)) > 0) : ?>
                                                    <?php foreach ($this->catalog_model->menucon_admin($cap2->id, check_sort($setadmin->sort_catalog)) as $cap3) : ?>
                                                        <div class="checkbox lv3" id="ctl<?= $row->id ?>">
                                                            <label>
                                                                <input class="laygiatri" type="checkbox" name="catalog_ids[]" value="<?= $cap3->id ?>" <?= set_checkbox('catalog_ids[]', $cap3->id); ?>><?= $cap3->name ?>
                                                            </label>
                                                        </div>
                                                        <?php if (count($this->catalog_model->menucon_admin($cap3->id)) > 0) : ?>
                                                            <?php foreach ($this->catalog_model->menucon_admin($cap3->id, check_sort($setadmin->sort_catalog)) as $cap4) : ?>
                                                                <div class="checkbox lv4" id="ctl<?= $row->id ?>">
                                                                    <label>
                                                                        <input class="laygiatri" type="checkbox" name="catalog_ids[]" value="<?= $cap4->id ?>" <?= set_checkbox('catalog_ids[]', $cap4->id); ?>><?= $cap4->name ?>
                                                                    </label>
                                                                </div>
                                                            <?php endforeach; ?>
                                                        <?php endif; ?>
                                                    <?php endforeach; ?>
                                                <?php endif; ?>
                                            <?php endforeach; ?>
                                        <?php endif; ?>
                                    <?php endforeach; ?>
                                <?php else : ?>
                                    <a class="setupcatalog" href="<?= admin_url('catalog/add') ?>"><i class="fa fa-exclamation-triangle"></i> CLICK THÊM DANH MỤC</a>
                                <?php endif; ?>
                            </div>
                            <span class="cHelp"><?= _help_catalog ?></span>
                            <input type="hidden" name="catalog_id">
                        </div>
                        <div class="form-group">
                            <label>Ngày đăng:</label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-clock-o"></i></div>
                                <input type="text" class="form-control cus_timer" name="timer" value="<?= get_date_admin(now()) ?>">
                            </div>
                            <span class="cHelp"><?= _help_timer ?></span>
                        </div>
                        <div class="form-group">
                            <div class="tongimg">
                                <div class="image_avata" onclick="openCKfinder(this)">
                                    <div class="show_img"><b>Chọn ảnh</b></div>
                                    <input type="hidden" name="image_link" class="cus_ckfinder image_link">
                                </div>
                            </div>
                            <span class="cHelp"><?= _help_img ?>600 x 400px</span>
                        </div>
                        <div class="form-group">
                            <label>Ảnh kèm theo:</label>
                            <div id="wGallery" class="cus_image_action"></div>
                            <div class="cus_image_list">
                                <img class="img-responsive" class="cus_btn_add_image_list" onclick="openCKfinderMulti('gallery', 'altGallery', 'wGallery')" src="<?= public_url('admin/img/plus.png') ?>" alt="...">
                            </div>
                            <span class="cHelp"><?= _help_img_list ?>600 x 400px</span>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Trạng thái</label>
                                    <select class="form-control" name="status">
                                        <option value="1">Hiển thị</option>
                                        <option value="0">Ẩn</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Trang chủ 1</label>
                                    <select class="form-control" name="home">
                                        <option value="0">Không</option>
                                        <option value="1">Có</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Trang chủ 2</label>
                                    <select class="form-control" name="selling">
                                        <option value="0">Không</option>
                                        <option value="1">Có</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Còn hàng</label>
                                    <select class="form-control" name="productStatus">
                                        <option value="1">Còn hàng</option>
                                        <option value="0">Hết hàng</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group <?= switch_sort($setadmin->sort_products) ?>">
                            <label>Thứ tự</label>
                            <input type="number" name="sort_order" value="<?= set_value('sort_order') ?>" class="form-control" placeholder="0">
                            <span class="cHelp"><?= _help_sort ?></span>
                        </div>
                    </div>
                </div>

                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">SEO </h3>
                        <div class="no-margin pull-right">
                            <a class="cus_btn_seo btn-warning"><i class="fa fa-superpowers"></i> Tạo Seo</a>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <div class="tongimg">
                                <div class="image_avata" onclick="openCKfinder(this)">
                                    <div class="show_img"><b>Chọn ảnh</b></div>
                                    <input type="hidden" name="image_seo" class="cus_ckfinder image_link">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Tiêu đề</label>
                            <input type="text" name="title" value="<?= set_value('title') ?>" class="form-control">
                            <span class="cHelp"><?= _help_title ?></span>
                        </div>
                        <div class="form-group">
                            <label>Mô tả</label>
                            <textarea name="description" class="form-control" rows="5"><?= set_value('description') ?></textarea>
                            <span class="cHelp"><?= _help_description ?></span>
                        </div>
                        <div class="form-group">
                            <label>Từ khóa</label>
                            <textarea name="keyword" class="form-control" rows="2"><?= set_value('keyword') ?></textarea>
                            <span class="cHelp"><?= _help_keyword ?></span>
                        </div>
                    </div>
                    <div class="box-footer clearfix">
                        <button type="submit" class="btn btn-success pull-right submit"><i class="fa fa-floppy-o"></i> Lưu lại</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</section>
<!-- Check danh mục -->
<script type="text/javascript">
    var val = [];
    $('.laygiatri:checked').each(function(i) {
        $(this).parents('.checkbox').append('<span class="ctlchinh" onclick="danhmucchinh($(this))">Danh mục chính</span>');
    });
    $('.laygiatri').click(function() {
        if (this.checked) {
            $(this).parents('.checkbox').append('<span class="ctlchinh" onclick="danhmucchinh($(this))">Danh mục chính</span>');
        } else {
            $(this).parents('.checkbox').find('.ctlchinh').remove();
        }
    });

    function danhmucchinh(e) {
        $('.list_catalog').find('.ctlchinh').removeClass('active');
        e.addClass('active');
        var id = e.parents('.checkbox').find('.laygiatri').val();
        $("input[name='catalog_id']").val(id);
    }
</script>
<!-- Check Tags -->
<script type="text/javascript">
    function isEmpty(value) {
        return typeof value == 'string' && !value.trim() || typeof value == 'undefined' || value === null;
    }
    $(document).ready(function() {
        $("#click-tag").click(function() {
            var tags = $('#name-tag').val();
            if (!isEmpty(tags)) {
                $.each(tags.split(','), function(index, value) {
                    if (!isEmpty(value)) {
                        if ($.inArray(value.trim(), updatetag().split(',')) == -1) {
                            $('#tags-list').append('<span onclick="removetag(this)" data-valuetag="' + value.trim() + '" class="itemtag">' + value.trim() + ' <b class="closetag">x</b></span>');
                        }
                    }
                });
            }
            updatetag();
            $('#name-tag').val('');
        });
    });

    function updatetag() {
        var string = '';
        $.each($('#tags-list .itemtag'), function() {
            if (isEmpty(string)) {
                string = string + $(this).attr('data-valuetag');
            } else {
                string = string + ',' + $(this).attr('data-valuetag');
            }
        });
        return string;
    }

    function removetag(itemtag) {
        itemtag.remove();
        updatetag();
    }

    function focusSearch() {
        $.ajax({
            type: "POST",
            url: "<?= admin_url('products/autocomplete') ?>",
            success: function(data) {
                if (data.length > 0) {
                    $('#suggestions').show();
                    $('#autoSuggestionsList').html(data);
                } else {
                    $('#suggestions').hide();
                }
            }
        });
    }

    function ajaxSearch() {
        var input_data = $('#name-tag').val();
        if (input_data.length === 0) {
            $('#suggestions').hide();
        } else {
            $.ajax({
                type: "POST",
                url: "<?= admin_url('products/autocomplete') ?>",
                data: {
                    search_data: input_data
                },
                success: function(data) {
                    if (data.length > 0) {
                        $('#suggestions').show();
                        $('#autoSuggestionsList').html(data);
                    } else {
                        $('#suggestions').hide();
                    }
                }
            });
        }
    }

    function addtag(valuetag) {
        var string = '';
        if (isEmpty(string)) {
            string = string + $(valuetag).text();
        } else {
            string = string + ',' + $(valuetag).text();
        }
        $('#name-tag').val(string);
        $('#suggestions').hide();
    }
    $(".submit").click(function() {
        $('#listtagpost').val(updatetag());
    });
    $(document).mouseup(function(e) {
        if ($(e.target).closest("#suggestions").length === 0) {
            $("#suggestions").hide();
        }
    });
</script>