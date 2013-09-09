<?php

class TicketsController extends Controller
{
/**
* @var string the default layout for the views. Defaults to '//layouts/column2', meaning
* using two-column layout. See 'protected/views/layouts/column2.php'.
*/
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

/**
* Specifies the access control rules.
* This method is used by the 'accessControl' filter.
* @return array access control rules
*/
/*public function accessRules()
{
return array(
array('allow',  // allow all users to perform 'index' and 'view' actions
'actions'=>array('index','view','buy','busAssignment'),
'users'=>array('*'),
),
array('allow', // allow authenticated user to perform 'create' and 'update' actions
'actions'=>array('create','update','ticketReport'),
'users'=>array('@'),
),
array('allow', // allow admin user to perform 'admin' and 'delete' actions
'actions'=>array('admin','delete'),
'users'=>array('admin'),
),
array('deny',  // deny all users
'users'=>array('*'),
),
);
}
*/
/**
* Displays a particular model.
* @param integer $id the ID of the model to be displayed
*/
public function actionView($id)
{
$this->render('view',array(
'model'=>$this->loadModel($id),
));
}


  public function actionSell(){
	// renders the view file 'protected/views/site/index.php'
	// using the default layout 'protected/views/layouts/main.php'
        $tag = isset($_GET['tag']) ? $_GET['tag'] : '';
        $total_amt = isset($_GET['total_amt']) ? number_format($_GET['total_amt']) : 0;
        $criteria= new CDbCriteria();
        $criteria=array(
          'group'=>'schedule_id',
          'select'=>'schedule_id,count(*) AS cnt',
        );
        $bookedTkts = CHtml::listData(Tickets::model()->findAll($criteria),'schedule_id','cnt');
        $schedules = Schedules::model()->findAll(array('condition'=>'status=1 AND departure_date=CURDATE() limit 3'));
        if($total_amt)
          Yii::app()->user->setFlash('info', "TOTAL AMOUNT: $total_amt");
	$this->render('sell',array('schedules'=>$schedules,'bookedTkts'=>$bookedTkts,'tag'=>$tag));

  }


/**
* Creates a new model.
* If creation is successful, the browser will be redirected to the 'view' page.
*/
  public function actionBuy(){
    $total_amt =0;
    if(isset($_GET['Tickets'])){
      $pcs = isset($_GET['pcs']) ? $_GET['pcs'] : null;
      $tag = isset($_GET['tag']) ? $_GET['tag'] : '';
      $tktNo = Counter::model()->findByPk(1);
      $counter=0;
      $tktDetails = array();
      $dscnts = CHtml::listData(PassengerTypes::model()->findAll(),'id','discount');
      while($counter < $pcs){
        $model=new Tickets;
        $model->attributes=$_GET['Tickets'];
        if($model->jammers_id){
          $jammers = Jammers::model()->findByAttributes(array('id_no'=>$model->jammers_id));
          if($jammers){
            Yii::app()->user->setFlash('success', "JAMMER ID#$model->jammers_id $jammers->first_name");
            $model->jammers_id=$jammers->id;
          }else{
            Yii::app()->user->setFlash('error', "JAMMER with ID#$model->jammers_id DOES NOT EXISTS!");
            $this->redirect(array('tickets/sell'));
          }
        }
        $tktNo->saveCounters(array('value'=>1));
        $model->tkt_no = tktNum($tktNo->value);
        $dscnt=$dscnts[$model->passenger_type_id] ? $model->route->fare * $dscnts[$model->passenger_type_id] / 100 : 0;
        $amt = number_format($model->route->fare-$dscnt);
        $model->amt = $amt;
	$model->created_by=Yii::app()->user->id;
        $model->save();
        $departure=isset($model->schedule->departure_date) ? $model->schedule->departure_date.' '.date('g:i A',strtotime($model->schedule->departure_time)) : 'OPEN';
        $tktDetails[] = array('tkt_no'=>$model->tkt_no,'bus'=>isset($model->bus->name) ? $model->bus->name : '',
                              'route'=>$model->route->line,'ptype'=>$model->passengerType->name,
                              'departure'=>'ETD:'.$departure,
                              'dop'=>'DATE OF PURCHASE:'.$model->created_at,
                              'tkt_type'=>$model->ticketType->name,'amt'=>$amt
                        );
        $total_amt += $amt;
        $counter++;
	//echo Yii::app()->user->id;
      }
    }
    $this->renderPartial('print',array(
      'tktDetails'=>$tktDetails,'tag'=>$tag,'total_amt'=>$total_amt
    ));
  }

