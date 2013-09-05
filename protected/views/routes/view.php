<?php
$this->breadcrumbs=array(
	'Routes'=>array('index'),
	$model->id,
);

$this->menu=array(
array('label'=>'List Routes','url'=>array('index')),
array('label'=>'Create Routes','url'=>array('create')),
array('label'=>'Update Routes','url'=>array('update','id'=>$model->id)),
array('label'=>'Delete Routes','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
array('label'=>'Manage Routes','url'=>array('admin')),
);
?>

<h1><?php echo $model->line; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
'data'=>$model,
'attributes'=>array(
		'id',
		'line',
		'origin',
		'destination',
		'distance',
		'travel_time',
		'other_info',
		'fare',
		'active',
),
)); ?>
