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
    echo 'Teller : '; # . Yii::app()->user->name;
    $user = User::model()->findByPk(Yii::app()->user->id);
    echo '<b>' . ucwords(strtolower($user->profile->firstname)) . '&nbsp' . ucwords(strtolower($user->profile->lastname)) . '</b> ';

    $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit', 'type'=>'primary', 'label'=>'Go'));
    $this->endWidget();

   ?>

</div>

 
<?php $box = $this->beginWidget('bootstrap.widgets.TbBox', array(
    'title' => 'TELLER\'S REVENUE',
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
    <?php $list = array();?>
    <?php foreach($result as $r):?>
    <?php $list[] = $r?>
    <tr>
	<td><?=$r['ptype']?>
        <td><center><?=$r['tcount']?></td>
        <td style="text-align:right"><span style="float:left">P </span> <?=number_format($r['tamt'],2)?></td>
    </tr>
    <?php endforeach;?>
    <tr>

      <td>Total</td>
      <td><center><?=$totalcount?></td>
      <td style="text-align:right"><span style="float:left">P </span> <?=$total?></td>
    </tr>


  </table>

<?php $user= User::model()->findByPk(Yii::app()->user->id);?>
<?php $userFname=ucwords(strtolower($user->profile->firstname)) . '&nbsp' . ucwords(strtolower($user->profile->lastname));?>


<?php $this->widget('bootstrap.widgets.TbButton', array('label'=>'Print','type'=>'info','buttonType'=>'button','url'=>Yii::app()->createUrl('/reports/tellersPrint',array('success'=>true)),'icon'=>'icon-print','htmlOptions'=>array('name'=>'print','class'=>'','width'=>'' ,
      'onclick'=>'window.open("'.Yii::app()->createUrl('reports/tellersPrint',array('result'=>$list,
                                'totalcount'=>$totalcount,
                                'total'=>$total,
                                'totalcount'=>$totalcount,
                                'user_name'=>$userFname,
                                'dateRange'=>$rf['date_range'],
                                'print'=>1)).'");this.submit();')))
    ?>




<?php endif;?>
  <?php $this->endWidget();?>

