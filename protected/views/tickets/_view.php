<div class="view">

		<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id),array('view','id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tkt_no')); ?>:</b>
	<?php echo CHtml::encode($data->tkt_no); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('schedule_id')); ?>:</b>
	<?php echo CHtml::encode($data->schedule_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('seat_id')); ?>:</b>
	<?php echo CHtml::encode($data->seat_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('bus_id')); ?>:</b>
	<?php echo CHtml::encode($data->bus_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('route_id')); ?>:</b>
	<?php echo CHtml::encode($data->route_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('passenger_type_id')); ?>:</b>
	<?php echo CHtml::encode($data->passenger_type_id); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('ticket_type_id')); ?>:</b>
	<?php echo CHtml::encode($data->ticket_type_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('amt')); ?>:</b>
	<?php echo CHtml::encode($data->amt); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('status')); ?>:</b>
	<?php echo CHtml::encode($data->status); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('created_at')); ?>:</b>
	<?php echo CHtml::encode($data->created_at); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('created_by')); ?>:</b>
	<?php echo CHtml::encode($data->created_by); ?>
	<br />

	*/ ?>

</div>