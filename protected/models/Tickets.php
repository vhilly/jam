<?php

/**
 * This is the model class for table "tickets".
 *
 * The followings are the available columns in table 'tickets':
 * @property integer $id
 * @property string $tkt_no
 * @property integer $schedule_id
 * @property integer $seat_id
 * @property integer $bus_id
 * @property integer $route_id
 * @property integer $status
 * @property string $created_at
 *
 * The followings are the available model relations:
 * @property Schedules $schedule
 * @property Buses $bus
 * @property Routes $route
 */
class Tickets extends CActiveRecord
{
        public $cnt;
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tickets';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('tkt_no,amt,ticket_type_id,passenger_type_id, route_id', 'required'),
			array('schedule_id,jammers_id seat_id, bus_id,ticket_type_id,passenger_type_id, route_id, status', 'numerical', 'integerOnly'=>true),
			array('tkt_no', 'length', 'max'=>32),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, tkt_no,amt,jammers_id, schedule_id, seat_id, bus_id, route_id, status, created_at', 'safe', 'on'=>'search'),
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
			'schedule' => array(self::BELONGS_TO, 'Schedules', 'schedule_id'),
			'bus' => array(self::BELONGS_TO, 'Buses', 'bus_id'),
			'route' => array(self::BELONGS_TO, 'Routes', 'route_id'),
			'passengerType' => array(self::BELONGS_TO, 'PassengerTypes', 'passenger_type_id'),
			'ticketType' => array(self::BELONGS_TO, 'TicketTypes', 'ticket_type_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'tkt_no' => 'Ticket No',
			'ticket_type_id' => 'Ticket Type',
			'schedule_id' => 'Trip#',
			'seat_id' => 'Seat',
			'bus_id' => 'Bus',
			'route_id' => 'Route',
			'status' => 'Status',
			'amt' => 'Amount',
			'created_at' => 'Created At',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('tkt_no',$this->tkt_no,true);
		$criteria->compare('ticket_type_id',$this->ticket_type_id,true);
		$criteria->compare('passenger_type_id',$this->passenger_type_id,true);
		$criteria->compare('schedule_id',$this->schedule_id);
		$criteria->compare('seat_id',$this->seat_id);
		$criteria->compare('bus_id',$this->bus_id);
		$criteria->compare('route_id',$this->route_id);
		$criteria->compare('status',$this->status);
		$criteria->compare('created_at',$this->created_at,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Tickets the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
