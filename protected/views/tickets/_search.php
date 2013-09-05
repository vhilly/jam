<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

		<?php echo $form->textFieldRow($model,'id',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'tkt_no',array('class'=>'span5','maxlength'=>32)); ?>

		<?php echo $form->textFieldRow($model,'schedule_id',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'seat_id',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'bus_id',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'route_id',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'passenger_type_id',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'ticket_type_id',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'amt',array('class'=>'span5','maxlength'=>20)); ?>

		<?php echo $form->textFieldRow($model,'status',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'created_at',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'created_by',array('class'=>'span5','maxlength'=>255)); ?>

	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType' => 'submit',
			'type'=>'primary',
			'label'=>'Search',
		)); ?>
	</div>

<?php $this->endWidget(); ?>
