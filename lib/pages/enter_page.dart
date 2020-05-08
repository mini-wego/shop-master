import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:master/base/base_widget.dart';
import 'package:master/pages/home_page.dart';
import 'package:master/widget/margin_widget.dart';

/**
 * @desc 商家入口
 * @author xiedong
 * @date   2020-05-08.
 */

class EnterPage extends BasePage {
  @override
  BasePageState<EnterPage> getPageState() {
    return PageState();
  }
}

class PageState extends BasePageState<EnterPage> {
  @override
  Widget pageBody() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      gapPadding: 10.0,
                      borderRadius: BorderRadius.circular(20.0)),
                  contentPadding: EdgeInsets.all(10.0),
                  prefixIcon: Icon(Icons.confirmation_number),
                  labelText: "请输入商家编号...",
                  hintText: "请输入商家编号...",
                  helperText: "商家编号是商家的唯一认证标识"),
            ),
            Margin(height: 30.0),
            Container(
              height: 40,
              child: RaisedButton(
                color: Colors.blueAccent,
                textColor: Colors.white,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text(
                  "验证商家码",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  goHomePage();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  String pageTitle() {
    return "微购";
  }

  void goHomePage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
  }
}
