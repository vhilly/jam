<?php
$this->breadcrumbs=array(
	'Schedules',
);

$this->menu=array(
array('label'=>'Create Schedules','url'=>array('create')),
array('label'=>'Manage Schedules','url'=>array('admin')),
);
?>

<h1>Schedules</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
