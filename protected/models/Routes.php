<?php

/**
 * This is the model class for table "routes".
 *
 * The followings are the available columns in table 'routes':
 * @property integer $id
 * @property string $line
 * @property integer $origin
 * @property integer $destination
 * @property string $distance
 * @property string $travel_time
 * @property string $other_info
 * @property string $fare
 * @property string $active
 *
 * The followings are the available model relations:
 * @property Location $origin0
 * @property Location $destination0
 * @property Schedules[] $schedules
 * @property Tickets[] $tickets
 */
class Routes extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Routes the static model class
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
		return 'routes';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('line, origin, destination', 'required'),
			array('origin, destination', 'numerical', 'integerOnly'=>true),
			array('line, distance, travel_time', 'length', 'max'=>255),
			array('fare', 'length', 'max'=>20),
			array('active', 'length', 'max'=>1),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, line, origin, destination, distance, travel_time, other_info, fare, active', 'safe', 'on'=>'search'),
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
			'origin0' => array(self::BELONGS_TO, 'Location', 'origin'),
			'destination0' => array(self::BELONGS_TO, 'Location', 'destination'),
			'schedules' => array(self::HAS_MANY, 'Schedules', 'route_id'),
			'tickets' => array(self::HAS_MANY, 'Tickets', 'route_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'line' => 'Line',
			'origin' => 'Origin',
			'destination' => 'Destination',
			'distance' => 'Distance',
			'travel_time' => 'Travel Time',
			'other_info' => 'Other Info',
			'fare' => 'Fare',
			'active' => 'Active',
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
		$criteria->compare('line',$this->line,true);
		$criteria->compare('origin',$this->origin);
		$criteria->compare('destination',$this->destination);
		$criteria->compare('distance',$this->distance,true);
		$criteria->compare('travel_time',$this->travel_time,true);
		$criteria->compare('other_info',$this->other_info,true);
		$criteria->compare('fare',$this->fare,true);
		$criteria->compare('active',$this->active,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
