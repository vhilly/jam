
<h1>Buses</h1>

<?php $this->widget('bootstrap.widgets.TbGridView',array(
'id'=>'buses-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'columns'=>array(
#		'id',
		'name',
		'seats',
		'number',
		'bus_info',
array(
'class'=>'bootstrap.widgets.TbButtonColumn',
),
),
)); ?>

<?php $this->widget('bootstrap.widgets.TbButton', array('type'=>'','buttonType'=>'link','icon'=>'icon-plus-sign','url'=>Yii::app()->createUrl('buses/create'),'label'=>'Add Bus'));
