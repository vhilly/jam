<h1>Jammers</h1>

<?php $this->widget('bootstrap.widgets.TbGridView',array(
'id'=>'jammers-grid',
'dataProvider'=>$model->search(),
'afterAjaxUpdate'=>"function() {
  jQuery('#Jammers_birthdate').datepicker({'format':'yyyy-mm-dd','language':'en','weekStart':0});
}",
'filter'=>$model,
'columns'=>array(
		'id_no',
		array('name'=>'first_name',
		      'value'=>'ucwords(strtolower($data->first_name))'),

		'middle_name',

		array('name'=>'last_name',
		      'value'=>'ucwords(strtolower($data->last_name))'),

		'extension_name',

		'email_address',

		array(
                  'name'=>'birthdate',
                        'filter'=>$this->widget('bootstrap.widgets.TbDatePicker', array(
                          'model'=>$model,
                          'options'=>array('format'=>'yyyy-mm-dd'),
                          'htmlOptions' => array(
                            'id' => 'Jammers_birthdate'
                          ),
                         'attribute'=>'birthdate'),
                        true),
                        'sortable'=>true,
                ),

		array(
                  'name'=>'registered_date',
                        'filter'=>$this->widget('bootstrap.widgets.TbDatePicker', array(
                          'model'=>$model,
                          'options'=>array('format'=>'yyyy-mm-dd'),
                          'htmlOptions' => array(
                            'id' => 'Jammers_registered_date'
                          ),
                         'attribute'=>'registered_date'),
                        true),
                        'sortable'=>true,
                ),

		array(
                  'name'=>'issuance_date',
                        'filter'=>$this->widget('bootstrap.widgets.TbDatePicker', array(
                          'model'=>$model,
                          'options'=>array('format'=>'yyyy-mm-dd'),
                          'htmlOptions' => array(
                            'id' => 'Jammers_issuance_date'
                          ),
                         'attribute'=>'issuance_date'),
                        true),
                        'sortable'=>true,
                ),
		
		array(
                  'name'=>'validity_date',
                        'filter'=>$this->widget('bootstrap.widgets.TbDatePicker', array(
                          'model'=>$model,
                          'options'=>array('format'=>'yyyy-mm-dd'),
                          'htmlOptions' => array(
                            'id' => 'Jammers_validity_date'
                          ),
                         'attribute'=>'validity_date'),
                        true),
                        'sortable'=>true,
                ),

		/*
		'id_picture',
		*/
array(
'class'=>'bootstrap.widgets.TbButtonColumn',
),
),
)); ?>
<?php $this->widget('bootstrap.widgets.TbButton', array('type'=>'','buttonType'=>'link','icon'=>'icon-plus-sign','url'=>Yii::app()->createUrl('jammers/create'),'label'=>'Add Jammer'));
