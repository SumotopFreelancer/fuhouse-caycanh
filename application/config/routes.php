<?php
defined('BASEPATH') or exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/

// *** BACKEND ============================================================================

$route['admin/pages/(:num)'] = 'admin/pages/index/$1'; // Trang
$route['admin/pages'] = 'admin/pages/index'; // Danh s??ch

// $route['admin/tags/(:num)'] = 'admin/tags/index/$1';
// $route['admin/tags'] = 'admin/tags/index';

$route['admin/catalognew/(:num)'] = 'admin/catalognew/index/$1'; // Danh m???c tin t???c cha
$route['admin/catalognew'] = 'admin/catalognew/index'; // Danh s??ch
$route['admin/news/(:num)'] = 'admin/news/index/$1'; // Tin t???c
$route['admin/news'] = 'admin/news/index'; // Danh s??ch

// $route['admin/tagsproduct/(:num)'] = 'admin/tagsproduct/index/$1';
// $route['admin/tagsproduct'] = 'admin/tagsproduct/index';

$route['admin/catalog/(:num)'] = 'admin/catalog/index/$1'; // Danh m???c tin t???c cha
$route['admin/catalog'] = 'admin/catalog/index'; // Danh s??ch
$route['admin/products/(:num)'] = 'admin/products/index/$1'; // Tin t???c
$route['admin/products'] = 'admin/products/index'; // Danh s??ch

$route['admin/order/(:num)'] = 'admin/order/index/$1';
$route['admin/order'] = 'admin/order/index'; // Danh s??ch
$route['admin/orderinfo'] = 'admin/orderinfo/index'; // C??i ?????t kh??c

// $route['admin/catalogservice/(:num)'] = 'admin/catalogservice/index/$1'; // Danh m???c tin t???c cha
// $route['admin/catalogservice'] = 'admin/catalogservice/index'; // Danh s??ch
// $route['admin/services/(:num)'] = 'admin/services/index/$1'; // Tin t???c
// $route['admin/services'] = 'admin/services/index'; // Danh s??ch

// $route['admin/catalogimage/(:num)'] = 'admin/catalogimage/index/$1';// Danh m???c h??nh ???nh cha
// $route['admin/catalogimage'] = 'admin/catalogimage/index';// Danh s??ch
// $route['admin/images/(:num)'] = 'admin/images/index/$1';// H??nh ???nh
// $route['admin/images'] = 'admin/images/index';// Danh s??ch

// $route['admin/feedback/(:num)'] = 'admin/feedback/index/$1';// ?? ki???n kh??ch h??ng
// $route['admin/feedback'] = 'admin/feedback/index';// Danh s??ch

// $route['admin/supportonline/(:num)'] = 'admin/supportonline/index/$1';// H??? tr??? tr???c tuy???n
// $route['admin/supportonline'] = 'admin/supportonline/index';// Danh s??ch

$route['admin/contact/(:num)'] = 'admin/contact/index/$1'; // Kh??ch h??ng li??n h???
$route['admin/contact'] = 'admin/contact/index'; // Danh s??ch

$route['admin/contactphone/(:num)'] = 'admin/contactphone/index/$1'; // Kh??ch h??ng li??n h???
$route['admin/contactphone'] = 'admin/contactphone/index'; // Danh s??ch

$route['admin/contactemail/(:num)'] = 'admin/contactemail/index/$1'; // Kh??ch h??ng li??n h???
$route['admin/contactemail'] = 'admin/contactemail/index'; // Danh s??ch

// $route['admin/contactfooter/(:num)'] = 'admin/contactfooter/index/$1';// Kh??ch h??ng li??n h???
// $route['admin/contactfooter'] = 'admin/contactfooter/index';// Danh s??ch

$route['admin/menu'] = 'admin/menu/index'; // Danh s??ch

$route['admin/slide/(:num)'] = 'admin/slide/index/$1'; // Slide
$route['admin/slide'] = 'admin/slide/index'; // Danh s??ch

// $route['admin/notlink/(:num)'] = 'admin/notlink/index/$1'; // ??i???m kh??c bi???t
// $route['admin/notlink'] = 'admin/notlink/index'; // Danh s??ch

// $route['admin/headerlink/(:num)'] = 'admin/headerlink/index/$1'; // Li??n k???t t??y ch???nh Header
// $route['admin/headerlink'] = 'admin/headerlink/index'; // Li??n k???t t??y ch???nh Header

