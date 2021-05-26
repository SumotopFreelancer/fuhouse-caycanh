<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<ul class="sidebar-menu" data-widget="tree">
    <li class="header"><a href="<?= admin_url() ?>">BẢNG ĐIỀU KHIỂN</a></li>
    <?php if (isset($quyen_admin->header) || isset($quyen_admin->menu) || isset($quyen_admin->slide) || isset($quyen_admin->pagehome) || isset($quyen_admin->footer)) : ?>
        <li class="treeview">
            <a href="#"><i class="fa fa-cogs"></i><span>Trang chủ</span>
                <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
            </a>
            <ul class="treeview-menu">
                <?php if (isset($quyen_admin->header)) : ?>
                    <li><a href="<?= admin_url('header') ?>">Header</a></li>
                <?php endif; ?>
                <?php if (isset($quyen_admin->menu)) : ?>
                    <li><a href="<?= admin_url('menu') ?>">Menu</a></li>
                <?php endif; ?>
                <?php if (isset($quyen_admin->pagehome)) : ?>
                    <li><a href="<?= admin_url('pagehome') ?>">Cấu hình trang chủ</a></li>
                <?php endif; ?>
                <?php if (isset($quyen_admin->footer)) : ?>
                    <li><a href="<?= admin_url('footer') ?>">Footer</a></li>
                <?php endif; ?>
            </ul>
        </li>
    <?php endif; ?>
    <?php if (isset($quyen_admin->pages)) : ?>
        <li><a href="<?= admin_url('pages') ?>"><i class="fa fa-file-text"></i><span>Trang</span></a></li>
    <?php endif; ?>
    <?php if (isset($quyen_admin->catalognew) || isset($quyen_admin->news)) : ?>
        <li class="treeview">
            <a href="#"><i class="fa fa-newspaper-o"></i><span>Quản lý bài viết</span>
                <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
            </a>
            <ul class="treeview-menu">
                <?php if (isset($quyen_admin->news)) : ?>
                    <li><a href="<?= admin_url('news') ?>">Bài viết</a></li>
                <?php endif; ?>
                <?php if (isset($quyen_admin->catalognew)) : ?>
                    <li><a href="<?= admin_url('catalognew') ?>">Danh mục</a></li>
                <?php endif; ?>
            </ul>
        </li>
    <?php endif; ?>
    <?php if (isset($quyen_admin->catalog) || isset($quyen_admin->products) || isset($quyen_admin->order) || isset($quyen_admin->orderinfo)) : ?>
        <li class="treeview">
            <a href="#"><i class="fa fa-th-large"></i> <span>Quản lý sản phẩm</span>
                <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
            </a>
            <ul class="treeview-menu">
                <?php if (isset($quyen_admin->products)) : ?>
                    <li><a href="<?= admin_url('products') ?>">Sản phẩm</a></li>
                <?php endif; ?>
                <?php if (isset($quyen_admin->catalog)) : ?>
                    <li><a href="<?= admin_url('catalog') ?>">Danh mục</a></li>
                <?php endif; ?>
                <?php if (isset($quyen_admin->order)) : ?>
                    <li><a href="<?= admin_url('order') ?>">Danh sách đơn hàng</a></li>
                <?php endif; ?>
                <?php if (isset($quyen_admin->orderinfo)) : ?>
                    <li><a href="<?= admin_url('orderinfo') ?>">Cài đặt thêm</a></li>
                <?php endif; ?>
            </ul>
        </li>
    <?php endif; ?>
    <?php if (isset($quyen_admin->contact) || isset($quyen_admin->contactemail) || isset($quyen_admin->contactphone)) : ?>
        <li class="treeview">
            <a href="#"><i class="fa fa-commenting-o"></i><span>Khách hàng</span>
                <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
            </a>
            <ul class="treeview-menu">
                <?php if (isset($quyen_admin->contact)) : ?>
                    <li><a href="<?= admin_url('contact') ?>">KH trang liên hệ</a></li>
                <?php endif; ?>
                <?php if (isset($quyen_admin->contactemail)) : ?>
                    <li><a href="<?= admin_url('contactemail') ?>">KH đăng ký nhận tin</a></li>
                <?php endif; ?>
                <?php if (isset($quyen_admin->contactphone)) : ?>
                    <li><a href="<?= admin_url('contactphone') ?>">KH yêu cầu gọi lại</a></li>
                <?php endif; ?>
            </ul>
        </li>
    <?php endif; ?>
    <?php if (isset($quyen_admin->pagecontact)) : ?>
        <li><a href="<?= admin_url('pagecontact') ?>"><i class="fa fa-file-text"></i><span>Trang liên hệ</span></a></li>
    <?php endif; ?>
    <?php if (isset($quyen_admin->sidebar) || isset($quyen_admin->social) || isset($quyen_admin->script) || isset($quyen_admin->infowebsite) || isset($quyen_admin->deletecache)) : ?>
        <li class="treeview">
            <a href="#"><i class="fa fa-user-md"></i> <span>Cấu hình website</span>
                <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
            </a>
            <ul class="treeview-menu">
                <?php if (isset($quyen_admin->sidebar)) : ?>
                    <li><a href="<?= admin_url('sidebar') ?>">Sidebar</a></li>
                <?php endif; ?>
                <?php if (isset($quyen_admin->social)) : ?>
                    <li><a href="<?= admin_url('social') ?>">Mạng xã hội</a></li>
                <?php endif; ?>
                <?php if (isset($quyen_admin->script)) : ?>
                    <li><a href="<?= admin_url('script') ?>">Script</a></li>
                <?php endif; ?>
                <?php if (isset($quyen_admin->infowebsite)) : ?>
                    <li><a href="<?= admin_url('infowebsite') ?>">Thông tin chung</a></li>
                <?php endif; ?>
                <?php if (isset($quyen_admin->deletecache)) : ?>
                    <li><a href="<?= admin_url('deletecache') ?>">Xóa Cache</a></li>
                <?php endif; ?>
            </ul>
        </li>
    <?php endif; ?>
    <li><a target="_blank" href="<?= public_url('admin/plugins/ckfinder/ckfinder.html') ?>"><i class="fa fa-file-text"></i> <span>Quản lý Media</span></a></li>
</ul>