<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'passenger-types-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Fields with <span class="required">*</span> are required.</p>

<?php echo $form->errorSummary($model); ?>

	<?php echo $form->textFieldRow($model,'name',array('class'=>'span2','maxlength'=>255)); ?>

	<?php echo $form->textFieldRow($model,'discount',array('class'=>'span1')); ?>%

	<?php echo $form->dropDownListRow($model,'active',array('Y'=>'Yes','N'=>'No'),array('class'=>'span1','maxlength'=>1)); ?>

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
                        'url'=>Yii::app()->createUrl('passengerTypes/admin'),'label'=>'Cancel'));?>



<?php $this->endWidget(); ?>
