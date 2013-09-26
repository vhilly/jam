<?php

class ReportsController extends Controller
{
public $layout='//layouts/main';
/**
* @return array action filters
*/
public function filters()
{
  return array(
    'rights', // used the rights module
    //'accessControl', // perform access control for CRUD operations
  );
}

/*
public function filters()
{
return array(
'accessControl', // perform access control for CRUD operations
);
}

public function accessRules()
{
return array(
array('allow',  // allow all users to perform 'index' and 'view' actions
'actions'=>array('passengerCount','averagePassengerCount','view'),
'users'=>array('*'),
),
array('allow', // allow authenticated user to perform 'create' and 'update' actions
'actions'=>array('tripOperationReport','dailyRevenueReport','tellersReport','tellersRevenue'),
'users'=>array('@'),
),
array('allow', // allow admin user to perform 'admin' and 'delete' actions
'actions'=>array(''),
'users'=>array('admin'),
),
array('deny',  // deny all users
'users'=>array('*'),
),
);
}
*/
  public function actionPassengerCount(){
    $rf = new ReportForm;
    $result=array();
    if(isset($_POST['ReportForm'])){
      $rf->attributes=$_POST['ReportForm'];
    $date = $rf->date_range ? $rf->date_range : "'".date('Y-m-d')."' AND '".date('Y-m-d')."'";
    $sql ="SELECT s.departure_date departure,COUNT(*) cnt,SUM(amt) amt FROM tickets as t,schedules as s WHERE t.schedule_id = s.id AND s.departure_date BETWEEN {$date} ";
    if($rf->bus)
      $sql .= " AND s.bus_id='$rf->bus' ";
    if($rf->route)
      $sql .= " AND s.route_id='$rf->route' ";
    if($rf->driver)
      $sql .= " AND s.driver_id='$rf->driver' ";
    $sql .= "GROUP BY s.departure_date";
    $result = Yii::app()->db->createCommand($sql)->queryAll();
    }
    $this->render('passengerCount',array('rf'=>$rf,'result'=>$result));
  }
  
