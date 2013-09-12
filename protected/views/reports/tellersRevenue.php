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
    echo '<b>' . $user->profile->firstname . '&nbsp' . $user->profile->lastname . '</b> ';

    $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit', 'type'=>'primary', 'label'=>'Go'));
    $this->endWidget();

   ?>

</div>

 
<?php $box = $this->beginWidget('bootstrap.widgets.TbBox', array(
    'title' => 'TELLER\'S REVENUE',
    'headerIcon' => 'icon-book',
    'htmlOptions' => array('class'=>'bootstrap-widget-table well span')
  ));?>

<?php if($result):?>
  <table class="span5">
    <tr>
      <th>Passenger Type</th>
      <th>Total Count</th>
      <th>Total Amount</th>
    </tr>

    <? foreach($result as $r):?>
    <tr>
	<td><?=$r['ptype']?>
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


<?php endif;?>
  <?php $this->endWidget();?>

