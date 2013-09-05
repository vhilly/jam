<?php
$this->breadcrumbs=array(
	'Drivers'=>array('index'),
	$model->name,
);

$this->menu=array(
array('label'=>'List Drivers','url'=>array('index')),
array('label'=>'Create Drivers','url'=>array('create')),
array('label'=>'Update Drivers','url'=>array('update','id'=>$model->id)),
array('label'=>'Delete Drivers','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
array('label'=>'Manage Drivers','url'=>array('admin')),
);
?>

<h1><?php echo $model->name; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
'data'=>$model,
'attributes'=>array(
		'id',
		'name',
		'contact_no',
),
)); ?>
