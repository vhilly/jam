    <?php $this->beginWidget('bootstrap.widgets.TbHeroUnit', array(
      'heading'=>'',
    )); ?>
<center>
<?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
  'id'=>'searchForm',
  'type'=>'search',
  'htmlOptions'=>array('class'=>'well'),
)); ?>

ENTER TICKET NO.<br>
<?php
  echo $form->textFieldRow($model, 'tkt_no',
  array('style'=>'height:45px;font-size:32px','class'=>'input-large tkt_input','id'=>'tkt_no','readonly'=>$list ? 'true':false));
?>

<?php
  if($list){
    echo $form->dropDownList($model,'schedule_id',CHtml::listData($list,'id','bus.name'),array('style'=>'height:50px;font-size:32px'));
    echo "<br><br>";
    $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit','type'=>'success', 'htmlOptions'=>array('name'=>'submit','class'=>'btn-large'), 'label'=>'Submit'));
  }else{
    echo "<br><br>";
    $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit','type'=>'success', 'label'=>'Submit','htmlOptions'=>array('class'=>'btn-large')));

  }
?>
<?php
?>
<?php $this->endWidget(); ?>
</center>
<?php $this->endWidget(); ?>
<script>
  $('#tkt_no').focus();
</script>
