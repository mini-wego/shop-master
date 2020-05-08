
import 'package:flutter/material.dart';

/**
 * @desc  页面结构框架\常用工具类定义
 * @author xiedong
 * @date   2020-01-21.
 */
abstract class PageStruct {

  //是否是debug模式
  bool isDebug = !bool.fromEnvironment("dart.vm.product");


  //页面标题
  String pageTitle();

  //页面初始化操作
  void initPageState(){}

  //页面布局
  Widget pageBody();
}