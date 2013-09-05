<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'routes-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Fields with <span class="required">*</span> are required.</p>
<?php 
  $location = CHtml::listData(Location::model()->findAll(),'id','name');
?>
<?php echo $form->errorSummary($model); ?>
  
	<?php echo $form->textFieldRow($model,'line',array('class'=>'span2','maxlength'=>255)); ?>

	<?php echo $form->dropDownListRow($model,'origin',$location,array('class'=>'span2','empty'=>'')); ?>

	<?php echo $form->dropDownListRow($model,'destination',$location,array('class'=>'span2','empty'=>'')); ?>

	<?php echo $form->textFieldRow($model,'distance',array('class'=>'span2','maxlength'=>255)); ?>

	<?php echo $form->textFieldRow($model,'travel_time',array('class'=>'span2','maxlength'=>255)); ?>
	<?php echo $form->textAreaRow($model,'other_info',array('rows'=>6, 'cols'=>50, 'class'=>'span4')); ?>

	<?php echo $form->textFieldRow($model,'fare',array('class'=>'span1','maxlength'=>20)); ?>

	<?php echo $form->dropDownListRow($model,'active',array('Y'=>'Yes','N'=>'No'),array('class'=>'span1','maxlength'=>1)); ?>
<br>
	<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
                        'icon'=>' icon-plus-sign',
			'type'=>'',
			'label'=>$model->isNewRecord ? 'Add' : 'Save',
		)); ?>
        <?php $this->widget('bootstrap.widgets.TbButton', array(
                        'type'=>'',
                        'buttonType'=>'link',
                        'icon'=>'icon-remove-circle',
                        'url'=>Yii::app()->createUrl('routes/admin'),'label'=>'Cancel'));?>
<?php $this->endWidget(); ?>
