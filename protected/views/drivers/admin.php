
<h1>Drivers</h1>


<?php $this->widget('bootstrap.widgets.TbGridView',array(
'id'=>'drivers-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'columns'=>array(
		array('name'=>'name',
		      'value'=>'ucwords(strtolower($data->name))'),
		'contact_no',
array(
'class'=>'bootstrap.widgets.TbButtonColumn',
),
),
)); ?>
<?php $this->widget('bootstrap.widgets.TbButton', array('type'=>'','buttonType'=>'link','icon'=>'icon-plus-sign','url'=>Yii::app()->createUrl('drivers/create'),'label'=>'Add Driver'));
