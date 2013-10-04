<?php

class SchedulesController extends Controller
{
/**
* @var string the default layout for the views. Defaults to '//layouts/column2', meaning
* using two-column layout. See 'protected/views/layouts/column2.php'.
*/
public $layout='//layouts/column2';

/**
* @return array action filters
*/
public function filters()
{
return array(
'rights',
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
'actions'=>array('index','view'),
'users'=>array('*'),
),
array('allow', // allow authenticated user to perform 'create' and 'update' actions
'actions'=>array('create','update','close'),
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

/**
* Creates a new model.
* If creation is successful, the browser will be redirected to the 'view' page.
*/
public function actionCreate()
{
$model=new Schedules;
$drivers = array();
$drivers_to_id = array();
$id_to_driver = array();

$buses = array();
$buses_to_id = array();
$id_to_bus = array();

foreach(Buses::model()->findall() as $b){
  array_push($buses,trim($b->name));
  $buses_to_id[trim($b->name)] = $b->id;
  $id_to_bus[$b->id]=trim($b->name);
  }

foreach(Drivers::model()->findAll() as $d){
  array_push($drivers,trim($d->emp_id.' - '.$d->name));
  $drivers_to_id[trim($d->emp_id.' - '.$d->name)]=$d->id;
  $id_to_driver[$d->id]=trim($d->emp_id.' - '.$d->name);
}
if(isset($_POST['Schedules']))
{
$did = $_POST['Schedules']['driver_id'];
$bid = $_POST['Schedules']['bus_id'];
$dt = $_POST['Schedules']['departure_time'];
$da = $_POST['Schedules']['arrival_time'];
$_POST['Schedules']['departure_time'] = date('H:i:s',strtotime($dt));
$_POST['Schedules']['arrival_time'] = date('H:i:s',strtotime($da));

if(!isset($drivers_to_id[trim($did)])){
  Yii::app()->user->setFlash('error', 'Driver Does Not Exist!');
  $this->redirect(array('create'));
}
if(!isset($buses_to_id[trim($bid)])){
  Yii::app()->user->setFlash('error', 'Bus Does Not Exist!');
  $this->redirect(array('create'));
}

$_POST['Schedules']['driver_id'] = $drivers_to_id[trim($did)];
$_POST['Schedules']['bus_id'] = $buses_to_id[trim($bid)];
$model->attributes=$_POST['Schedules'];
if($model->save()){
Yii::app()->user->setFlash('success', 'Bus Schedule has been added!');
$this->redirect(array('admin'));
}
$model->driver_id = $id_to_driver[$model->driver_id];
$model->bus_id = $id_to_bus[$model->bus_id];
}
$this->render('create',array(
'model'=>$model,'drivers'=>$drivers,'buses'=>$buses,
));
}
public function actionClose($id){
  $model=$this->loadModel($id);
  $model->status=2;
  if($model->save()){
    Yii::app()->user->setFlash('success', 'Ticket Reservation has been closed!');
    $this->redirect(array('tickets/sell'));
  }
}

/**
* Updates a particular model.
* If update is successful, the browser will be redirected to the 'view' page.
* @param integer $id the ID of the model to be updated
*/
public function actionUpdate($id)
{
$model=$this->loadModel($id);

$drivers = array();
$drivers_to_id = array();
$id_to_driver = array();

$buses = array();
$buses_to_id = array();
$id_to_bus = array();

foreach(Buses::model()->findall() as $b){
  array_push($buses,trim($b->name));
  $buses_to_id[trim($b->name)] = $b->id;
  $id_to_bus[$b->id]=trim($b->name);
  }

foreach(Drivers::model()->findAll() as $d){
  array_push($drivers,trim($d->emp_id.' - '.$d->name));
  $drivers_to_id[trim($d->emp_id.' - '.$d->name)]=$d->id;
  $id_to_driver[$d->id]=trim($d->emp_id.' - '.$d->name);
}
// Uncomment the following line if AJAX validation is needed
// $this->performAjaxValidation($model);

if(isset($_POST['Schedules']))
{
$dt = $_POST['Schedules']['departure_time'];
$da = $_POST['Schedules']['arrival_time'];
$did = $_POST['Schedules']['driver_id'];
$bid = $_POST['Schedules']['bus_id'];
$_POST['Schedules']['departure_time'] = date('H:i:s',strtotime($dt));
$_POST['Schedules']['arrival_time'] = date('H:i:s',strtotime($da));

if(!isset($drivers_to_id[trim($did)])){
  Yii::app()->user->setFlash('error', 'Driver Does Not Exist!');
  $this->redirect(array('update&id='.$id));
}
if(!isset($buses_to_id[trim($bid)])){
  Yii::app()->user->setFlash('error', 'Bus Does Not Exist!');
  $this->redirect(array('update&id='.$id));
}
$_POST['Schedules']['driver_id'] = $drivers_to_id[trim($did)];
$_POST['Schedules']['bus_id'] = $buses_to_id[trim($bid)];
$model->attributes=$_POST['Schedules'];
if($model->save()){
Yii::app()->user->setFlash('success', 'Bus Schedule has been updated!');
$this->redirect(array('admin'));
}
}
#$model->departure_time=date('g:i A',strtotime($model->departure_time));
#$model->arrival_time=date('g:i A',strtotime($model->arrival_time));
$model->driver_id = $id_to_driver[$model->driver_id];
$model->bus_id = $id_to_bus[$model->bus_id];
$this->render('update',array(
'model'=>$model,'drivers'=>$drivers,'buses'=>$buses,
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
$dataProvider=new CActiveDataProvider('Schedules');
$this->render('index',array(
'dataProvider'=>$dataProvider,
));
}

/**
* Manages all models.
*/
public function actionAdmin()
{
$model=new Schedules('search');
$model->unsetAttributes();  // clear any default values
if(isset($_GET['Schedules']))
$model->attributes=$_GET['Schedules'];

$this->render('admin',array(
'model'=>$model,
));
}

/**
* Returns the data model based on the primary key given in the GET variable.
* If the data model is not found, an HTTP exception will be raised.
* @param integer the ID of the model to be loaded
*/
public function loadModel($id)
{
$model=Schedules::model()->findByPk($id);
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
if(isset($_POST['ajax']) && $_POST['ajax']==='schedules-form')
{
echo CActiveForm::validate($model);
Yii::app()->end();
}
}
}
