import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:master/base/base_widget.dart';

/**
 * @desc
 * @author xiedong
 * @date   2020-05-08.
 */

class HomePage extends BaseWidget{
  @override
  BaseWidgetState<BaseWidget> getPageState() {
    return PageState();
  }
}


class PageState extends BaseWidgetState{
  @override
  Widget pageBody() {
    return Center(
      child: Text("微购 商家端"),
    );
  }

  @override
  String pageTitle() {
    return "微购";
  }

}