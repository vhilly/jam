<?php
$this->breadcrumbs=array(
	'Passenger Types'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

	$this->menu=array(
	array('label'=>'List PassengerTypes','url'=>array('index')),
	array('label'=>'Create PassengerTypes','url'=>array('create')),
	array('label'=>'View PassengerTypes','url'=>array('view','id'=>$model->id)),
	array('label'=>'Manage PassengerTypes','url'=>array('admin')),
	);
	?>

	<h1>Update Passenger Type</h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>
