<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'schedules-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Fields with <span class="required">*</span> are required.</p>

<?php echo $form->errorSummary($model); ?>

	<?php echo $form->dropDownListRow($model,'bus_id',CHtml::listData(Buses::model()->findAll(),'id','name'),array('class'=>'span2','empty'=>'')); ?>

	<?php echo $form->dropDownListRow($model,'driver_id',CHtml::listData(Drivers::model()->findAll(),'id','name'),array('class'=>'span2','empty'=>'')); ?>

	<?php echo $form->dropDownListRow($model,'route_id',CHtml::listData(Routes::model()->findAll(),'id','line'),array('class'=>'span2','empty'=>'')); ?>

        <?php echo $form->datePickerRow($model, 'departure_date', array('append'=>'<i class="icon-calendar" style="cursor:pointer"></i>','class'=>'span2','options'=>array( 'format' => 'yyyy-mm-dd')));?>

        <?php echo $form->timepickerRow($model, 'departure_time', array('append'=>'<i class="icon-time" style="cursor:pointer"></i>','class'=>'span2','options'=>array('template'=>'modal','defaultTime'=>'01:00','minuteStep'=>1,'showMeridian'=>true)));?>

        <?php echo $form->timepickerRow($model, 'arrival_time', array('append'=>'<i class="icon-time" style="cursor:pointer"></i>','class'=>'span2','options'=>array('template'=>'modal','defaultTime'=>'01:00','minuteStep'=>1,'showMeridian'=>true)));?>


<br>
	<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'icon'=>'icon-plus-sign',
			'type'=>'',
			'label'=>$model->isNewRecord ? 'Add' : 'Save',
		)); ?>

	<?php $this->widget('bootstrap.widgets.TbButton', array(
                        'type'=>'',
                        'buttonType'=>'link',
                        'icon'=>'icon-remove-circle',
                        'url'=>Yii::app()->createUrl('schedules/admin'),'label'=>'Cancel'));?>


<?php $this->endWidget(); ?>
