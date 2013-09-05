<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

		<?php echo $form->textFieldRow($model,'id',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'first_name',array('class'=>'span5','maxlength'=>25)); ?>

		<?php echo $form->textFieldRow($model,'last_name',array('class'=>'span5','maxlength'=>25)); ?>

		<?php echo $form->textFieldRow($model,'birthdate',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'registered_date',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'validity_date',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'id_picture',array('class'=>'span5')); ?>

	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType' => 'submit',
			'type'=>'primary',
			'label'=>'Search',
		)); ?>
	</div>

<?php $this->endWidget(); ?>
