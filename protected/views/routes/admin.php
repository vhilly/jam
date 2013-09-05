<?php $location = CHtml::listData(Location::model()->findAll(),'id','name')?>
<h1>Routes</h1>
<?php $this->widget('bootstrap.widgets.TbGridView',array(
  'id'=>'routes-grid',
  'dataProvider'=>$model->search(),
  'filter'=>$model,
  'columns'=>array(
    'line',
    array('name'=>'origin','filter'=>$location,'value'=>'$data->origin0->name'),
    array('name'=>'destination','filter'=>$location,'value'=>'$data->destination0->name'),
    'distance',
    'travel_time',
    #'other_info',
    'fare',
    #'active',
    array(
      'class'=>'bootstrap.widgets.TbButtonColumn',
    ),
  ),
  )); 
?>
<?php $this->widget('bootstrap.widgets.TbButton', array('type'=>'','buttonType'=>'link','icon'=>'icon-plus-sign','url'=>Yii::app()->createUrl('routes/create'),'label'=>'Add Route'));
