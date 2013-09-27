<style>

.tbl{
        font-size:10px;
        line-height:9px;
}


.tbl td{padding:0.2;
        height:2;
        }
</style>

<div class='span-12'>
    <?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
        'id'=>'outbound-report',
        'method'=>'post',
        'type'=>'inline',
        'htmlOptions'=>array('class'=>''),
     )); ?>
	
    <?php echo $form->dateRangeRow($rf, 'date_range',
      array(
        'placement'=>'left',
        'options' => array('callback'=>'js:function(start, end){$("#ReportForm_date_range").val("\'"+ start.toString("yyyy-M-d")+"\' AND \'"+ end.toString("yyyy-M-d")+"\'") ;}')
      ));

    echo $form->dropDownListRow($rf,'user_name',CHtml::listData(User::model()->findAll(),'id','username'),array('empty'=>''));
    $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit', 'type'=>'primary', 'label'=>'Go'));
    $this->endWidget();
 
   ?>
</div>
<br>
<br>
<div>

<br>
  <?php $box = $this->beginWidget('bootstrap.widgets.TbBox', array(
    'title' => 'TELLER\'S REPORT',
    'headerIcon' => 'icon-book',
    'htmlOptions' => array('class'=>'bootstrap-widget-table well span')
  ));?>

<?php if(count($result)):?>
  <table class="span5">
    <tr>
      <th>Passenger Type</th>
      <th>Total Count</th>
      <th>Total Amount</th>
    </tr>

    <? foreach($result as $r):?>
    <tr>
	<td><?=$r['ptype']?></td>
	<td><?=$r['tcount']?></td>
	<td>P <?=number_format($r['tamt'],2)?></td>

    </tr>
    <? endforeach;?>
    <tr>
      <td>Total</td>
      <td><?=$totalcount?></td>
      <td>P <?=$total?></td>
    </tr>
  </table>
 
<? $user= User::model()->findByPk($user_name);?>
<? $userFname=ucwords(strtolower($user->profile->firstname)) . '&nbsp' . ucwords(strtolower($user->profile->lastname));?>



<?php $this->widget('bootstrap.widgets.TbButton', array('label'=>'Print','type'=>'info','buttonType'=>'button','url'=>Yii::app()->createUrl('/reports/tellersPrint',array('success'=>true)),'icon'=>'icon-print','htmlOptions'=>array('name'=>'print','class'=>'','width'=>'' ,
      'onclick'=>'window.open("'.Yii::app()->createUrl('reports/tellersPrint',array('result'=>$r,
				'totalcount'=>$totalcount,
				'total'=>$total,
				'totalcount'=>$totalcount,
                                'user_name2'=>$userFname,
				'dateRange'=>$rf['date_range'],
				'print'=>1)).'");this.submit();')))
    ?>
<?php endif;?>
  <?php $this->endWidget();?>

<table>
	<tr>
		<td><??></td>
	</tr>


</div>
