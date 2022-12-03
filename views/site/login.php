<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */
/** @var app\models\LoginForm $model */

use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;

$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="col d-flex justify-content-center">
<div class="site-login">
    <h1><?= Html::encode($this->title) ?></h1>

    <p>Por favor preencha os campos para realizar o login:</p>

    <?php $form = ActiveForm::begin([
        'id' => 'login-form',
        'layout' => 'horizontal',
        'fieldConfig' => [
            'template' => "{label}\n{input}\n{error}",
            'labelOptions' => ['class' => 'col-lg-1 col-form-label mr-lg-3'],
            'inputOptions' => ['class' => 'col-lg-3 form-control'],
            'errorOptions' => ['class' => 'col-lg-7 invalid-feedback'],
        ],
    ]); ?>

        <?= $form->field($model, 'username')->textInput(['autofocus' => true]) ?>

        <?= $form->field($model, 'password')->passwordInput() ?>
        <div class="form-group">
            <div class="offset-lg-1 col-lg-11">
                <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
                    <li class="nav-item" role="presentation">
                        <?= Html::submitButton('Login', ['class' => 'btn btn-primary', 'name' => 'login-button']) ?>
                    </li>
                    <li class="nav-item" role="presentation">
                         <p><a class="btn btn-outline-secondary" href="http://localhost/roana/web/index.php?r=usuario%2Fcreate">Registre-se</a></p>
                    </li>
                </ul>
            </div>
        </div>

    <?php ActiveForm::end(); ?>

</div>
