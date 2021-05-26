<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<?= (isset($breadcrumb) && $breadcrumb) ? $breadcrumb : '' ?>
<div class="homeProductByCatalog py-40">
  <div class="container">
    <h1>Kết quả tìm kiếm: "<?= $this->input->get('keyword') ?>"</h1>
    <?php if (!empty($list)) : ?>
      <div class="row">
        <div class="col-lg-12">
          <div class="box-pro-home mt-40 bg-white">
            <div class="box-item">
              <div class="container">
                <div class="row no-gutters">
                  <?php foreach ($list as $row) : ?>
                    <div class="col-20 col-6">
                      <div class="item">
                        <a href="<?= base_url(_sp . '/' . $row->url) ?>">
                          <div class="bg-img lazy" data-src="<?= check_image('', $row->img) ?>">
                            <?php if ($row->discount > 0 && $row->price > $row->discount) : ?>
                              <span class="discount text-xs text-white ibg-gradient text-center">
                                Giảm <?= number_format($row->price - $row->discount) ?><sup>đ</sup>
                              </span>
                            <?php endif; ?>
                          </div>
                          <div class="info px-10 py-10">
                            <h3 class="line-2"><?= $row->name ?></h3>
                            <?= check_price($row->price, $row->discount) ?>
                          </div>
                        </a>
                      </div>
                    </div>
                  <?php endforeach; ?>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <?php if (!empty($phantrang)) : ?>
        <div class="box-pagination mt-30"><?= $phantrang ?></div>
      <?php endif; ?>
    <?php else : ?>
      <div class="mt-20 itext-6">Không tìm thấy kết quả!</div>
    <?php endif; ?>
  </div>
</div>