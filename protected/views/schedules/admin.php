
<h1>Trips</h1>


<?php $this->widget('bootstrap.widgets.TbGridView',array(
'id'=>'schedules-grid',
'dataProvider'=>$model->search(),
'afterAjaxUpdate'=>"function() {
  jQuery('#Schedules_departure_date').datepicker({'format':'yyyy-mm-dd','language':'en','weekStart':0});
}",
'filter'=>$model,
'columns'=>array(
                'id',
		array('name'=>'bus_id','filter'=>CHtml::listData(Buses::model()->findAll(),'id','name'),'value'=>'$data->bus->name'),
		array('name'=>'driver_id','filter'=>CHtml::listData(Drivers::model()->findAll(),'id','name'),'value'=>'ucwords(strtolower($data->driver->name))'),
		array('name'=>'route_id','filter'=>CHtml::listData(Routes::model()->findAll(),'id','line'),'value'=>'$data->route->line'),
                array(
                  'name'=>'departure_date',
                        'filter'=>$this->widget('bootstrap.widgets.TbDatePicker', array(
                          'model'=>$model,
                          'options'=>array('format'=>'yyyy-mm-dd'),
                          'htmlOptions' => array(
                            'id' => 'Schedules_departure_date'
                          ),
                         'attribute'=>'departure_date'), 
                        true),
			'sortable'=>true,
                ),
                'departure_time',
                'arrival_time',
		array('name'=>'status','filter'=>array('1'=>'Open','2'=>'Closed'),'value'=>'$data->status == 1 ? "Open" : "Closed"'),
		/*
		'created_at',
		*/
array(
'class'=>'bootstrap.widgets.TbButtonColumn',
'template'=>'{update}',
),
),
)); ?>
<?php $this->widget('bootstrap.widgets.TbButton', array('type'=>'','buttonType'=>'link','icon'=>'icon-plus-sign','url'=>Yii::app()->createUrl('schedules/create'),'label'=>'Add Trip'));
