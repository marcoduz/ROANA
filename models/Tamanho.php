<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tamanho".
 *
 * @property string $Nome
 * @property int $id
 *
 * @property ProdutosPedidos[] $produtosPedidos
 * @property Quantidade[] $quantidades
 */
class Tamanho extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tamanho';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Nome'], 'required'],
            [['Nome'], 'string', 'max' => 10],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'Nome' => 'Nome',
            'id' => 'ID',
        ];
    }

    /**
     * Gets query for [[ProdutosPedidos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProdutosPedidos()
    {
        return $this->hasMany(ProdutosPedidos::class, ['Tamanhoid' => 'id']);
    }

    /**
     * Gets query for [[Quantidades]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getQuantidades()
    {
        return $this->hasMany(Quantidade::class, ['Tamanhoid' => 'id']);
    }
}
