<?php
$this->breadcrumbs=array(
	'Drivers'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

	$this->menu=array(
	array('label'=>'List Drivers','url'=>array('index')),
	array('label'=>'Create Drivers','url'=>array('create')),
	array('label'=>'View Drivers','url'=>array('view','id'=>$model->id)),
	array('label'=>'Manage Drivers','url'=>array('admin')),
	);
	?>

	<h1>Update Drivers <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>