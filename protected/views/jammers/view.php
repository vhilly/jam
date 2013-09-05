<?php $box = $this->beginWidget('bootstrap.widgets.TbBox', array(
  'title' => 'JAMMER CLUB MEMBER',
  'headerIcon' => 'people',
  'htmlOptions' => array('class'=>'bootstrap-widget-table'),
  'headerButtons' => array(
    array(
    'class' => 'bootstrap.widgets.TbButtonGroup',
      'buttons'=>array(
        array('label'=>'Back', 'url'=>Yii::app()->createUrl('jammers/admin')),
        array('label'=>'Update', 'url'=>Yii::app()->createUrl('jammers/update',array('id'=>$model->id)))
      ),
    ),
  )
));?>
<table class=span5>
  <tr>
    <th>ID#:</th>
    <th><?=$model->id_no?></th>
  </tr>
  <tr>
    <th>First Name:</th>
    <td><?=ucwords(strtolower($model->first_name))?></td>
    <td rowspan=2 colspan=2><?=$model->id_picture ? CHtml::image($this->createUrl("jammers/showimage", array("id"=>$model->id)),'image',array('width'=>100,'height'=>100,'align'=>'right')) :'<i>Image not found</i>';?></td>
  </tr>
  <tr>
    <th>Last Name:</th>
    <td><?=ucwords(strtolower($model->last_name))?></td>
  </tr>
  <tr>
    <th>Birthday:</th>
    <td><?=$model->birthdate?></td>
    <th>Date Registered:</th>
    <td><?=$model->registered_date?></td>
  </tr>
  <tr>
    <th>Issuance:</th>
    <td><?=$model->issuance_date?></td>
    <th>Validity:</th>
    <td><?=$model->validity_date?></td>
  </tr>
</table>
<?php $this->endWidget();?>
