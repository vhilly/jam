<div class="view">

		<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id),array('view','id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('line')); ?>:</b>
	<?php echo CHtml::encode($data->line); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('origin')); ?>:</b>
	<?php echo CHtml::encode($data->origin); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('destination')); ?>:</b>
	<?php echo CHtml::encode($data->destination); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('distance')); ?>:</b>
	<?php echo CHtml::encode($data->distance); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('travel_time')); ?>:</b>
	<?php echo CHtml::encode($data->travel_time); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('other_info')); ?>:</b>
	<?php echo CHtml::encode($data->other_info); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('fare')); ?>:</b>
	<?php echo CHtml::encode($data->fare); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('active')); ?>:</b>
	<?php echo CHtml::encode($data->active); ?>
	<br />

	*/ ?>

</div>