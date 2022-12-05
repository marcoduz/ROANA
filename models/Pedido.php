<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pedido".
 *
 * @property float $Valor
 * @property int $id
 * @property string $Criado
 * @property int $Concluido
 * @property int $Usuarioid
 *
 * @property ProdutosPedidos[] $produtosPedidos
 * @property Usuario $usuario
 */
class Pedido extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'pedido';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Valor', 'Criado', 'Concluido', 'Usuarioid'], 'required'],
            [['Valor'], 'number'],
            [['Criado'], 'safe'],
            [['Concluido', 'Usuarioid'], 'integer'],
            [['Usuarioid'], 'exist', 'skipOnError' => true, 'targetClass' => Usuario::class, 'targetAttribute' => ['Usuarioid' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'Valor' => 'Valor',
            'id' => 'ID',
            'Criado' => 'Criado',
            'Concluido' => 'Concluido',
            'Usuarioid' => 'Usuarioid',
        ];
    }

    /**
     * Gets query for [[ProdutosPedidos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProdutosPedidos()
    {
        return $this->hasMany(ProdutosPedidos::class, ['Pedidoid' => 'id']);
    }

    /**
     * Gets query for [[Usuario]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsuario()
    {
        return $this->hasOne(Usuario::class, ['id' => 'Usuarioid']);
    }
}
