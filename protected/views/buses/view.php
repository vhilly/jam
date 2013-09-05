
<h1><?php echo $model->name; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
'data'=>$model,
'attributes'=>array(
		'name',
		'seats',
		'number',
		'bus_info',
),
)); ?>
<?php $this->widget('bootstrap.widgets.TbButton', array(
  'type'=>'',
  'buttonType'=>'link',
  //'icon'=>'',
  'url'=>Yii::app()->createUrl('buses/admin'),'label'=>'Back'));
?>
