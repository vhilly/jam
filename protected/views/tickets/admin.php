
<h1>Tickets</h1>


<?php $this->widget('bootstrap.widgets.TbGridView',array(
'id'=>'tickets-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'columns'=>array(
		'tkt_no',
		'schedule_id',
		array('name'=>'bus_id','value'=>'isset($data->bus->number) ? $data->bus->number :""','filter'=>CHtml::listData(Buses::model()->findAll(),'id','number')),
		array('name'=>'route_id','value'=>'$data->route->line','filter'=>CHtml::listData(Routes::model()->findAll(),'id','line')),
		array('name'=>'passenger_type_id','value'=>'$data->passengerType->name','filter'=>CHtml::listData(PassengerTypes::model()->findAll(),'id','name')),
		array('name'=>'ticket_type_id','value'=>'$data->ticketType->name','filter'=>CHtml::listData(TicketTypes::model()->findAll(),'id','name')),
		'amt',
		array('name'=>'status','value'=>'$data->status ==1 ? "Open" : "Closed"','filter'=>array('1'=>'Valid','2'=>'Canceled')),
		'created_at',
		'created_by',
array(
'class'=>'bootstrap.widgets.TbButtonColumn',
'template'=>'{update}',
),
),
)); ?>
