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
  

<center><b>Teller's Report</b></center>
<br>
<table class="tbl1">
<tr>
<td>Teller:<?echo $_GET['user_name2'];?><td>
</tr>
<tr>
<td>Date:<?echo str_replace("AND","-",$_GET['dateRange']);?></td>
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



<?//echo implode(",",$d);?>

	
    		<tr>
        	<td><?echo $d['ptype'];?></td>
        	<td><?echo $d['tcount'];?></td>
        	<td>P <?echo $d['tamt'];?></td>

    	</tr>
   
    	<tr>
      		<td><b>Total</td>
      		<td><b><?echo $_GET['totalcount'];?></td>
      		<td><b>P <?echo $_GET['total'];?></td>
    	</tr>

</table>

</body>
<script>
 function printMe(){

//  window.print();
//  window.close();
 // document.location.href='<?=Yii::app()->createUrl("/reports/tellersReport")?>';
}
</script>

