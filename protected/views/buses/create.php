<?php
$this->breadcrumbs=array(
	'Buses'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List Buses','url'=>array('index')),
array('label'=>'Manage Buses','url'=>array('admin')),
);
?>

<h1>Add Bus</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>
