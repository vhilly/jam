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
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/style3.css" />
</head>

<body>
	<div class="jamheader">
		<?php echo CHtml::image('images/banner-jam-header.jpg', 'JAM'); ?>
	</div>
<?php
  $this->widget('bootstrap.widgets.TbNavbar', array(
    'brand' => '',
    'type'=>'',
    'fixed'=>'',
    'items' => array(
      array(
        'class' => 'bootstrap.widgets.TbMenu',
        'items' => array(
          array('label'=>'Home', 'url'=>array('/site/index'), 'visible'=>!Yii::app()->user->isGuest,'active'=>false),
          array('label'=>'Trips', 'url'=>array('/schedules/admin'), 'visible'=>Yii::app()->user->checkAccess('Admin'),'active'=>false),
          array('label'=>'Purchase', 'url'=>array('/tickets/sell'), 'active'=>false, 'visible'=>Yii::app()->user->checkAccess('Teller')),
          array('label'=>'Tickets', 'url'=>array('/tickets/admin'), 'active'=>false, 'visible'=>Yii::app()->user->checkAccess('Teller')),
          array('label'=>'Routes', 'url'=>array('/routes/admin'), 'visible'=>Yii::app()->user->checkAccess('Admin'), 'active'=>false),
          array('label'=>'Passenger Types', 'url'=>array('/passengerTypes/admin'), 'visible'=>Yii::app()->user->checkAccess('Admin'), 'active'=>false),
          array('label'=>'Buses', 'url'=>array('/buses/admin'), 'visible'=>Yii::app()->user->checkAccess('Admin'), 'active'=>false),
          array('label'=>'Drivers', 'url'=>array('/drivers/admin'), 'visible'=>Yii::app()->user->checkAccess('Admin'), 'active'=>false),
          array('label'=>'Locations', 'url'=>array('/location/admin'), 'visible'=>Yii::app()->user->checkAccess('Admin'), 'active'=>false),
          array('label'=>'Bus Assignment', 'url'=>array('/tickets/busAssignment'), 'visible'=>Yii::app()->user->checkAccess('Conductor'),'active'=>false),
	  array('label'=>'Jammers', 'url'=>array('/jammers/admin'), 'visible'=>Yii::app()->user->checkAccess('Admin'), 'active'=>false),
          array('icon'=>'','label'=>'Reports', 'url'=>'#', 'items'=>array(
            array('label'=>'Passenger Count', 'url'=>array('/reports/passengerCount')),
            array('label'=>'Average Passenger Count', 'url'=>array('/reports/averagePassengerCount')),
	    array('label'=>'Tellers Report', 'url'=>array('/reports/tellersReport')),

          ), 'visible'=>Yii::app()->user->checkAccess('Admin')),
          array('label'=>'Login', 'url'=>array('/user/login'), 'active'=>false,'visible'=>Yii::app()->user->isGuest),
          array('label'=>'Register', 'url'=>array('/user/registration'), 'active'=>false,'visible'=>Yii::app()->user->isGuest),
          array('icon'=>'','label'=>Yii::app()->user->name, 'url'=>'#', 'items'=>array(
            array('label'=>'Rights', 'url'=>array('/rights'),'visible'=>Yii::app()->user->checkAccess('Admin'),),
            array('label'=>'User', 'url'=>array('/user/admin'),'visible'=>Yii::app()->user->checkAccess('Admin'),),
	    array('label'=>'Tellers Revenue', 'url'=>array('/reports/tellersRevenue'),'visible'=>Yii::app()->user->checkAccess('Teller'),),
            array('icon'=>'off','label'=>'Logout', 'url'=>array('/user/logout')),
          ),'visible'=>!Yii::app()->user->isGuest),

        )
     )
   )
 ));


?>

<div class="container-fluid" id="page">

  <center>
<?php
  $msgType='';
  if(Yii::app()->user->hasFlash("success"))
   $msgType='success';
  if(Yii::app()->user->hasFlash("error"))
   $msgType='error';
  if(Yii::app()->user->hasFlash("info"))
   $msgType='info';
  $this->widget('bootstrap.widgets.TbAlert', array(
    'block'=>true, // display a larger alert block?
    'fade'=>true, // use transitions?
    'closeText'=>'x', // close link text - if set to false, no close link is displayed
    'alerts'=>array( // configurations per alert type
            $msgType=>array('block'=>true, 'fade'=>true, 'closeText'=>'x'), // success, info, warning, error or danger
    ),
  ));
?>
  </center>
        <?php echo $content; ?>

</div><!-- page -->

</body>
</html>
