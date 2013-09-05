<?php
$this->breadcrumbs=array(
	'Locations'=>array('index'),
	'Manage',
);

$this->menu=array(
array('label'=>'List Location','url'=>array('index')),
array('label'=>'Create Location','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
$('.search-form').toggle();
return false;
});
$('.search-form form').submit(function(){
$.fn.yiiGridView.update('location-grid', {
data: $(this).serialize()
});
return false;
});
");
?>

<h1>Locations</h1>

<?php $this->widget('bootstrap.widgets.TbGridView',array(
'id'=>'location-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'columns'=>array(
#		'id',
		'name',
#		'active',
array(
'class'=>'bootstrap.widgets.TbButtonColumn',
),
),
)); ?>

<?php $this->widget('bootstrap.widgets.TbButton', array('type'=>'','buttonType'=>'link','icon'=>'icon-plus-sign','url'=>Yii::app()->createUrl('location/create'),'label'=>'Add Location'));
