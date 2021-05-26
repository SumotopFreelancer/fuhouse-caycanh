<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<?= (isset($breadcrumb) && $breadcrumb) ? $breadcrumb : '' ?>
<div class="proDetail py-40 ibg-fa">
	<div class="container">
		<div class="row">
			<div class="col-lg-5">
				<div class="box_stick">
					<div class="outer">
						<div id="big" class="owl-carousel owl-theme">
							<div class="item">
								<a href="<?= check_image('', $product->image_link, TRUE) ?>" data-fancybox="gallery" data-caption="<?= $product->name ?>">
									<img src="<?= check_image('', $product->image_link, TRUE) ?>" alt="<?= $product->name ?>">
								</a>
							</div>
							<?php if (isset($image_list) && $image_list) : ?>
								<?php foreach ($image_list as $img => $alt) : ?>
									<div class="item">
										<a href="<?= check_image('', $img, TRUE) ?>" data-fancybox="gallery" data-caption="<?= $alt ?>">
											<img src="<?= check_image('', $img, TRUE) ?>" alt="<?= $alt ?>">
										</a>
									</div>
								<?php endforeach; ?>
							<?php endif; ?>
						</div>
						<div id="thumbs" class="owl-carousel owl-theme mt-10">
							<div class="item border">
								<div class="bg-img" style="background-image: url('<?= check_image('', $product->image_link, TRUE) ?>')"></div>
							</div>
							<?php if (isset($image_list) && $image_list) : ?>
								<?php foreach ($image_list as $img => $alt) : ?>
									<div class="item border">
										<div class="bg-img" style="background-image: url('<?= $img ?>')"></div>
									</div>
								<?php endforeach; ?>
							<?php endif; ?>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-7 product-shop mt-lg-0 mt-30">
				<h1><?= $product->name ?></h1>
				<div class="code itext-code mt-20 mb-1">Mã: <?= $product->code ?></div>
				<?= check_price($product->price, $product->discount, 'detail') ?>
				<?php if ($product->intro) : ?>
					<div class="mt-20">
						<strong>ĐẶC ĐIỂM NỔI BẬT</strong>
						<div class="block-editor-content mt-10 itext-6"><?= $product->intro ?></div>
					</div>
				<?php endif; ?>
				<?php if ($product->price > 0 && $product->productStatus == 1) : ?>
					<div class="product-qty mt-4">
						<strong>Số lượng</strong>
						<div class="control mt-10">
							<a href="javascript:void(0)" class="qty-dec">-</a>
							<input type="number" name="qty" min="1" max="999" value="1" />
							<a href="javascript:void(0)" class="qty-inc">+</a>
						</div>
					</div>
					<button type="button" class="btn rounded-sm border-0 mt-15 py-10 ibg-gradient text-white addToCart text-center w-300" data-id="<?= $product->id ?>" data-type="detail" data-redirect="true">
						<div class="strong">MUA NGAY</div>
						<div class="text-xs">Gọi điện xác nhận và giao hàng tận nơi</div>
					</button>
					<?php /*
					<button type="button" class="btn text-sm rounded-0 border-0 mt-15 py-10 ibg-primary text-white addToCart w-300 strong" data-id="<?= $product->id ?>" data-type="detail" data-redirect="false">THÊM VÀO GIỎ HÀNG</button>
					*/ ?>
				<?php endif; ?>
				<?php if ($product->content) : ?>
					<div class="content px-20 py-20 border mt-30">
						<div class="contentDetail">
							<h2 class="strong">MÔ TẢ SẢN PHẨM</h2>
							<div class="block-editor-content mt-20 itext-6"><?= $product->content ?></div>
						</div>
						<div class="share mt-20">
							<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5c41f79d44c32cef"></script>
							<div class="addthis_inline_share_toolbox_u657"></div>
						</div>
					</div>
				<?php endif; ?>
			</div>
		</div>
		<?php if (!empty($rely)) : ?>
			<h2 class="mt-40">CÓ THỂ BẠN QUAN TÂM</h2>
			<div class="row">
				<?php foreach ($rely as $row) : ?>
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
		<?php endif; ?>
	</div>
</div>
<!-- Fancybox -->
<link rel="stylesheet" href="<?= public_url('dist/fancybox/jquery.fancybox.min.css') ?>">
<script src="<?= public_url('dist/fancybox/jquery.fancybox.min.js') ?>"></script>
<script>
	$(document).ready(function() {
		// Slide && Fancybox
		var bigimage = $("#big");
		var thumbs = $("#thumbs");
		var syncedSecondary = true;
		bigimage
			.owlCarousel({
				items: 1,
				slideSpeed: 2000,
				nav: false,
				autoplay: true,
				dots: false,
				loop: true,
				responsiveRefreshRate: 200,
			})
			.on("changed.owl.carousel", syncPosition);

		thumbs
			.on("initialized.owl.carousel", function() {
				thumbs
					.find(".owl-item")
					.eq(0)
					.addClass("current");
			})
			.owlCarousel({
				items: 5,
				dots: false,
				nav: true,
				margin: 15,
				navText: [
					'<i class="iwe iwe-arrow-left-white"></i>',
					'<i class="iwe iwe-arrow-right-white"></i>'
				],
				smartSpeed: 200,
				slideSpeed: 500,
				slideBy: 4,
				responsiveRefreshRate: 100
			})
			.on("changed.owl.carousel", syncPosition2);

		function syncPosition(el) {
			var count = el.item.count - 1;
			var current = Math.round(el.item.index - el.item.count / 2 - 0.5);

			if (current < 0) {
				current = count;
			}
			if (current > count) {
				current = 0;
			}
			thumbs
				.find(".owl-item")
				.removeClass("current")
				.eq(current)
				.addClass("current");
			var onscreen = thumbs.find(".owl-item.active").length - 1;
			var start = thumbs
				.find(".owl-item.active")
				.first()
				.index();
			var end = thumbs
				.find(".owl-item.active")
				.last()
				.index();

			if (current > end) {
				thumbs.data("owl.carousel").to(current, 100, true);
			}
			if (current < start) {
				thumbs.data("owl.carousel").to(current - onscreen, 100, true);
			}
		}

		function syncPosition2(el) {
			if (syncedSecondary) {
				var number = el.item.index;
				bigimage.data("owl.carousel").to(number, 100, true);
			}
		}
		thumbs.on("click", ".owl-item", function(e) {
			e.preventDefault();
			var number = $(this).index();
			bigimage.data("owl.carousel").to(number, 300, true);
		});

		$('#big .owl-item.cloned').find('a').removeAttr("data-fancybox");
	});
	// Qty
	$(document).ready(function() {
		$('.qty-inc').click(function() {
			var val = $(this).parent('.control').find('input').val();
			$(this).parent('.control').find('input').val(parseInt(val) + 1);
		});
		$('.qty-dec').click(function() {
			var val = $(this).parent('.control').find('input').val();
			if (val > 1)
				$(this).parent('.control').find('input').val(parseInt(val) - 1);
		});
	});
</script>