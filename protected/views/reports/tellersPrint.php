<style>
.tbl1{
        font-family:"Ubuntu";
        font-size:10;
}
.tbl2{
        font-size:17;
}
.tbl3{
        font-size:8;
}
.tbl4{
        font-size:22;
}
.tbl5{
        font-size:20;
}
.tbl td{
        padding:0;
}
.center {
  text-align:center;
}
</style>






<body onload="printMe()">
 <div class="tbl5" style="height:30px">
    <span style="padding-left:5px;"><b>JAM LINER</b></span>
    <img src="images/logo.jpg" width="30" height="30" style="float:left">
  </div>
 

<div class="tbl1"><center><b><u>Teller's Report</u></b></center>
<br>
</div>
<table class="tbl1">
<tr>
<td>Teller: <?echo $_GET['user_name2'];?><td>
</tr>
<tr>
<td>Date: <?echo $_GET['dateRange'] ? str_replace("AND","-",$_GET['dateRange']) : "'".date("Y-m-d")."'";?></td>
</tr>
</table>

<br>

<table class="tbl3"> 
<tr>
	
	<td><b>Passenger Type</td>
	<td><b>Total Count</td>
	<td><b>Total Amount</td>
	
</tr>



<?$d=$_GET['result'];?>

<? //echo "<pre>";print_r($d);echo "</pre>";die();?>


    <? foreach($d as $r):?>
    <tr>
	<td><?=$r['ptype']?></td>
	<td><center><?=$r['tcount']?></td>
	<td align=right><span style="float:left">P</span> <?=number_format($r['tamt'],2)?></td>

    </tr>
    <? endforeach;?>
    	<tr>
      		<td><b>Total</td>
      		<td><center><b><?echo $_GET['totalcount'];?></td>
      		<td align=right><b><span style="float:left">P</span><?echo $_GET['total'];?></td>
    	</tr>

</table>

</body>
<script>
 function printMe(){

  window.print();
//  window.close();
  document.location.href='<?=Yii::app()->createUrl("/site/index")?>';
}
</script>

