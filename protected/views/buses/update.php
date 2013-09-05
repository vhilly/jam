<?php
$this->breadcrumbs=array(
	'Buses'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

	$this->menu=array(
	array('label'=>'List Buses','url'=>array('index')),
	array('label'=>'Create Buses','url'=>array('create')),
	array('label'=>'View Buses','url'=>array('view','id'=>$model->id)),
	array('label'=>'Manage Buses','url'=>array('admin')),
	);
	?>

	<h1>Update Bus</h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>
