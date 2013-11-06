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
    $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit', 'type'=>'primary', 'label'=>'Go'));
    $this->endWidget();

   ?>
</div>

<?php $box = $this->beginWidget('bootstrap.widgets.TbBox', array(
    'title' => 'GRAND TOTAL',
    'headerIcon' => 'icon-book',
    'htmlOptions' => array('class'=>'bootstrap-widget-table well span')
  ));?>

  <table class="span5">
    <tr>
      <th><center>Passenger Count</th>
      <th style="text-align:right">Total Revenue</th>
    <tr>
      <td><center><?=$totalcount?></td>
      <td style="text-align:right"> P <?=$total?></td>
    </tr>
  </table>

<?php $this->endWidget();?>
