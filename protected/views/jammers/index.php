<?php
$this->breadcrumbs=array(
	'Jammers',
);

$this->menu=array(
array('label'=>'Create Jammers','url'=>array('create')),
array('label'=>'Manage Jammers','url'=>array('admin')),
);
?>

<h1>Jammers</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
