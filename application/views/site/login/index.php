<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<?= (isset($breadcrumb) && $breadcrumb) ? $breadcrumb : '' ?>
<div class="homeProductByCatalog py-40">
    <div class="container">
        <div class="max-720">
            <h1 class="text-center">Đăng nhập</h1>
            <form action="" method="post">
                <div class="form-group">
                    <label>Tên đăng nhập:</label>
                    <input type="text" class="form-control" placeholder="Tên đăng nhập" name="username">
                </div>
                <div class="form-group">
                    <label>Mật khẩu:</label>
                    <input type="password" class="form-control" placeholder="Enter password" name="password">
                </div>
                <button type="submit" class="btn btn-primary">Đăng nhập</button>
            </form>
        </div>

    </div>
</div>