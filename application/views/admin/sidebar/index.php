<section class="content-header">
    <h1>Cài đặt sidebar</h1>
    <ol class="breadcrumb">
        <li><a href="<?= admin_url() ?>"><i class="fa fa-dashboard"></i>Bảng điều khiển</a></li>
        <li class="active">Cài đặt sidebar</li>
    </ol>
</section>
<section class="content">
    <form action="" method="POST" id="form">
        <?php $this->load->view('admin/message', $this->data); ?>
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">SIDEBAR</h3>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                </div>
            </div>
            <div class="box-body">
                <div class="form-group">
                    <label>Tiêu đề</label>
                    <input type="text" name="sidebar" value="<?= htmlentities($setadmin->sidebar) ?>" class="form-control" placeholder="Nhập tiêu đề">
                </div>
                <div class="form-group">
                    <label>Check <span class="text-red">"Sidebar"</span></label>
                    <a href="<?= admin_url('news') ?>" class="btn btn-success">Cài đặt</a>
                </div>
            </div>
            <div class="box-footer clearfix">
                <button type="submit" class="btn btn-success pull-right"><i class="fa fa-floppy-o"></i> Lưu lại</button>
            </div>
        </div>
    </form>
</section>