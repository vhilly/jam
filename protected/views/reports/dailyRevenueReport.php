

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
	
    <?php echo $form->datePickerRow($rf, 'date_range',
      array('prepend'=>'<i class="icon-calendar"></i>',
        'options'=>array('format'=>'yyyy-mm-dd'),
	   ));
    //echo $form->dropDownListRow($rf,'driver',CHtml::listData(Drivers::model()->findAll(),'id','name'),array('empty'=>''));
    //echo $form->dropDownListRow($rf,'bus',CHtml::listData(Buses::model()->findAll(),'id','name'),array('empty'=>''));
    //echo $form->dropDownListRow($rf,'route',CHtml::listData(Routes::model()->findAll(),'id','line'),array('empty'=>''));
    $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit', 'type'=>'primary', 'label'=>'Go'));
    $this->endWidget();
    ?>
</div>

<?php if(count($result)):?>

<table width="3000" border="1">
<tr>
		<td width="382" height="24">08/05/2013</td>
	<td width="500"></td>
	  <td width="500"></td>
<td width="500"></td>
<td width="500"></td>
<td width="500"></td>
<td width="500"></td>
	<td width="1000"><center>DAILY REVENUE REPORT</center></td>
	<td width="500"> </td>
	<td width="500">Page 1</td>
  </tr>
	<tr>
	
		<td>7:01am</td>
		<td></td>
		<td><center><?php echo $date; ?></center></td>
                <td>.</td>
		<td></td>
	</tr>

</table>

<div>

<table width="" border="1" class="tbl">
	<tr>
		<td>CONTROL Number</td>
                <td>OR No.</td>
                <td>BUS NUMB.</td>
                <td>TRIP DATE</td>
                <td>NO. of TRIPS</td>
                <td>KM. RUN</td>
                <td>DRIVER</td>
                <td>CONDUCTOR</td>
                <td>GROSS INCOME</td>
                <td>DEPOSIT</td>
                <td>DRIVER COMM</td>
                <td>CONDUCT. COMM</td>
                <td>TOLL FEE</td>
                <td>WASH & PARKING</td>
                <td>MISC & OTH EXP</td>
                <td>DIESEL</td>
                <td>PARTS AND LUBS</td>
                <td>POLICE</td>
                <td>REPAIR & MAINT</td>
                <td>SHARE COMM.</td>
                <td>VALE</td>
                <td>OTHERPAY</td>
                <td>CHARGES Driver</td>
                <td>Cond.</td>
		<td>BOARDING Tickets</td>
                <td>FERRY Tickets</td>
                <td>Special</td>
                <td>NET REVENUE</td>
                <td>WIFI</td>
	</tr>
</table>
</div>

<div>
CUBAO BRANCH
<table width="" border="1" class="tbl">

<?php foreach($result as $r): ?>
 <tr>
		<td>CONTROL Number</td>
		<td>0.00</td>
                <td><?//=$r['bus'] ?></td>
                <td>7/24</td>
                <td>1.0</td>
                <td>NO. of TRIPS</td>
                <td>KM. RUN</td>
                <td><?=$r['driver'] ?></td>
                <td>CONDUCTOR</td>
                <td><?=$r['amt'] ?></td>
                <td>DEPOSIT</td>
                <td>DRIVER COMM</td>
                <td>CONaDUCT. COMM</td>
                <td>TOLL FEE</td>
                <td>WASH & PARKING</td>
                <td>MISC & OTH EXP</td>
                <td>DIESEL</td>
                <td>PARTS AND LUBS</td>
                <td>POLICE</td>
                <td>REPAIR & MAINT</td>
                <td>SHARE COMM.</td>
                <td>VALE</td>
                <td>OTHERPAY</td>
                <td>CHARGES Driver</td>
                <td>Cond.</td>
                <td>BOARDING Tickets</td>
                <td>FERRY Tickets</td>
                <td>Special</td>
                <td>NET REVENUE</td>

        </tr>

 

<?php endforeach; ?>



</div>

<?php endif ?>