  public function actionAveragePassengerCount(){
    $rf = new ReportForm;
    $result=array();
    if(isset($_POST['ReportForm'])){
      $rf->attributes=$_POST['ReportForm'];
    }
    $date = $rf->date_range ? $rf->date_range : NULL;
    $sql =" SELECT   day_of_week,   
             AVG(passenger) as avg_pass
             FROM  
                 (  
                      SELECT  
                      DAYNAME(s.departure_date) as day_of_week,  
                      DAYOFWEEK(s.departure_date) as day_num,  
                      TO_DAYS(s.departure_date) as date,  
                      COUNT(t.id) as passenger                     
                      FROM  tickets as t,schedules as s WHERE t.schedule_id = s.id ";
    if($date)
      $sql .= " AND s.departure_date BETWEEN $date";
    if($rf->bus)
      $sql .= " AND s.bus_id='$rf->bus' ";
    if($rf->route)
      $sql .= " AND s.route_id='$rf->route' ";
    if($rf->driver)
      $sql .= " AND s.driver_id='$rf->driver' ";
    $sql .="
                      GROUP BY date  
                  ) temp  
        GROUP BY day_of_week  
        ORDER BY day_num  ";
    $result = Yii::app()->db->createCommand($sql)->queryAll();
    $this->render('averagePassengerCount',array('result'=>$result,'rf'=>$rf));
  }

public function actionTripOperationReport(){



	$this->render('tripOperationReport');

}


public function actionTellersReport(){


$rf = new ReportForm;
    $result=array();
    if(isset($_POST['ReportForm'])){
      $rf->attributes=$_POST['ReportForm'];
    }
    $date = $rf->date_range ? $rf->date_range : NULL;
    $user_name=$rf->user_name;
   
        $sql="SELECT SUM(amt) AS amt,COUNT(*) AS count FROM tickets WHERE status = 1 AND created_by= '".$user_name."'";
	if($date)
          $sql .= " AND DATE(created_at) BETWEEN $date";
	

//die($sql);
//    $sql =" SELECT s.id as id, d.name as driver,b.name as bus,t.amt as amt FROM tickets t,schedules s,drivers d,buses b WHERE s.departure_date='".$date."' Group by bus,driver";
	
//echo "testing user:".$user_name;
    $result = Yii::app()->db->createCommand($sql)->query();
 
	foreach($result as $r){
	$total = number_format($r['amt'],2);
	$totalcount = number_format($r['count']);
	}

    $sql="SELECT SUM( t.amt ) AS tamt, COUNT( t.amt ) AS tcount, p.name AS ptype
		FROM tickets t
		INNER JOIN passenger_types p ON p.id = passenger_type_id
		WHERE t.status = 1 AND t.created_by = '".$user_name."'";
		
		if($date)
         	  $sql .= " AND DATE(created_at) BETWEEN $date";


		
    $sql .= "GROUP BY ptype";
		
   $result = Yii::app()->db->createCommand($sql)->query();
   $this->render('tellersReport',array('result'=>$result,
					'rf'=>$rf,
					'date'=>$date,
					'total'=>$total,
					'totalcount'=>$totalcount,
					'user_name'=>$user_name,
					'date'=>$date));
}


public function actionTellersPrint(){

# $ptype = CHtml::listData(PassengerTypes::model()->findAll(),'id','name');
  
 $this->renderPartial('tellersPrint');

/*  $this->renderPartial('tellersPrint',array(
    '','totalcount'=>$totalcount,'total'=>$total
  ));
*/
}


public function actionTellersRevenue(){


$rf = new ReportForm;
    $result=array();
    if(isset($_POST['ReportForm'])){
      $rf->attributes=$_POST['ReportForm'];
    }

 $date = $rf->date_range ? $rf->date_range : NULL;

    $user_name=Yii::app()->user->id;

        $sql="SELECT SUM(amt) AS amt,COUNT(*) AS count FROM tickets WHERE status=1 AND created_by= '".$user_name."'";
        if($date)
          $sql .= " AND DATE(created_at) BETWEEN $date";

    $result = Yii::app()->db->createCommand($sql)->query();

 foreach($result as $r){
        $total = number_format($r['amt'],2);
        $totalcount = number_format($r['count']);
        }


#        $sql="SELECT SUM(amt) AS amt,COUNT(*) AS count FROM tickets WHERE created_by= '".$user_name."' AND DATE(created_at)=CURDATE()";


 $sql="SELECT SUM( t.amt ) AS tamt, COUNT( t.amt ) AS tcount, p.name AS ptype
                FROM tickets t
                INNER JOIN passenger_types p ON p.id = passenger_type_id
                WHERE t.status = 1 AND t.created_by = '".$user_name."'";

                if($date)
                  $sql .= " AND DATE(created_at) BETWEEN $date";
  


    $sql .= "GROUP BY ptype";
              
   $result = Yii::app()->db->createCommand($sql)->query();
   $this->render('tellersRevenue',array('result'=>$result,
                                        'rf'=>$rf,
                                        'date'=>$date,
                                        'total'=>$total,
                                        'totalcount'=>$totalcount,
                                        'user_name'=>$user_name,
                                        'date'=>$date));



#   $result = Yii::app()->db->createCommand($sql)->query();
#   $this->render('tellersRevenue',array('result'=>$result,'rf'=>$rf));



}


public function actionDailyRevenueReport(){

$rf = new ReportForm;
    $result=array();
    if(isset($_POST['ReportForm'])){
      $rf->attributes=$_POST['ReportForm'];
    }
    $date = $rf->date_range ? $rf->date_range : NULL;
	$sql="SELECT d.name as driver,SUM(t.amt) as amt FROM drivers d INNER JOIN schedules s ON d.id=s.driver_id INNER JOIN tickets t INNER JOIN schedules ON s.id=t.schedule_id Group By driver";
//    $sql =" SELECT s.id as id, d.name as driver,b.name as bus,t.amt as amt FROM tickets t,schedules s,drivers d,buses b WHERE s.departure_date='".$date."' Group by bus,driver";
    /*if($date)
      $sql .= " AND s.departure_date BETWEEN $date";
    if($rf->bus)
      $sql .= " AND s.bus_id='$rf->bus' ";
    if($rf->route)
      $sql .= " AND s.route_id='$rf->route' ";
    if($rf->driver)
      $sql .= " AND s.driver_id='$rf->driver' ";
    $sql .="
                      GROUP BY date
                  ) temp
        GROUP BY day_of_week
        ORDER BY day_num  ";*/

    $result = Yii::app()->db->createCommand($sql)->queryAll();
    $this->render('dailyRevenueReport',array('result'=>$result,'rf'=>$rf,'date'=>$date));
	echo $sql;
	

	//$this->render('dailyRevenueReport');
}

}
