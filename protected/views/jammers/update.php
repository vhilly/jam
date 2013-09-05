<?php
$this->breadcrumbs=array(
	'Jammers'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

	$this->menu=array(
	array('label'=>'List Jammers','url'=>array('index')),
	array('label'=>'Create Jammers','url'=>array('create')),
	array('label'=>'View Jammers','url'=>array('view','id'=>$model->id)),
	array('label'=>'Manage Jammers','url'=>array('admin')),
	);
	?>

	<h1>Update Jammer</h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>
