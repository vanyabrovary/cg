<?php
namespace app\models;

use Yii;
use yii\db\ActiveRecord;

class [% itm.class %] extends ActiveRecord
{

    public static function tableName()
    {
        return '[% itm.table %]';

    }


    public function rules()
    {
        return [
            ['id', 'integer'],
	    [[[% FOREACH item = itm.info %]'[% item.column_name %]'[%"," UNLESS loop.last %][% END %]], 'safe']
        ];

    }

}

/*

  ** COLUMNS INFO ** [% USE Dumper %]
  [% Dumper.dump(itm.info) %]

*/
