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
.tbl5{
        font-size:20;
}


.tbl td{padding:0;
        
        }
.center {
  text-align:center;
}
</style>


<body onload="printTkt()">


<?php foreach($tktDetails as $t): ?>
<div style="border-top:1px dashed black;padding:5px;">
  <div class="tbl5" style="height:30px">
    <span style="padding-left:5px;"><b>JAM LINER</b></span>
    <img src="images/logo.jpg" width="30" height="30" style="float:left">
  </div>
  <div class="tbl3">
    Bus#: <?=$t['bus']?>
  </div>
  <div class="tbl3">
    Route: <?=$t['route']?>
  </div>
  <div class="tbl3">
    Date: <?=date("Y/m/d")?>
  </div>
  <div class="tbl3">
    Teller: <?=Yii::app()->user->name?>
  </div>
  <div class="center tbl1">

    	<?$amt = $t['amt']=='0.00' ? $t['amt']:'&nbsp;';?>
	<?=$amt?>
  </div>
  <div class="center tbl1">
    <?=$t['tkt_type']?>
  </div>
  <div class="tbl3 center">
    <img src='<?=Yii::app()->createUrl('barcodeGenerator/generateBarcode',array('code'=>$t['tkt_no']))?>' >
  </div>
  <div class="center tbl2">KEEP TICKET FOR INSPECTION</div>
  <div class="center tbl2">Thank you ride again</div>
  <div class="center tbl3">Passenger's Copy</div>
</div>

<div style="border-top:1px dashed black;padding-top:10px">
  <div class="tbl5 center"><b>Inspector's Copy</b></div>
  <div class="tbl3 center">
    <img src='<?=Yii::app()->createUrl('barcodeGenerator/generateBarcode',array('code'=>$t['tkt_no']))?>' >
  </div>
  <div class="tbl3">
    Bus#: <?=$t['bus']?>
  </div>
  <div class="tbl3">
    Route: <?=$t['route']?>
  </div>
  <div class="tbl3">
    Date: <?=date("Y/m/d")?>
  </div>
</div>

  
  <?php endforeach;?>

</body>
<script>
 function printTkt(){ 
  window.print();

  document.location.href='<?=Yii::app()->createUrl("/tickets/sell&tag=$tag&total_amt=$total_amt")?>';
}
</script>
