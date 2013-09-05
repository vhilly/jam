<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

		<?php echo $form->textFieldRow($model,'id',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'name',array('class'=>'span5','maxlength'=>255)); ?>

		<?php echo $form->textFieldRow($model,'seats',array('class'=>'span5')); ?>

		<?php echo $form->textFieldRow($model,'number',array('class'=>'span5','maxlength'=>255)); ?>

		<?php echo $form->textAreaRow($model,'bus_info',array('rows'=>6, 'cols'=>50, 'class'=>'span8')); ?>

		<?php echo $form->textFieldRow($model,'driver',array('class'=>'span5','maxlength'=>255)); ?>

		<?php echo $form->textFieldRow($model,'driver_phone',array('class'=>'span5','maxlength'=>255)); ?>

	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType' => 'submit',
			'type'=>'primary',
			'label'=>'Search',
		)); ?>
	</div>

<?php $this->endWidget(); ?>
