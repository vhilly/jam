<div class='span-12'>
<?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
  'id'=>'outbound-report',
  'method'=>'post',
  'type'=>'inline',
  'htmlOptions'=>array('class'=>''),
)); ?>

<?php echo $form->datePickerRow($rf, 'date_trip', array('prepend'=>'<i class="icon-calendar" style="cursor:pointer"></i>','class'=>'span2','options'=>array( 'format' => 'yyyy-mm-dd')));

if(count($result))
echo $form->dropDownListRow($rf,'trip',CHtml::listData(Schedules::model()->findAll(array('condition'=>"departure_date='$rf->date_trip'")),'id','id'));

$this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit', 'type'=>'primary', 'label'=>'Go'));

$this->endWidget(); ?>
</div>
<div class=clearfix></div>

<?php if(count($data)):?>

  <?php foreach($result as $rr=>$r):
    $tripInfo  = '<i>TRIP#</i>' . $r['trip_no'] .'&nbsp';
    $tripInfo .= '<i> Route:</i> ' . $r['route'] . '&nbsp';
    $tripInfo .= '<i> Bus#</i>' . $r['bus'] . '&nbsp';
    $tripInfo .= '<i> Driver:</i> ' . $r['driver'];
    $pcount=0; $trev=0;
    if($rr>0) break;
    ?>

    <?php $box = $this->beginWidget('bootstrap.widgets.TbBox', array(
      'title' => $tripInfo,
      'headerIcon' => 'icon-signal',
      'htmlOptions' => array('class'=>'bootstrap-widget-table well span')
    ));?>

    <table class=span5>
      <tr>
        <th>Passenger Type</th>
	<th>Passenger Count</th>
	<th>Total Revenue</th>
      <tr>
      <?php foreach($data as $d):
#	$user = User::model()->findByPk($d['created_by']);
#	$user = ucwords(strtolower($user->profile->firstname)) . '&nbsp' . ucwords(strtolower($user->profile->lastname));
	$pcount += $d['c'];
	$trev += $d['a'];
      ?>
        <tr>
          <td><?=$d['ptype']?></td>
          <td><center><?=$d['c']?></td>
          <td style="text-align:right"><span style="float:left">P</span><?=$d['a']?></td>
        </tr>

      <?php endforeach;?>
	<tr>
	  <th>Total </th>
	  <th><center><?=$pcount?></th>
	  <th style="text-align:right"><span style="float:left">P</span><?=number_format($trev,2)?></th>
	</tr>
  </table>
  <?php $this->endWidget();?>
    <?php endforeach;?>
<?php endif;?>

