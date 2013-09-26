<style>
.tbl1{	
	font-family:"Ubuntu";
        font-size:20;  
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


<body onload="printTkt()">


<?php foreach($tktDetails as $t): ?>
<div style="border-top:1px dashed black;padding:5px;">
  <div class="tbl5" style="height:30px">
    <span style="padding-left:5px;"><b>JAM LINER</b></span>
    <img src="images/logo.jpg" width="30" height="30" style="float:left">
  </div>
  <div class="tbl3">
    Bus#: <?=isset($t['bus'])?$t['bus']:''?>
  </div>
  <div class="tbl3">
    Route: <?=$t['route']?>
  </div>
  <div class="tbl3" style="overflow:hidden;height:10px">
    Driver#: <?=isset($t['driver'])?$t['driver']:''?>
  </div>
  <div class="tbl3">
    Date: <?=isset($t['dop']) ? $t['dop']: date('Y-m-d')?>
  </div>
  <div class="tbl3">
    Departure: <?=isset($t['departure'])?$t['departure']:''?>
  </div>
  <div class="tbl3">
    <?php $teller=Yii::app()->user->getUserByName(Yii::app()->user->name);?>
    Teller: <?= $teller->profile->firstname.' '.$teller->profile->lastname?>
  </div>
  <div class="center tbl1">
    	<?=$amt = $t['amt'] ? 'P'.$t['amt'] : '&nbsp;'?>
  </div>
  <div class="center tbl1">
    <?=$t['tkt_type']?>
  </div>
  <div class="tbl3 center">
    <img src='<?=Yii::app()->createUrl('barcodeGenerator/generateBarcode',array('code'=>$t['tkt_no']))?>' >
  </div>
  <div class="center tbl3">KEEP TICKET FOR INSPECTION</div>
  <div class="center tbl3">Thank you ride again</div>
  <div class="center tbl3">Passenger's Copy</div>
</div>

<div style="border-top:1px dashed black;padding-top:10px">
  <div class="tbl2 center"><b>Inspector's Copy</b></div>
  <div class="tbl3 center">
    <img src='<?=Yii::app()->createUrl('barcodeGenerator/generateBarcode',array('code'=>$t['tkt_no']))?>' >
  </div>
  <div class="center tbl1">
    	<?=$amt = $t['amt'] ? 'P'.$t['amt'] : '&nbsp;'?>
  </div>
  <div class="tbl3">
    Bus#: <?=isset($t['bus'])?$t['bus']:''?>
  </div>
  <div class="tbl3">
    Route: <?=$t['route']?>
  </div>
  <div class="tbl3" style="overflow:hidden;height:10px">
    Driver#: <?=isset($t['driver'])?$t['driver']:''?>
  </div>
  <div class="tbl3">
    Date: <?=isset($t['dop']) ? $t['dop']: date('Y-m-d')?>
  </div>
  <div class="tbl3">
    Departure: <?=isset($t['departure'])?$t['departure']:''?>
  </div>
  <div class="tbl3">
    <?php $teller=Yii::app()->user->getUserByName(Yii::app()->user->name);?>
    Teller: <?= $teller->profile->firstname.' '.$teller->profile->lastname?>
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
