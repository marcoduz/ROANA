<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "produto".
 *
 * @property string $Nome
 * @property string $Descricao
 * @property string $Imagem
 * @property float $Valor
 * @property int $id
 * @property int $idCategoria
 *
 * @property Categorias $idCategoria0
 * @property ProdutosPedidos[] $produtosPedidos
 * @property Quantidade[] $quantidades
 */
class Produto extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'produto';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Nome', 'Descricao', 'Imagem', 'Valor', 'idCategoria'], 'required'],
            [['Valor'], 'number'],
            [['idCategoria'], 'integer'],
            [['Nome'], 'string', 'max' => 50],
            [['Descricao'], 'string', 'max' => 100],
            [['Imagem'],'file','extensions'=>('jpg,png,jpeg')],
            [['idCategoria'], 'exist', 'skipOnError' => true, 'targetClass' => Categorias::class, 'targetAttribute' => ['idCategoria' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'Nome' => 'Nome',
            'Descricao' => 'Descricao',
            'Imagem' => 'Imagem',
            'Valor' => 'Valor',
            'id' => 'ID',
            'idCategoria' => 'Id Categoria',
        ];
    }

    /**
     * Gets query for [[IdCategoria0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdCategoria0()
    {
        return $this->hasOne(Categorias::class, ['id' => 'idCategoria']);
    }

    /**
     * Gets query for [[ProdutosPedidos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProdutosPedidos()
    {
        return $this->hasMany(ProdutosPedidos::class, ['Produtoid' => 'id']);
    }

    /**
     * Gets query for [[Quantidades]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getQuantidades()
    {
        return $this->hasMany(Quantidade::class, ['Produtoid' => 'id']);
    }
}
