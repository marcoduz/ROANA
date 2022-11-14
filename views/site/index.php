<?php

/** @var yii\web\View $this */

$this->title = 'My Yii Application';
?>
<div class="site-index">

    <div class="jumbotron text-center bg-transparent">
        <h1 class="display-4">ROANA!</h1>

        <p class="lead">You have successfully created your Yii-powered application.</p>

        <p><a class="btn btn-lg btn-success" href="http://www.yiiframework.com">Get started with Yii</a></p>
    </div>

    <div class="body-content">

        <div class="row">
            <div class="col-lg-4">
                <h2>Produto</h2>

                <p><a class="btn btn-outline-secondary" href="http://localhost/roana/web/index.php?r=produto">Crud</a></p>
            </div>
            <div class="col-lg-4">
                <h2>Novo Usuário</h2>

                <p><a class="btn btn-outline-secondary" href="http://localhost/roana/web/index.php?r=usuario%2Fcreate">User</a></p>
            </div>
            <div class="col-lg-4">
                <h2>Categorias</h2>

                <p><a class="btn btn-outline-secondary" href="http://localhost/roana/web/index.php?r=categorias">Categorias</a></p>
            </div>
        </div>

    </div>
</div>
