<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

	<!-- blueprint CSS framework -->
	
	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
	<?php Yii::app()->bootstrap->register(); ?>
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/style.css" />
</head>

<body>
<?php
  $this->widget('bootstrap.widgets.TbNavbar', array(
    'brand' => 'JAM',
    'type'=>'inverse',
    'items' => array(
      array(
        'class' => 'bootstrap.widgets.TbMenu',
	'items' => array(
	  array('label'=>'Route', 'url'=>array('routes/admin'), 'active'=>true),
	  array('label'=>'Bus Schedule', 'url'=>array('schedules/admin'), 'active'=>true),
	  array('label'=>'Passenger Types', 'url'=>array('passengerTypes/admin'), 'active'=>true),
	  array('label'=>'Buses', 'url'=>array('buses/admin'), 'active'=>true),
	  array('label'=>'Locations', 'url'=>array('location/admin'), 'active'=>true),
          array('icon'=>'','label'=>'Reports', 'url'=>'#', 'items'=>array(
            array('label'=>'Passenger Count', 'url'=>array('/reports/passengerCount')),
            array('label'=>'Average Passenger Count', 'url'=>array('/reports/averagePassengerCount')),
          )),

        )
     )
   )
 ));


?>
<div class="container-fluid" id="page">

        <?php echo $content; ?>

</div><!-- page -->

</body>
</html>
