<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
        <img src="<?=$assetDir?>/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="<?=$assetDir?>/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block">Alexander Pierce</a>
            </div>
        </div>

        <!-- SidebarSearch Form -->
        <!-- href be escaped -->
        <!-- <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div> -->

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <?php
            echo \hail812\adminlte\widgets\Menu::widget([
                'items' => [
                    [
                        'label' => 'Starter Pages',
                        'icon' => 'tachometer-alt',
                        'badge' => '<span class="right badge badge-info">2</span>',
                        'items' => [
                            ['label' => 'Active Page', 'url' => ['site/index'], 'iconStyle' => 'far'],
                            ['label' => 'Inactive Page', 'iconStyle' => 'far'],
                        ]
                    ],
                    ['label' => 'Пользователи', 'icon' => 'user', 'url' => ['/user/index'], 'active' => Yii::$app->controller->id == 'user'],
                    ['label' => 'Management', 'options' => ['class' => 'header']],
                    ['label' => 'Shop', 'icon' => 'folder', 'items' => [
                        ['label' => 'Orders', 'icon' => 'file-o', 'url' => ['/shop/order/index'], 'active' => $this->context->id == 'shop/order'],
                        ['label' => 'Products', 'icon' => 'file-o', 'url' => ['/shop/product/index'], 'active' => $this->context->id == 'shop/product'],
                        ['label' => 'Brands', 'icon' => 'file-o', 'url' => ['/shop/brand/index'], 'active' => $this->context->id == 'shop/brand'],
                        ['label' => 'Tags', 'icon' => 'file-o', 'url' => ['/shop/tag/index'], 'active' => $this->context->id == 'shop/tag'],
                        ['label' => 'Categories', 'icon' => 'file-o', 'url' => ['/shop/category/index'], 'active' => $this->context->id == 'shop/category'],
                        ['label' => 'Characteristics', 'icon' => 'file-o', 'url' => ['/shop/characteristic/index'], 'active' => $this->context->id == 'shop/characteristic'],
                        ['label' => 'Delivery Methods', 'icon' => 'file-o', 'url' => ['/shop/delivery/index'], 'active' => $this->context->id == 'shop/delivery'],
                    ]],
                    ['label' => 'Blog', 'icon' => 'folder', 'items' => [
                        ['label' => 'Posts', 'icon' => 'file-o', 'url' => ['/blog/post/index'], 'active' => $this->context->id == 'blog/post'],
                        ['label' => 'Comments', 'icon' => 'file-o', 'url' => ['/blog/comment/index'], 'active' => $this->context->id == 'blog/comment'],
                        ['label' => 'Tags', 'icon' => 'file-o', 'url' => ['/blog/tag/index'], 'active' => $this->context->id == 'blog/tag'],
                        ['label' => 'Categories', 'icon' => 'file-o', 'url' => ['/blog/category/index'], 'active' => $this->context->id == 'blog/category'],
                    ]],
                    ['label' => 'Content', 'icon' => 'folder', 'items' => [
                        ['label' => 'Pages', 'icon' => 'file-o', 'url' => ['/page/index'], 'active' => $this->context->id == 'page'],
                        ['label' => 'Files', 'icon' => 'file-o', 'url' => ['/file/index'], 'active' => $this->context->id == 'file'],
                    ]],
                    ['label' => 'Users', 'icon' => 'user', 'url' => ['/user/index'], 'active' => $this->context->id == 'user/index'],

                    //['label' => 'Simple Link', 'icon' => 'th', 'badge' => '<span class="right badge badge-danger">New</span>'],
                    ['label' => 'Yii2 PROVIDED', 'header' => true],
                    ['label' => 'Login', 'url' => ['auth/login'], 'icon' => 'sign-in-alt', 'visible' => Yii::$app->user->isGuest],
                    ['label' => 'Gii',  'icon' => 'file-code', 'url' => ['/gii'], 'target' => '_blank'],
                    ['label' => 'Debug', 'icon' => 'bug', 'url' => ['/debug'], 'target' => '_blank'],
              /*      ['label' => 'MULTI LEVEL EXAMPLE', 'header' => true],
                    ['label' => 'Level1'],
                    [
                        'label' => 'Level1',
                        'items' => [
                            ['label' => 'Level2', 'iconStyle' => 'far'],
                            [
                                'label' => 'Level2',
                                'iconStyle' => 'far',
                                'items' => [
                                    ['label' => 'Level3', 'iconStyle' => 'far', 'icon' => 'dot-circle'],
                                    ['label' => 'Level3', 'iconStyle' => 'far', 'icon' => 'dot-circle'],
                                    ['label' => 'Level3', 'iconStyle' => 'far', 'icon' => 'dot-circle']
                                ]
                            ],
                            ['label' => 'Level2', 'iconStyle' => 'far']
                        ]
                    ],
                    ['label' => 'Level1'],
                    ['label' => 'LABELS', 'header' => true],
                    ['label' => 'Important', 'iconStyle' => 'far', 'iconClassAdded' => 'text-danger'],
                    ['label' => 'Warning', 'iconClass' => 'nav-icon far fa-circle text-warning'],
                    ['label' => 'Informational', 'iconStyle' => 'far', 'iconClassAdded' => 'text-info'],
              */
                ],
            ]);
            ?>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>