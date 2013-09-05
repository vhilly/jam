<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'buses-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Fields with <span class="required">*</span> are required.</p>

<?php echo $form->errorSummary($model); ?>

	<?php echo $form->textFieldRow($model,'name',array('class'=>'span5','maxlength'=>255)); ?>

	<?php echo $form->textFieldRow($model,'seats',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'number',array('class'=>'span5','maxlength'=>255)); ?>

	<?php echo $form->textAreaRow($model,'bus_info',array('rows'=>6, 'cols'=>50, 'class'=>'span8')); ?>


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
                        'url'=>Yii::app()->createUrl('buses/admin'),'label'=>'Cancel'));?>


<?php $this->endWidget(); ?>
