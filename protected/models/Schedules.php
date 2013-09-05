<?php

/**
 * This is the model class for table "schedules".
 *
 * The followings are the available columns in table 'schedules':
 * @property integer $id
 * @property integer $bus_id
 * @property integer $route_id
 * @property string $departure_time
 * @property string $arrival_time
 * @property integer $status
 * @property string $created_at
 *
 * The followings are the available model relations:
 * @property Routes $route
 * @property Buses $bus
 * @property Tickets[] $tickets
 */
class Schedules extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Schedules the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'schedules';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('bus_id,driver_id, route_id,departure_date, departure_time, arrival_time,', 'required'),
			array('bus_id,driver_id, route_id, status', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, bus_id,driver_id, route_id, departure_date,departure_time, arrival_time, status, created_at', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'route' => array(self::BELONGS_TO, 'Routes', 'route_id'),
			'bus' => array(self::BELONGS_TO, 'Buses', 'bus_id'),
			'driver' => array(self::BELONGS_TO, 'Drivers', 'driver_id'),
			'tickets' => array(self::HAS_MANY, 'Tickets', 'schedule_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'Trip #',
			'bus_id' => 'Bus',
			'driver_id' => 'Driver',
			'route_id' => 'Route',
			'departure_date' => 'Departure Date',
			'departure_time' => 'Departure Time',
			'arrival_time' => 'Arrival Time',
			'status' => 'Status',
			'created_at' => 'Created At',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('bus_id',$this->bus_id);
		$criteria->compare('driver_id',$this->driver_id);
		$criteria->compare('route_id',$this->route_id);
		$criteria->compare('departure_time',$this->departure_time,true);
		$criteria->compare('departure_date',$this->departure_date,true);
		$criteria->compare('arrival_time',$this->arrival_time,true);
		$criteria->compare('status',$this->status);
		$criteria->compare('created_at',$this->created_at,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
