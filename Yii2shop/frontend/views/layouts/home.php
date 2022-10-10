<?php

/* @var $this \yii\web\View */
/* @var $content string */

use frontend\widgets\Blog\LastPostsWidget;
use frontend\widgets\Shop\FeaturedProductsWidget;

\frontend\assets\OwlCarouselAsset::register($this);

?>
<?php $this->beginContent('@frontend/views/layouts/main.php') ?>

<div class="row">
    <div id="content" class="col-sm-12">
        <div id="slideshow0" class="owl-carousel" style="opacity: 1;">
            <div class="item">
                <a href="#"><img
                            src="http://static.shop.d/cache/banners/Fall_sale.jpg"
                            alt="Fall sale" class="img-responsive"/></a>
            </div>
            <div class="item">
                <img src="http://static.shop.d/cache/banners/Clearance.jpg"
                     alt="Clearence discount" class="img-responsive"/>
            </div>
        </div>
        <h3>Featured</h3>

        <?= FeaturedProductsWidget::widget([
            'limit' => 4,
        ]) ?>

        <h3>Last Posts</h3>

        <?= LastPostsWidget::widget([
            'limit' => 4,
        ]) ?>

        <div id="carousel0" class="owl-carousel">
            <div class="item">
                <img src="http://static.shop.d/cache/manufacturers/acer.png" alt="acer"
                     class="img-responsive"/>
            </div>
            <div class="item">
                <img src="http://static.shop.d/cache/manufacturers/apple.png"
                     alt="apple" class="img-responsive"/>
            </div>
            <div class="item text-center">
                <img src="http://static.shop.d/cache/manufacturers/sony.png" alt="Sony"
                     class="img-responsive"/>
            </div>
            <div class="item text-center">
                <img src="http://static.shop.d/cache/manufacturers/asus.jpg"
                     alt="asus" class="img-responsive"/>
            </div>
            <div class="item text-center">
                <img src="http://static.shop.d/cache/manufacturers/dell.jpg" alt="dell"
                     class="img-responsive"/>
            </div>
            <div class="item text-center">
                <img src="http://static.shop.d/cache/manufacturers/hp.png"
                     alt="hp" class="img-responsive"/>
            </div>
            <div class="item text-center">
                <img src="http://static.shop.d/cache/manufacturers/intel.png" alt="intel"
                     class="img-responsive"/>
            </div>
            <div class="item text-center">
                <img src="http://static.shop.d/cache/manufacturers/msi.png"
                     alt="msi" class="img-responsive"/>
            </div>
        </div>
        <?= $content ?>
    </div>
</div>

<?php $this->registerJs('
$(\'#slideshow0\').owlCarousel({
    items: 1,
    loop: true,
    autoplay:true,
    autoplayTimeout:3000,
    autoplayHoverPause:true,
    nav: true,
    navText: [\'<i class="fa fa-chevron-left fa-5x"></i>\', \'<i class="fa fa-chevron-right fa-5x"></i>\'],
    dots: true
});') ?>

<?php $this->registerJs('
$(\'#carousel0\').owlCarousel({
    items: 6,
    loop: true,
    autoplay:true,
    autoplayTimeout:3000,
    autoplayHoverPause:true,
    nav: true,
    navText: [\'<i class="fa fa-chevron-left fa-5x"></i>\', \'<i class="fa fa-chevron-right fa-5x"></i>\'],
    dots: true
});') ?>

<?php $this->endContent() ?>