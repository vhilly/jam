
<h1>Tickets</h1>


<?php $this->widget('bootstrap.widgets.TbGridView',array(
'id'=>'tickets-grid',
'dataProvider'=>$model->search(),

'afterAjaxUpdate'=>"function() {
  jQuery('#Tickets_created_at').datepicker({'format':'yyyy-mm-dd','language':'en','weekStart':0});
}",

'filter'=>$model,
'columns'=>array(
		'tkt_no',
		'schedule_id',
		array('name'=>'bus_id','value'=>'isset($data->bus->number) ? $data->bus->number :""','filter'=>CHtml::listData(Buses::model()->findAll(),'id','number')),
		array('name'=>'route_id','value'=>'$data->route->line','filter'=>CHtml::listData(Routes::model()->findAll(),'id','line')),
		array('name'=>'passenger_type_id','value'=>'$data->passengerType->name','filter'=>CHtml::listData(PassengerTypes::model()->findAll(),'id','name')),
		array('name'=>'ticket_type_id','value'=>'$data->ticketType->name','filter'=>CHtml::listData(TicketTypes::model()->findAll(),'id','name')),
		'amt',
		array('name'=>'status','value'=>'$data->status ==1 ? "Valid" : "Cancelled"','filter'=>array('1'=>'Valid','2'=>'Canceled')),

		array(
                  'name'=>'created_at',
                        'filter'=>$this->widget('bootstrap.widgets.TbDatePicker', array(
                          'model'=>$model,
                          'options'=>array('format'=>'yyyy-mm-dd'),
                          'htmlOptions' => array(
                            'id' => 'Tickets_created_at'
                          ),
                         'attribute'=>'created_at'),
                        true),
                        'sortable'=>true,
                ),

#		'created_at',
#		'created_by',
		array('name'=>'created_by','value'=>'$data->user->username','filter'=>CHtml::listData(Users::model()->findAll(),'id','username')),
array(
'class'=>'bootstrap.widgets.TbButtonColumn',
'template'=>'{reprint} {update}',
'buttons'=>array(            
  'reprint' => array(
    'icon'=>'icon-barcode',
    'label'=>'Reprint Ticket',
     'url'=>'Yii::app()->createUrl("tickets/print",array("id"=>$data->id))',
   ),
),
),
),
)); ?>
