<?php
  class ReportForm extends CFormModel{
    public $date_range;
    public $date_trip;
    public $trip;
    public $bus;
    public $route;
    public $driver;
    public $user_name;
    public function rules(){
       return array( 
         array('date_trip,date_range,user_name','length','max'=>255),
	 array('trip,bus,route,driver', 'numerical', 'integerOnly'=>true),
       );
    }
    public function attributeLabels(){
      return array(
        'date_range' => 'Date Range',
	'user_name'=>'Teller',
	'date_trip'=>'Date of Trip',
	'trip'=> 'Trip No.'
      );
    }
  }
?>
