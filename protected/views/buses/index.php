<?php
$this->breadcrumbs=array(
	'Buses',
);

$this->menu=array(
array('label'=>'Create Buses','url'=>array('create')),
array('label'=>'Manage Buses','url'=>array('admin')),
);
?>

<h1>Buses</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
