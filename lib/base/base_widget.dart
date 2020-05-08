
import 'package:flutter/material.dart';
import 'package:master/base/page_struct.dart';

/**
 * @desc
 * @author xiedong
 * @date   2020-01-21.
 */

abstract class BaseWidget extends StatefulWidget {
  BaseWidgetState baseWidgetState;

  @override
  State<StatefulWidget> createState() {
    baseWidgetState = getPageState();
    return baseWidgetState;
  }

  //由具体子类实现
  BaseWidgetState getPageState();
}

abstract class BaseWidgetState<T extends BaseWidget> extends State<T>
    with PageStruct {
  BODY_TYPE _bodyType = BODY_TYPE.BODY_WITH_APPBAR;

  @override
  void initState() {
    super.initState();
    //调试模式下打印页面名称，便于定位页面
    if (isDebug) {
      print("\n------------------pageState Name---------  " +
          T.toString() +
          "\n");
    }
    initPageState();
  }

  @override
  Widget build(BuildContext context) {
    _bodyType = setBodyType();
    return _buildBody();
  }

  Widget _buildBody() {
    Widget _body;
    switch (_bodyType) {
      case BODY_TYPE.SINGLE_BODY:
        _body = pageBody();
        break;
      case BODY_TYPE.BODY_WITH_APPBAR:
        _body = Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(pageTitle() == null ? "" : pageTitle()),
          ),
          body: pageBody(),
          resizeToAvoidBottomPadding: false, //设置内容不随软键盘上移，防止布局溢出
        );
        break;
      default:
        _body = pageBody();
        break;
    }

    return _body;
  }

  //页面类型 默认返回带appbar带页面，子类可重写页面类型
  BODY_TYPE setBodyType() {
    return BODY_TYPE.BODY_WITH_APPBAR;
  }
}

/**
 * 页面类型
 */
enum BODY_TYPE {
  SINGLE_BODY,
  BODY_WITH_APPBAR,
  BODY_WITH_BOTTOMBAR,
  BODY_WITH_ALL
}