// $route['admin/visit/(:num)'] = 'admin/visit/index/$1';// Th???ng k?? truy c???p
// $route['admin/visit'] = 'admin/visit/index';// Th???ng k?? truy c???p

$route['admin/pagehome'] = 'admin/pagehome/index'; // Trang ch???
$route['admin/pagecontact'] = 'admin/pagecontact/index'; // Trang li??n h???
$route['admin/header'] = 'admin/header/index'; // Header
$route['admin/footer'] = 'admin/footer/index'; // Footer
$route['admin/sidebar'] = 'admin/sidebar/index'; // Sidebar
$route['admin/social'] = 'admin/social/index'; // M???ng x?? h???i
$route['admin/script'] = 'admin/script/index'; // Script
$route['admin/infowebsite'] = 'admin/infowebsite/index'; // Th??ng tin chung
$route['admin/othersetting'] = 'admin/othersetting/index'; // C??i ?????t kh??c
$route['admin/deletecache'] = 'admin/deletecache/index'; // X??a cache

$route['admin/admin/(:num)'] = 'admin/admin/index/$1'; // Qu???n tr??? vi??n
$route['admin/admin'] = 'admin/admin/index'; // Qu???n tr??? vi??n

$route['admin/admingroup/(:num)'] = 'admin/admingroup/index/$1'; // Nh??m qu???n tr???
$route['admin/admingroup'] = 'admin/admingroup/index'; // Nh??m qu???n tr???

$route['admin/login'] = 'admin/login/index'; // ????ng nh???p
$route['admin/home'] = 'admin/home/index'; // Dashboard
$route['admin'] = 'admin/home/index'; // Dashboard

$route['admin/(:any)'] = 'myerror'; // Error


// *** FRONTEND ============================================================================

// Trang t??m ki???m
$route['tim-kiem/(:num)'] = 'search/index/$1';
$route['tim-kiem'] = 'search';

// Trang li??n h???
$route['contact-phone'] = 'contact/contact_phone';
$route['contact-email'] = 'contact/contact_email';
// $route['contact-footer'] = 'contact/contact_footer';
$route['lien-he'] = 'contact';

// Gi??? h??ng
$route['gio-hang/them-vao-gio-hang'] = 'cart/addajax';
$route['gio-hang/cap-nhat-so-luong'] = 'cart/updateajax';
$route['gio-hang/xoa-san-pham-trong-gio-hang'] = 'cart/deleteajax';
$route['gio-hang'] = 'cart';
$route['thong-tin-thanh-toan'] = 'order/checkout';
$route['dat-hang-thanh-cong'] = 'order/cartdone';

// Trang
$route[_pg . '/(:any)/(:num)'] = 'pages/view/$1/$2';
$route[_pg . '/(:any)'] = 'pages/view/$1';

// // Tags s???n ph???m
// $route[_tagsproduct . '/(:any)/(:num)'] = 'products/tags/$1/$2';
// $route[_tagsproduct . '/(:any)'] = 'products/tags/$1';

// S???n ph???m
$route[_csp . '/(:any)/(:num)'] = 'products/catalog/$1/$2'; // Danh m???c ph??n trang
$route[_csp . '/(:any)'] = 'products/catalog/$1'; // Danh m???c
$route[_sp . '/(:any)'] = 'products/view/$1';

// // Dich vu
// $route[_cdv . '/(:any)/(:num)'] = 'services/catalog/$1/$2'; // Danh m???c ph??n trang
// $route[_cdv . '/(:any)'] = 'services/catalog/$1'; // Danh m???c
// $route[_dv . '/(:any)'] = 'services/view/$1';

// // H??nh ???nh
// $route[_cim.'/(:any)/(:num)'] = 'images/catalog/$1/$2'; // Danh m???c ph??n trang
// $route[_cim.'/(:any)'] = 'images/catalog/$1'; // Danh m???c
// $route[_im.'/(:any)'] = 'images/view/$1';

// // Tags tin t???c
// $route[_tags . '/(:any)/(:num)'] = 'news/tags/$1/$2';
// $route[_tags . '/(:any)'] = 'news/tags/$1';

// B??i vi???t
$route['(:any)/(:num)'] = 'news/catalog/$1/$2'; // Danh m???c ph??n trang
$route['(:any)/(:any)'] = 'news/view/$2';
$route['(:any)'] = 'news/catalog/$1'; // Danh m???c

/* Defaul page: error, home */
$route['default_controller'] = 'home';
$route['404_override'] = 'myerror';
$route['translate_uri_dashes'] = FALSE;
