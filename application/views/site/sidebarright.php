<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<div class="col-lg-3 d-none d-lg-block">
	<?php if (isset($newsSidebar) && $newsSidebar) : ?>
		<div class="rightBar shadow-sm">
			<h3 class="b py-15 px-15 ibg-primary text-white text-md"><i class="iwe iwe-bars-white mr-10"></i><?= $setAll->sidebar ?></h3>
			<ul class="py-10 px-10">
				<?php foreach ($newsSidebar as $key => $row) : ?>
					<?php $c = $this->catalognew_model->get_info($row->catalog_id) ?>
					<li class="b <?= $key > 0 ? 'mt-10 pt-10 border-top ibr-top-dashed' : '' ?>">
						<a href="<?= base_url($c->url . '/' . $row->url) ?>">
							<div class="bg-img lazy" data-src="<?= check_image('', $row->image_link) ?>"></div>
							<div class="name-new line-2"><?= $row->name ?></div>
							<div class="clearfix"></div>
						</a>
					</li>
				<?php endforeach; ?>
			</ul>
		</div>
	<?php endif; ?>
</div>