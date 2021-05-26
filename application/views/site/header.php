<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<header>
	<div class="header-top ibg-primary py-1">
		<div class="container text-center text-white text-xs">
			<?php if (isJson($setAll->phone)->phone1) : ?>
				<a href="tel:<?= check_phone(isJson($setAll->phone)->phone1) ?>" class="text-white mr-2">
					Hotline: <strong><?= isJson($setAll->phone)->phone1 ?></strong>
				</a>
			<?php endif; ?>
			<?php if (isJson($setAll->address)->address1) : ?>
				//<span class="ml-2"><?= isJson($setAll->address)->address1 ?></span>
			<?php endif; ?>
		</div>
	</div>
	<!-- Desktop -->
	<div class="d-none d-lg-block">
		<div class="header position-relative py-15">
			<div class="container">
				<div class="row">
					<div class="col-lg-2 d-flex align-items-center">
						<a href="/">
							<img src="<?= isJson($setAll->logo)->image_link ?>" alt="<?= isJson($setAll->logo)->name ?>">
						</a>
					</div>
					<div class="col-lg-8 d-flex align-items-center justify-content-center">
						<form action="<?= base_url('tim-kiem') ?>" method="GET" class="box-search">
							<div class="input-group">
								<input type="text" name="keyword" class="form-control ibr-base-colord rounded-0" placeholder="Tìm kiếm..." value="<?= $this->input->get('keyword') ?>">
								<button type="submit" class="border-0 ibg-primary px-15 pointer"><i class="iwe iwe-search-white"></i></button>
							</div>
						</form>
					</div>
					<div class="col-lg-2 d-flex align-items-center justify-content-end">
						<a href="<?= base_url('gio-hang') ?>" class="w-cart">
							<div class="d-flex align-items-center">
								<i class="iwe iwe-cart-primary mr-1"><strong class="cart-ajax"><?= $total_items ?></strong></i>
								<b class="d-inline mt-2">Giỏ hàng</b>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		<?php $this->load->view('site/menu', $this->data) ?>
	</div>
	<!-- Mobile -->
	<div class="d-lg-none">
		<div class="block-mobile-nav d-flex justify-content-between align-items-center border-bottom">
			<a class="p-2 btn-menu" href="#menu-mobi">
				<i class="iwe iwe-bars-primary"></i><span class="sr-only">Menu</span>
			</a>
			<a class="p-1" href="/"><img src="<?= isJson($setAll->logo)->image_link ?>" alt="<?= isJson($setAll->logo)->name ?>" style="width:140px"></a>
			<div class="d-flex align-items-center">
				<a class="p-2" data-toggle="collapse" href="#collapseMBsearch" role="button" aria-expanded="false" aria-controls="collapseMBsearch"><i class="iwe iwe-search-primary"></i><span class="sr-only">Search</span></a>
				<a class="w-cart p-2" href="<?= base_url('gio-hang') ?>">
					<div class="d-flex align-items-center">
						<i class="iwe iwe-cart-primary mr-1"><strong class="cart-ajax"><?= $total_items ?></strong></i>
					</div>
				</a>
			</div>
		</div>
		<div class="dropfrm-search collapse" id="collapseMBsearch">
			<div class="nav-search">
				<form action="<?= base_url('tim-kiem') ?>" method="GET">
					<div class="input-group border-bottom">
						<input type="text" name="keyword" class="form-control rounded-0 border-0" placeholder="Từ khóa..." value="<?= $this->input->get('keyword') ?>">
						<div class="input-group-append">
							<button class="btn rounded-0 ibg-primary text-white" type="submit"><i class="iwe iwe-search-white"></i></button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<?php $this->load->view('site/menumobile', $this->data) ?>
	</div>
</header>