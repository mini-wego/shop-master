import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:master/base/base_widget.dart';

/**
 * @desc
 * @author xiedong
 * @date   2020-05-08.
 */

class HomePage extends BasePage {
  @override
  BasePageState<HomePage> getPageState() {
    return PageState();
  }
}

class PageState extends BasePageState<HomePage> {
  @override
  Widget pageBody() {
    return Center(
      child: Text("fdsafsda"),
    );
  }

  @override
  String pageTitle() {
    return "";
  }
}
