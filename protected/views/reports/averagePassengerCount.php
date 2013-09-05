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
    echo $form->dropDownListRow($rf,'driver',CHtml::listData(Drivers::model()->findAll(),'id','name'),array('empty'=>''));
    echo $form->dropDownListRow($rf,'bus',CHtml::listData(Buses::model()->findAll(),'id','name'),array('empty'=>''));
    echo $form->dropDownListRow($rf,'route',CHtml::listData(Routes::model()->findAll(),'id','line'),array('empty'=>''));
    $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit', 'type'=>'primary', 'label'=>'Go'));
    $this->endWidget();
    ?>
</div>
<?php if(count($result)):?>
  <?php $box = $this->beginWidget('bootstrap.widgets.TbBox', array(
    'title' => 'AVERAGE PASSENGER COUNT',
    'headerIcon' => 'icon-signal',
    'htmlOptions' => array('class'=>'bootstrap-widget-table well span')
  ));?>
  <table class=span5>
    <tr>
      <th>DAY OF WEEK</th>
      <th>AVERAGE NO. OF PASSENGERS</th>
    </tr>
  <?php foreach($result as $r):?>
    <tr>
      <td><?=$r['day_of_week']?></td>
      <td><?=number_format($r['avg_pass'],2)?></td>
    </tr>
    
  <?php endforeach;?>
  </table>
  <?php $this->endWidget();?>

<?php $box = $this->beginWidget('bootstrap.widgets.TbBox', array(
    'title' => ' GRAPH',
    'headerIcon' => 'icon-signal',
    'htmlOptions' => array('class'=>'bootstrap-widget-table well span')
  ));?>

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">

      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
                ['Day','Average'],
                 <?php foreach($result as $r):?>
                ['<?=$r['day_of_week']?>',<?=$r['avg_pass']?>],

                 <?php endforeach;?>
                ]);

        var options = {
          title: ''
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>

    <div id="chart_div" style="width: 900px; height: 500px;"></div>

 <?php $this->endWidget();?>

 <?php else:?>
  <div class=clearfix></div>
  <i class=span>No Result Found</i>
 <?php endif;?>
