<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'jammers-form',
	'enableAjaxValidation'=>false,
        'htmlOptions' => array('enctype' => 'multipart/form-data')
)); ?>

<p class="help-block">Fields with <span class="required">*</span> are required.</p>

<?php echo $form->errorSummary($model); ?>

	<?php echo $form->textFieldRow($model,'id_no',array('class'=>'span3','maxlength'=>25)); ?>
 
	<?php echo $form->textFieldRow($model,'first_name',array('class'=>'span3','maxlength'=>25)); ?>

	<?php echo $form->textFieldRow($model,'middle_name',array('class'=>'span3','maxlength'=>25)); ?>

	<?php echo $form->textFieldRow($model,'last_name',array('class'=>'span3','maxlength'=>25)); ?>

	<?php echo $form->textFieldRow($model,'extension_name',array('class'=>'span3','maxlength'=>25)); ?>

	<?php echo $form->textFieldRow($model,'email_address',array('class'=>'span3','maxlength'=>100)); ?>
 
	<?php echo $form->datePickerRow($model, 'birthdate', array('append'=>'<i class="icon-calendar" style="cursor:pointer"></i>','class'=>'span2','options'=>array( 'format' => 'yyyy-mm-dd')));?>

	<?php echo $form->datePickerRow($model, 'registered_date', array('append'=>'<i class="icon-calendar" style="cursor:pointer"></i>','class'=>'span2','options'=>array( 'format' => 'yyyy-mm-dd')));?>

	<?php echo $form->datePickerRow($model, 'issuance_date', array('append'=>'<i class="icon-calendar" style="cursor:pointer"></i>','class'=>'span2','options'=>array( 'format' => 'yyyy-mm-dd')));?>

	<?php echo $form->datePickerRow($model, 'validity_date', array('append'=>'<i class="icon-calendar" style="cursor:pointer"></i>','class'=>'span2','options'=>array( 'format' => 'yyyy-mm-dd')));?>

	<?php echo $form->labelEx($model,'id_picture'); ?> <?php echo $form->fileField($model,'id_picture'); ?>

<br>
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
                        'url'=>Yii::app()->createUrl('jammers/admin'),'label'=>'Cancel'));?>

<?php $this->endWidget(); ?>
