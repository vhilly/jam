<?php
$this->breadcrumbs=array(
	'Passenger Types'=>array('index'),
	'Manage',
);

$this->menu=array(
array('label'=>'List PassengerTypes','url'=>array('index')),
array('label'=>'Create PassengerTypes','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
$('.search-form').toggle();
return false;
});
$('.search-form form').submit(function(){
$.fn.yiiGridView.update('passenger-types-grid', {
data: $(this).serialize()
});
return false;
});
");
?>

<h1>Passenger Types</h1>

<?php $this->widget('bootstrap.widgets.TbGridView',array(
'id'=>'passenger-types-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'columns'=>array(
#		'id',
		'name',
		'discount',
#		'active',
array(
'class'=>'bootstrap.widgets.TbButtonColumn',
),
),
)); ?>
<?php $this->widget('bootstrap.widgets.TbButton', array('type'=>'','buttonType'=>'link','icon'=>'icon-plus-sign','url'=>Yii::app()->createUrl('passengerTypes/create'),'label'=>'Add Passenger Type'));

