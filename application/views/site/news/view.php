<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<?= (isset($breadcrumb) && $breadcrumb) ? $breadcrumb : '' ?>
<?php if (isset($post) && $post) : ?>
  <div class="page-detail-news py-40">
    <div class="container">
      <div class="row">
        <div class="col-lg-9">
          <h1><?= $post->name ?></h1>
          <div class="block-editor-content tableOfContent mt-20 itext-6">
            <div class="wToc itext-base border ibg-color pt-10 px-10">
              <div class="tocHeader d-flex justify-content-between align-items-center pb-10">
                <span><i class="iwe iwe-list mr-10"></i><b class="text-md itext-3">Nội dung</b></span>
                <span><i class="iwe iwe-arrow-down showToc"></i></span>
              </div>
              <div id="toc" class="show pb-10 border-top"></div>
            </div>
            <div class="content text-justify"><?= $post->content ?></div>
            <div class="clearfix"></div>
          </div>
          <div class="share mt-30">
            <script src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5d20664dcf478a1c"></script>
            <div class="addthis_inline_share_toolbox_7uan"></div>
          </div>
          <?php if (!empty($tags)) : ?>
            <div class="tags mt-20">
              <span class="strong d-inline-block mt-1 text-nowrap mr-15 b"><i class="iwe iwe-tags mr-10"></i>Tags:</span>
              <?php foreach ($tags as $row) : ?>
                <a class="px-15 py-1 ibg-d rounded-sm b mt-10 mr-10 text-nowrap d-inline-block itext-6" href="<?= base_url(_tags . '/' . $row->url) ?>"><?= $row->name ?></a>
              <?php endforeach; ?>
            </div>
          <?php endif; ?>
          <div class="row mt-15">
            <div class="col-6">
              <?php if (isset($post_prev) && $post_prev) : ?>
                <a class="itext-primary strong text-md" href="<?= base_url($catalog->url . '/' . $post_prev->url) ?>"><i class="iwe iwe-arrow-left-primary-md mr-10"></i>Bài trước</a>
              <?php endif; ?>
            </div>
            <div class="col-6 text-right">
              <?php if (isset($post_next) && $post_next) : ?>
                <a class="itext-primary strong text-md" href="<?= base_url($catalog->url . '/' . $post_next->url) ?>">Bài sau<i class="iwe iwe-arrow-right-primary-md ml-10"></i></a>
              <?php endif; ?>
            </div>
          </div>
        </div>
        <?php $this->load->view('site/sidebarright', $this->data); ?>
      </div>
    </div>
  </div>
  <div class="tocTwo">
    <span class="rounded showToc bg-white"><i class="iwe iwe-list-md"></i></span>
    <div class="sToc itext-base border bg-white pt-10 px-10">
      <div class="tocHeader d-flex justify-content-between align-items-center pb-10">
        <span><i class="iwe iwe-list mr-10"></i><b class="text-md">Nội dung</b></span>
        <span><i class="iwe iwe-close-light closeToc"></i></span>
      </div>
      <div id="stoc" class="pb-10 border-top"></div>
    </div>
  </div>
<?php endif; ?>
<script src="<?= public_url('dist/toc/jquery.toc.js') ?>"></script>
<script>
  // Render Menu
  var hasH = 0;
  $('.tableOfContent').find('h1, h2, h3, h4').each(function() {
    hasH += 1;
  })
  if (hasH > 0) {
    $('.wToc').show(200);
    var options = {
      selector: 'h1, h2, h3, h4',
      scope: '.tableOfContent',
      prefix: 'title'
    };
    $('#toc').initTOC(options);
    $('#stoc').initTOC(options);

    // Menu Right
    $('.wToc .showToc').click(function() {
      var has = $('.wToc #toc').hasClass('show');
      if (has) {
        $(".wToc #toc").removeClass('show');
        $(".wToc #toc").hide(600);
        $(this).removeClass('iwe-arrow-down');
        $(this).addClass('iwe-arrow-right');
      } else {
        $(".wToc #toc").addClass('show');
        $(".wToc #toc").show(600);
        $(this).removeClass('iwe-arrow-right');
        $(this).addClass('iwe-arrow-down');
      }
    });

    // Menu fixed
    $('.sToc .closeToc').click(function() {
      $(".tocTwo .sToc").hide(600);
    });
    $('.tocTwo .showToc').click(function() {
      $(".tocTwo .sToc").show(600);
    });

    var heightTop = $('.wToc').offset().top;
    var heightElement = $('.wToc').outerHeight();
    var totalTop = heightTop + heightElement
    $(window).scroll(function() {
      var scrollTop = $(this).scrollTop();
      if (scrollTop >= totalTop) {
        jQuery('.tocTwo .showToc').show(600);
      } else {
        jQuery('.tocTwo .showToc').hide(600);
      }
    });

    function scrollMenu(e) {
      var href = $(e).attr('data-title');
      if (href.length && href != 'undefined') {
        $('html, body').animate({
          scrollTop: $('#' + href).offset().top - 10
        }, 1000, 'linear');
      }
    }
  }
</script>