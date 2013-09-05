<?php
$this->breadcrumbs=array(
	'Passenger Types'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List PassengerTypes','url'=>array('index')),
array('label'=>'Manage PassengerTypes','url'=>array('admin')),
);
?>

<h1>Add Passenger Type</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>
