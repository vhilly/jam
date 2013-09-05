<?php
$this->breadcrumbs=array(
	'Routes',
);

$this->menu=array(
array('label'=>'Create Routes','url'=>array('create')),
array('label'=>'Manage Routes','url'=>array('admin')),
);
?>

<h1>Routes</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
