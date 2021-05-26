<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<?= !empty($breadcrumb) ? $breadcrumb : '' ?>
<?php if (!empty($catalog)) : ?>
  <div class="pageCatalog py-40">
    <div class="container">
      <div class="row">
        <div class="col-lg-3 d-none d-lg-block">
          <?php if (!empty($catlogSidebar)) : ?>
            <div class="catSidebar">
              <ul>
                <?php foreach ($catlogSidebar as $cat) : ?>
                  <li class="mb-2 b">
                    <div class="d-flex justify-content-between b">
                      <a href="<?= base_url(_csp . '/' . $cat->url) ?>" <b><?= $cat->name ?></a>
                      <?php if (!empty($cat->child)) : ?>
                        <span class="pointer" onclick="actionchild(this)"><i class="iwe iwe-add"></i></span>
                      <?php endif; ?>
                    </div>
                    <?php if (!empty($cat->child)) : ?>
                      <ul class="child ml-15 mt-1">
                        <?php foreach ($cat->child as $row) : ?>
                          <li class="mt-1 b">
                            <a href="<?= base_url(_csp . '/' . $row->url) ?>"><?= $row->name ?></a>
                          </li>
                        <?php endforeach; ?>
                      </ul>
                    <?php endif; ?>
                  </li>
                <?php endforeach; ?>
              </ul>
            </div>
            <script>
              function actionchild(e) {
                var parent = $(e).closest('li');
                var has = parent.find('ul.child').hasClass('open');
                if (has) {
                  parent.find('ul.child').removeClass('open');
                  $(e).find('i').removeClass('iwe-minus');
                  $(e).find('i').addClass('iwe-add');
                } else {
                  parent.find('ul.child').addClass('open');
                  $(e).find('i').addClass('iwe-minus');
                  $(e).find('i').removeClass('iwe-add');
                }
              }
            </script>
          <?php endif; ?>
        </div>
        <div class="col-lg-9">
          <h1 class="strong"><?= $catalog->name ?></h1>
          <?php if (!empty($data_child)) : ?>
            <div class="row">
              <?php foreach ($data_child as $row) : ?>
                <div class="col-lg-3 col-6">
                  <div class="item-product mt-30">
                    <a href="<?= base_url(_sp . '/' . $row->url) ?>">
                      <div class="bg-img lazy ratio-1-1 position-relative" data-src="<?= check_image('', $row->img) ?>"></div>
                      <div class="info mt-15">
                        <h3 class="line-2 mb-10"><?= $row->name ?></h3>
                        <?= check_price($row->price, $row->discount) ?>
                      </div>
                    </a>
                  </div>
                </div>
              <?php endforeach; ?>
            </div>
            <?php if (!empty($phantrang)) : ?>
              <div class="box-pagination mt-30"><?= $phantrang ?></div>
            <?php endif; ?>
          <?php else : ?>
            <div class="mt-20 itext-6">Danh mục chưa có sản phẩm!</div>
          <?php endif; ?>
        </div>
      </div>
    </div>
  </div>
<?php endif; ?>