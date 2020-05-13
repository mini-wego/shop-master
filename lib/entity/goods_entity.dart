import 'package:data_plugin/bmob/table/bmob_object.dart';

/**
 * @desc
 * @author xiedong
 * @date   2020-05-13.
 */

class GoodsEntity extends BmobObject{
 String title;
 String content;
 String type;
 String phone;
 String imgUrl;
 String address;



  @override
  Map getParams() {
    throw UnimplementedError();
  }

}