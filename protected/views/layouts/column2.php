<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/main'); ?>
<div class="span-6 last">
	<div id="sidebar">
<?php
/*
  $this->widget('bootstrap.widgets.TbMenu', array(
    'type'=>'list',
    'items' => array(
      array('label'=>'List header', 'itemOptions'=>array('class'=>'nav-header')),
      array('label'=>'Home', 'url'=>'#', 'itemOptions'=>array('class'=>'active')),
      array('label'=>'Library', 'url'=>'#'),
      array('label'=>'Applications', 'url'=>'#'),
      array('label'=>'Another list header', 'itemOptions'=>array('class'=>'nav-header')),
      array('label'=>'Profile', 'url'=>'#'),
      array('label'=>'Settings', 'url'=>'#'),
      '',
      array('label'=>'Help', 'url'=>'#'),
    )
  ));
*/
?>

	</div><!-- sidebar -->
</div>
<div class="span-10">
	<div id="content">
		<?php echo $content; ?>
	</div><!-- content -->
</div>
<?php $this->endContent(); ?>
