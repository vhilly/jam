<?php
$this->breadcrumbs=array(
	'Tickets'=>array('index'),
	$model->id,
);

$this->menu=array(
array('label'=>'List Tickets','url'=>array('index')),
array('label'=>'Create Tickets','url'=>array('create')),
array('label'=>'Update Tickets','url'=>array('update','id'=>$model->id)),
array('label'=>'Delete Tickets','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
array('label'=>'Manage Tickets','url'=>array('admin')),
);
?>

<h1>View Tickets #<?php echo $model->id; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
'data'=>$model,
'attributes'=>array(
		'id',
		'tkt_no',
		'schedule_id',
		'seat_id',
		'bus_id',
		'route_id',
		'passenger_type_id',
		'ticket_type_id',
		'amt',
		'status',
		'created_at',
		'created_by',
),
)); ?>
