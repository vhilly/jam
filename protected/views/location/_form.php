<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'location-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Fields with <span class="required">*</span> are required.</p>

<?php echo $form->errorSummary($model); ?>

	<?php echo $form->textFieldRow($model,'name',array('class'=>'span2','maxlength'=>255)); ?>

	<?php echo $form->dropDownListRow($model,'active',array('Y'=>'Yes','N'=>'No'),array('class'=>'span1','maxlength'=>1)); ?>

<br>
	<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'',
			'label'=>$model->isNewRecord ? 'Add' : 'Save',
			'icon'=>'icon-plus-sign',
		)); ?>
	<?php $this->widget('bootstrap.widgets.TbButton', array(
                        'type'=>'',
                        'buttonType'=>'link',
                        'icon'=>'icon-remove-circle',
                        'url'=>Yii::app()->createUrl('location/admin'),'label'=>'Cancel'));?>


<?php $this->endWidget(); ?>
