 <?php $box = $this->beginWidget('bootstrap.widgets.TbBox', array(
    'title' => 'TELLER\'S REVENUE',
    'headerIcon' => 'icon-book',
    'htmlOptions' => array('class'=>'bootstrap-widget-table well span')
  ));?>

<?php if($result):?>
  <table class="span5">
    <tr>
      <th>User</th>
      <th>Total Count</th>
      <th>Total Ammount</th>
    </tr>

    <? foreach($result as $r):?>
    <tr>
	<td><?=Yii::app()->user->name;?>
        <td><?=$r['count']?></td>
        <td>P <?=$r['amt']?></td>
    </tr>
    <? endforeach;?>
  </table>



<?php endif;?>
  <?php $this->endWidget();?>

