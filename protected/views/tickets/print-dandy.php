<style>

.tbl1{
	font-family:"Ubuntu";
        font-size:20;
        
}

.tbl2{
        font-size:10;
        
}

.tbl3{
        font-size:12;

}

.tbl4{
        font-size:22;

}


.tbl td{padding:0;
        
        }
</style>


<body onload="printTkt()">
<table class="tbl">


<?php foreach($tktDetails as $t): ?>
<tr>
  <td class="tbl4"><b>
	<center><img src="images/logo.jpg" width="30" height="30" /> JAM LINER </center>
  </b></td>
</tr>
	
	<tr><td class="tbl3"><?echo"Bus #: ".$t['bus']; ?></td></tr>
	<tr><td class="tbl3"><?echo"Route: ".$t['route']; ?></td></tr>	
	<tr><td class="tbl3"><?echo"Date:".date("Y/m/d"); ?></td></tr>
	<tr><td class="tbl3"><?echo"Teller:".Yii::app()->user->name; ?></td></tr>
	<tr><td class="tbl1"><center><?echo"".$t['amt']; ?></center></td></tr>
	<tr><td class="tbl1"><center><?echo $t['tkt_type']; ?></center></td></tr>      
	<tr><td><center><?echo $t['ptype']; ?></center></td></tr>
	<tr><td class="tbl3"><center><img src='<?=Yii::app()->createUrl('barcodeGenerator/generateBarcode',array('code'=>$t['tkt_no']))?>'></center></td></tr>
	<tr><td class="tbl2"><center>KEEP TICKET FOR INSPECTION</center></td></tr>
	<tr><td class="tbl2"><center>Thank you ride again</center></td></tr>
	<tr><td class="tbl3"><center>Passenger's Copy</center></td></tr>
    	<tr><td><br><br><br><br><br>------------------------------</td></tr>


<tr>
  <td class="tbl1">
        <center> JAM LINER </center>
  </td>
</tr>
	<tr><td class="tbl4"><center><b>Inspector's Copy</b></center></td></tr>
	<tr><td class="tbl3"><center><img src='<?=Yii::app()->createUrl('barcodeGenerator/generateBarcode',array('code'=>$t['tkt_no']))?>' height="40"></center></td></tr>
	<tr><td class="tbl3"><?echo"Bus #: ".$t['bus']; ?></td></tr>
        <tr><td class="tbl3"><?echo"Route: ".$t['route']; ?></td></tr>
        <tr><td class="tbl3"><?echo"Date:".date("Y/m/d"); ?></td></tr>
        <tr><td><br><br><br><br><br><br><br><br><br><br><br>------------------------------</td></tr>


<tr>
      
    </tr>
  
  <?php endforeach;?>
</table>

</body>
<script>
 function printTkt(){ 
 // window.print();

 // document.location.href='<?=Yii::app()->createUrl("site/index&tag=$tag")?>';
}
</script>
