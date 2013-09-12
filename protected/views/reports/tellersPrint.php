<body onload="printMe()">



Tellers Report
<br>
Teller:
<br>
Data:no 
<?php

?>

</body>
<script>
 function printMe(){

  window.print();
//  window.close();
 // document.location.href='<?=Yii::app()->createUrl("/reports/tellersReport")?>';
}
</script>

