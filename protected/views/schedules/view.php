

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
'data'=>$model,
'attributes'=>array(
		'id',
		'bus_id',
		'route_id',
		'departure_time',
		'arrival_time',
		'status',
		'created_at',
),
)); ?>
