<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<?php $this->load->view('site/slide', $this->data) ?>
<?php if (!empty($homeProduct1)) : ?>
	<div class="homeProduct1 py-40">
		<div class="container">
			<div class="text-center">
				<h1 class="strong text-xl"><?= $homeProduct1Info->title ?></h1>
				<?php if (!empty($homeProduct1Info->intro)) : ?>
					<div class="mt-20 itext-6"><?= $homeProduct1Info->intro ?></div>
				<?php endif; ?>
			</div>
			<div class="row">
				<?php foreach ($homeProduct1 as $row) : ?>
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
		</div>
	</div>
<?php endif; ?>
<?php if (!empty($homeCatalog)) : ?>
	<div class="homeCatalog">
		<div class="container-fluid">
			<div class="row">
				<?php foreach ($homeCatalog as $row) : ?>
					<div class="col-lg-4">
						<div class="item-catalog position-relative">
							<a href="<?= base_url(_csp . '/' . $row->url) ?>">
								<div class="bg-img lazy ratio-1-1" data-src="<?= check_image('', $row->img) ?>"></div>
							</a>
							<div class="info mt-15 position-absolute text-white px-15 pb-15">
								<div class="intro line-1"><?= $row->intro ?></div>
								<h2 class="line-1 mb-15 mt-10 text-lg"><?= $row->name ?></h2>
								<a class="btn btn-more itext-primary bg-white rounded-0 text-xs" href="<?= base_url(_csp . '/' . $row->url) ?>">XEM THÊM</a>
							</div>
						</div>
					</div>
				<?php endforeach; ?>
			</div>
		</div>
	</div>
<?php endif; ?>
<?php if (!empty($homeProduct2)) : ?>
	<div class="homeProduct2 py-40">
		<div class="container">
			<div class="text-center">
				<h2 class="strong text-xl"><?= $homeProduct2Info->title ?></h2>
				<?php if (!empty($homeProduct2Info->intro)) : ?>
					<div class="mt-20 itext-6"><?= $homeProduct2Info->intro ?></div>
				<?php endif; ?>
			</div>
			<div class="row">
				<?php foreach ($homeProduct2 as $row) : ?>
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
		</div>
	</div>
<?php endif; ?>
<?php if (!empty($homeAbout)) : ?>
	<div class="homeAbout ibg-f1">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="box_stick" style="height: 100vh;">
						<div class="info position-absolute text-white pl-30 pr-30">
							<h2 class="text-lg mb-15"><?= $homeAbout->title ?></h2>
							<a class="btn btn-more itext-primary bg-white rounded-0 text-xs" href="<?= $homeAbout->link ?>">XEM THÊM</a>
						</div>
						<div class="bg-container">
							<img class="lazy" data-src="<?= check_image('', $homeAbout->img) ?>" alt="<?= $homeAbout->title ?>">
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="block-editor-content py-40">
						<iframe class="my-0" width="100%" src="<?= $homeAbout->video ?>" frameborder="0"></iframe>
						<?php if ($homeAbout->content) : ?>
							<div class="content mt-20"><?= $homeAbout->content ?></div>
						<?php endif; ?>
					</div>
				</div>
			</div>
		</div>
	</div>
<?php endif; ?>