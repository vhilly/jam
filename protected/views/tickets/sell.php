    <?php $this->beginWidget('bootstrap.widgets.TbHeroUnit', array(
      'heading'=>'',
    )); ?>
    
      <center>
    <?php if(count($schedules)):?>
      <?php foreach($schedules as $key=>$s):?>
        <?php $seatsLft = isset($bookedTkts[$s->id]) ? $s->bus->seats - $bookedTkts[$s->id] : $s->bus->seats ?>
        <a id="<?=$s->id?>" class="buy buyBig btn <?=$seatsLft > 0 ? 'btn-success' : 'btn-danger'?> btn-large">
          <?=$s->route->line?> ETD : <?=date('g:i A',strtotime($s->departure_time))?> <br><br>TRIP#<?=$s->id?> BUS# <?=$s->bus->number?>
        </a>
        <div class=clearfix></div>
        <?=$seatsLft > 0 ? $seatsLft.' SEATS LEFT' : 'STANDING'?> 
        <a id="close_<?=$s->id?>" class="closeSched btn btn-danger btn-default btn-mini"><i class="icon-remove-sign"></i>CLOSE TRIP</a>
        <div class=clearfix></div>
        <input id="sc_<?=$s->id?>" type=text value=1 class=span1> 
        <?php echo CHtml::dropDownList('passengerType','',CHtml::listData(PassengerTypes::model()->findAll(),'id','name'),array('id'=>"pt_$s->id",'class'=>'span2'));?><br>
        JAMMERS ID#<input id="jc_<?=$s->id?>" type=text  class='jammers span2'> 
        <a id="cl_<?=$s->id?>" class="clear btn btn-default btn-mini">CLEAR</a>
	<input id="si_<?=$s->id?>" type=hidden value=<?=$s->id?>> 
        <input id="bi_<?=$s->id?>" type=hidden value=<?=$s->bus_id?>> 
        <input id="ri_<?=$s->id?>" type=hidden value=<?=$s->route_id?> > 
        <input id="tl_<?=$s->id?>" type=hidden value=<?=$seatsLft?> class=span1> 
        <input id="tt_<?=$s->id?>" type=hidden value=<?=$seatsLft > 0 ? 1:2?> class=span1> 
        <div class=clearfix></div>
        <br>
      <?php endforeach;?>
    <?php endif;?>
        <a id="advance" class="buy buyBig btn  btn-info btn-large">
         ADVANCE TICKET
        </a>
        <div class=clearfix></div>
        <br>
        <input id="sc_advance" type=text value=1 class=span1> 
        <?php echo CHtml::dropDownList('passengerType','',CHtml::listData(PassengerTypes::model()->findAll(),'id','name'),array('id'=>'pt_advance','class'=>'span2'));?>
        <?php echo CHtml::dropDownList('rID','',CHtml::listData(Routes::model()->findAll(),'id','line'),array('id'=>'ri_advance','class'=>'span2'));?>
        <br>
        JAMMERS ID#<input id="jc_advance" type=text  class='jammers span2'> 
        <a id="cl_advance" class="clear btn btn-default btn-mini">CLEAR</a>
        <input id="tt_advance" type=hidden value='3' class=span1> 
        <div class=clearfix></div>
        <br>
      </center>
    <?php $this->endWidget(); ?>

    <script>
     $('.jammers').change(function(){
        var id = this.id;
        var sc = '#sc'+id.replace('jc','');
        $(sc).val(1);
        $(sc).prop('disabled',true);
     });
     $('.clear').click(function(){
        var id = this.id;
        var sc = '#sc'+id.replace('cl','');
        var jc = '#jc'+id.replace('cl','');
        $(sc).prop('disabled',false);
        $(jc).val('');
     });
     $('.closeSched').click(function(){
        var id = this.id;
        var tid = id.replace('close_','');
	var conf=confirm("Are you sure,you want to close this trip?")
	if(conf==true){
       document.location.href='<?=Yii::app()->createUrl('schedules/close')?>&id='+tid
	}

     });
     $('.buy').click(function(){
        var sc = '#sc_'+this.id;
        var tl = '#tl_'+this.id;
        var bi = '#bi_'+this.id;
        var ri = '#ri_'+this.id;
        var si = '#si_'+this.id;
        var pt = '#pt_'+this.id;
        var tt = '#tt_'+this.id;
        var jc = '#jc_'+this.id;
        if($(tt).val() =='1'){
          if(Number($(sc).val()) >  Number($(tl).val())){
            alert($(tl).val()+' Seat/s left');
          }else{
            buyTicket($(bi).val(),$(ri).val(),$(si).val(),$(sc).val(),$(pt).val(),$(tt).val(),$(jc).val(),this.id);
           // document.location.href='<?=Yii::app()->createUrl('tickets/buy')?>&Tickets[bus_id]='+$(bi).val()+'&Tickets[route_id]='+$(ri).val()+'&Tickets[schedule_id]='+$(si).val()+'&pcs='+$(sc).val()+'&Tickets[passenger_type_id]='+$(pt).val()+'&Tickets[ticket_type_id]='+$(tt).val()+'&tag='+this.id;
          }
        }
        if($(tt).val() =='2'){
            buyTicket($(bi).val(),$(ri).val(),$(si).val(),$(sc).val(),$(pt).val(),$(tt).val(),$(jc).val(),this.id);
        }
        if($(tt).val() =='3'){
            buyTicket('',$(ri).val(),'',$(sc).val(),$(pt).val(),$(tt).val(),$(jc).val(),this.id);
        }
     });
     function buyTicket(bi,ri,si,sc,pt,tt,jc,id){
            document.location.href='<?=Yii::app()->createUrl('tickets/buy')?>&Tickets[bus_id]='+bi+'&Tickets[route_id]='+ri+'&Tickets[schedule_id]='+si+'&pcs='+sc+'&Tickets[passenger_type_id]='
            +pt+'&Tickets[ticket_type_id]='+tt+'&Tickets[jammers_id]='+jc+'&tag='+id;
     }
     function scrollToAnchor(id){
       var tag = $("#"+ id);
       $('html,body').animate({scrollTop: tag.offset().top},'slow');
     }

     scrollToAnchor(<?=$tag?>);
   </script>
