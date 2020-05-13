import 'package:data_plugin/bmob/bmob.dart';
import 'package:flutter/material.dart';
import 'package:master/config/config.dart';
import 'package:master/pages/enter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Bmob.initMasterKey("https://api2.bmob.cn", Config.appId, Config.apiKey, Config.masterKey);

    return MaterialApp(
      title: '微购',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EnterPage(),
    );
  }
}
