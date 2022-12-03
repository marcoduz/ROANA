<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\Produto $model */
/** @var yii\widgets\ActiveForm $form */
?>
<div class="col d-flex justify-content-center">
<div class="produto-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]) ?>

    <?= $form->field($model, 'Nome')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Descricao')->textInput(['maxlength' => true]) ?>
    <p>
    <?= $form->field($model, 'Imagem')->fileInput() ?>
    </p>
    <?= $form->field($model, 'Valor')->textInput() ?>

    <?= $form->field($model, 'idCategoria')->textInput() ?>
    <p></p>
    <div class="form-group">
        <?= Html::submitButton('Salvar', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
</div>
