<?php

/**
 * This is the model class for table "jammers".
 *
 * The followings are the available columns in table 'jammers':
 * @property integer $id
 * @property string $first_name
 * @property string $last_name
 * @property string $birthdate
 * @property string $registered_date
 * @property string $validity_date
 * @property string $id_picture
 */
class Jammers extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Jammers the static model class
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
		return 'jammers';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('first_name, last_name, id_no, birthdate, registered_date, issuance_date, validity_date', 'required'),
				array('id_picture', 'file', 'types'=>'jpg, gif, png','allowEmpty'=>true),
                       		array('image_name,image_type,image_size,image', 'safe'),

			array('first_name, last_name', 'length', 'max'=>25),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, first_name, middle_name, last_name, extension_name, id_no, birthdate, email_address, registered_date, issuance_date, validity_date, id_picture', 'safe', 'on'=>'search'),
		);
	}

	public function beforeSave()
	{
        if($file=CUploadedFile::getInstance($this,'id_picture'))
        {
            //$this->file_name=$file->name;
            //$this->file_type=$file->type;
            //$this->file_size=$file->size;
            $this->id_picture=file_get_contents($file->tempName);
        }

    return parent::beforeSave();
    }


	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'id_no' => 'ID Number',
			'first_name' => 'First Name',
			'middle_name' => 'Middle Name',
			'last_name' => 'Last Name',
			'extension_name' => 'Extension Name',
			'birthdate' => 'Birthdate',
			'email_address' => 'Email Address',
			'registered_date' => 'Registered Date',
			'issuance_date' => 'Date of Issuance',
			'validity_date' => 'Date of Validity',
			'id_picture' => 'ID Picture',
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
		$criteria->compare('id_no',$this->id_no);
		$criteria->compare('first_name',$this->first_name,true);
		$criteria->compare('middle_name',$this->middle_name,true);
		$criteria->compare('last_name',$this->last_name,true);
		$criteria->compare('extension_name',$this->extension_name,true);
		$criteria->compare('birthdate',$this->birthdate,true);
		$criteria->compare('email_address',$this->email_address,true);
		$criteria->compare('registered_date',$this->registered_date,true);
		$criteria->compare('issuance_date',$this->issuance_date,true);
		$criteria->compare('validity_date',$this->validity_date,true);
		$criteria->compare('id_picture',$this->id_picture,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