  public function actionPrint($id){
    $tag=0;
    $total_amt=0;
    $model=$this->loadModel($id);
    $tktDetails = array();
    $dscnts = CHtml::listData(PassengerTypes::model()->findAll(),'id','discount');
    $dscnt=$dscnts[$model->passenger_type_id] ? $model->route->fare * $dscnts[$model->passenger_type_id] / 100 : 0;
    $amt = number_format($model->route->fare-$dscnt);
    $departure=isset($model->schedule->departure_date) ? $model->schedule->departure_date.' '.date('g:i A',strtotime($model->schedule->departure_time)) : 'OPEN';
    $tktDetails[] = array('tkt_no'=>$model->tkt_no,'bus'=>isset($model->bus->name) ? $model->bus->name : '',
                              'route'=>$model->route->line,'ptype'=>$model->passengerType->name,
                              'departure'=>'ETD:'.$departure,
                              'dop'=>'DATE OF PURCHASE:'.$model->created_at,
                              'tkt_type'=>$model->ticketType->name,'amt'=> $amt
                        );
 
    $this->renderPartial('print',array(
      'tktDetails'=>$tktDetails,'tag'=>$tag,'total_amt'=>$total_amt
    ));
  }
  /* conductor */
  public function actionBusAssignment(){
    $this->layout = "main";
    $list = NULL;
    $model = new Tickets();
    if(isset($_POST['submit'])){
      $tiks  = $model->findByAttributes(array('tkt_no'=>$_POST['Tickets']['tkt_no']));
      $sked = Schedules::model()->findByPk($_POST['Tickets']['schedule_id']);
      if($sked){
        $tiks->bus_id = $sked->bus_id;
        $tiks->schedule_id = $sked->id;
        if($tiks->save()){
          Yii::app()->user->setFlash('success', "Passenger Assigned to Bus#".$tiks->schedule->bus->number);
          $this->redirect(array('/tickets/busAssignment'),array('model'=>$model,'list'=>$list));
        }else{
          Yii::app()->user->setFlash('error', "Passenger Assignment Failed!");
          $this->redirect(array('/tickets/busAssignment'),array('model'=>$model,'list'=>$list));
        }
      }else{
          Yii::app()->user->setFlash('info', "Please choose bus");
     } 
    }
    if(isset($_POST['Tickets'])){
      $route  = $model->findByAttributes(array('tkt_no'=>$_POST['Tickets']['tkt_no']));
      if($route){
        if($route->schedule_id==NULL || (strtotime($route->schedule->departure_date) >= strtotime(date("Y-m-d")))){
          $model->tkt_no = isset($_POST['Tickets']['tkt_no']) ? $_POST['Tickets']['tkt_no'] : '';
          $list = Schedules::model()->findAll(array('condition'=>"departure_date>=CURDATE() AND route_id = {$route->route_id}"));
        }else{
          Yii::app()->user->setFlash('error', "Already expired!");
          $this->redirect(array('/tickets/busAssignment'),array('model'=>$model,'list'=>$list));

        }
      }
    }
    $this->render('busAssignment',array('model'=>$model,'list'=>$list));
  }


/**
* Updates a particular model.
* If update is successful, the browser will be redirected to the 'view' page.
* @param integer $id the ID of the model to be updated
*/
public function actionUpdate($id)
{
$model=$this->loadModel($id);

// Uncomment the following line if AJAX validation is needed
// $this->performAjaxValidation($model);

if(isset($_POST['Tickets']))
{
$model->attributes=$_POST['Tickets'];
if($model->save())
$this->redirect(array('admin'));
}

$this->render('update',array(
'model'=>$model,
));
}

/**
* Deletes a particular model.
* If deletion is successful, the browser will be redirected to the 'admin' page.
* @param integer $id the ID of the model to be deleted
*/
public function actionDelete($id)
{
if(Yii::app()->request->isPostRequest)
{
// we only allow deletion via POST request
$this->loadModel($id)->delete();

// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
if(!isset($_GET['ajax']))
$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
}
else
throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
}

/**
* Lists all models.
*/
public function actionIndex()
{
$dataProvider=new CActiveDataProvider('Tickets');
$this->render('index',array(
'dataProvider'=>$dataProvider,
));
}

/**
* Manages all models.
*/
public function actionAdmin()
{
$model=new Tickets('search');
$model->unsetAttributes();  // clear any default values
if(isset($_GET['Tickets']))
$model->attributes=$_GET['Tickets'];

$this->render('admin',array(
'model'=>$model,
));
}

/**
* Returns the data model based on the primary key given in the GET variable.
* If the data model is not found, an HTTP exception will be raised.
* @param integer the ID of the model to be loaded
*/


public function actionTicketReport(){
$this->render('ticketReport');
}



public function loadModel($id)
{
$model=Tickets::model()->findByPk($id);
if($model===null)
throw new CHttpException(404,'The requested page does not exist.');
return $model;
}

/**
* Performs the AJAX validation.
* @param CModel the model to be validated
*/
protected function performAjaxValidation($model)
{
if(isset($_POST['ajax']) && $_POST['ajax']==='tickets-form')
{
echo CActiveForm::validate($model);
Yii::app()->end();
}
}
}
