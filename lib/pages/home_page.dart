import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:master/base/base_widget.dart';
import 'package:master/widget/margin_widget.dart';

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

int type =0;

class PageState extends BasePageState<HomePage> {

  TextEditingController _titleEditingController = TextEditingController();
  TextEditingController _phoneNumberEditingController = TextEditingController();
  TextEditingController _priceEditingController = TextEditingController();
  TextEditingController _detailEditingController = TextEditingController();
  TextEditingController _fromEditingController = TextEditingController();
  TextEditingController _destinationEditingController = TextEditingController();

  String _price = '0';

  static List<TypeItemEntity> _typeList = [
    TypeItemEntity("炒菜", 0),
    TypeItemEntity("主食", 1),
    TypeItemEntity("甜点", 2),
    TypeItemEntity("汤", 3),
    TypeItemEntity("炖菜", 4),
    TypeItemEntity("其他", 5),
  ];
  @override
  Widget pageBody() {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      children: <Widget>[
        Column(
          children: <Widget>[
            //标题
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(children: <Widget>[
                Icon(
                  Icons.flash_on,
                  color: Colors.black45,
                  size: 20.0,
                ),
                SizedBox(width: 20),
                Container(
                  width: 260.0,
                  child: TextField(
                    controller: _titleEditingController,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.pinkAccent, width: 2)),
                        contentPadding: const EdgeInsets.all(10.0),
                        labelStyle:
                        TextStyle(color: Colors.grey, fontSize: 14),
                        labelText: "请输入菜系标题..."),
                    onChanged: (String str) {
                      if (str.length >= 100) {
                        showDialog(
                            context: context,
                            child: new AlertDialog(
                              title: Text(
                                "标题字数已达上限",
                                style: TextStyle(color: Colors.red),
                              ),
                              content: Text("建议任务标题控制在100字以内，超出部分首页将不再显示。",
                                  style: TextStyle(color: Colors.black)),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("确定")),
                              ],
                            ));
                      }
                    },
                  ),
                )
              ]),
            ),
            Margin(height: 20.0),


            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 2.0),
                  Text("▌",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent)),
                  SizedBox(width: 10.0),
                  Text("菜系类型",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13)),
                ]),
            TypeItemWidget(_typeList),

            Container(
              height: 200,
              child: Icon(Icons.photo,size: 180,
              color: Colors.black12,
              ),
            ),

            Margin(height: 20.0),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 2.0),
                  Text("▌",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent)),
                  SizedBox(width: 10.0),
                  Text("联系地址",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13)),
                ]),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(children: <Widget>[
                SizedBox(width: 10),
                Icon(
                  Icons.fiber_manual_record,
                  color: Colors.lightBlue,
                  size: 16.0,
                ),
                SizedBox(width: 10),
                Container(
                  width: 260.0,
                  child: TextField(
                    controller: _fromEditingController,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(10.0),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                        labelStyle:
                        TextStyle(color: Colors.grey, fontSize: 14),
                        labelText: "店铺所在位置..."),
                    onChanged: (String str) {
                      if (str.length >= 30) {
                        showDialog(
                            context: context,
                            child: new AlertDialog(
                              title: Text(
                                "位置字数已达上限",
                                style: TextStyle(color: Colors.red),
                              ),
                              content: Text("请将位置字数控制在30字以内！",
                                  style: TextStyle(color: Colors.black)),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("确定")),
                              ],
                            ));
                      }
                    },
                  ),
                )
              ]),
            ),
            SizedBox(height: 20),

//            Padding(
//              padding: EdgeInsets.all(2.0),
//              child: Row(children: <Widget>[
//                SizedBox(width: 10),
//                Icon(
//                  Icons.fiber_manual_record,
//                  color: Colors.redAccent,
//                  size: 16.0,
//                ),
//                SizedBox(width: 10),
//                Container(
//                  width: 260.0,
//                  child: TextField(
//                    controller: _destinationEditingController,
//                    keyboardType: TextInputType.text,
//                    decoration: new InputDecoration(
//                        border: OutlineInputBorder(
//                          borderSide: BorderSide(
//                            color: Colors.blue,
//                          ),
//                        ),
//                        contentPadding: const EdgeInsets.all(10.0),
//                        focusedBorder: OutlineInputBorder(
//                            borderSide: BorderSide(
//                              color: Colors.red,
//                            )),
//                        labelStyle:
//                        TextStyle(color: Colors.grey, fontSize: 14),
//                        labelText: "位置..."),
//                    onChanged: (String str) {
//                      if (str.length >= 30) {
//                        showDialog(
//                            context: context,
//                            child: new AlertDialog(
//                              title: Text(
//                                "位置字数已达上限",
//                                style: TextStyle(color: Colors.red),
//                              ),
//                              content: Text("请将位置字数控制在30字以内！",
//                                  style: TextStyle(color: Colors.black)),
//                              actions: <Widget>[
//                                FlatButton(
//                                    onPressed: () {
//                                      Navigator.of(context).pop();
//                                    },
//                                    child: Text("确定")),
//                              ],
//                            ));
//                      }
//                    },
//                  ),
//                )
//              ]),
//            ),
            SizedBox(height: 20.0),
            //联系方式
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 2.0),
                  Text("▌",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent)),
                  SizedBox(width: 10.0),
                  Text("联系方式",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13)),
                ]),
            //联系方式
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(children: <Widget>[
                SizedBox(width: 10),
                Icon(
                  Icons.call,
                  color: Colors.blue,
                  size: 16.0,
                ),
                SizedBox(width: 10),
                Container(
                  width: 260.0,
                  child: TextField(
                    controller: _phoneNumberEditingController,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.lightBlue, width: 2)),
                        labelStyle:
                        TextStyle(color: Colors.grey, fontSize: 14),
                        contentPadding: const EdgeInsets.all(10.0),
                        labelText: "你的手机号、QQ、微信..."),
                  ),
                )
              ]),
            ),
            SizedBox(height: 10.0),
            //备注
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 2.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 10),
                    Icon(
                      Icons.details,
                      color: Colors.green,
                      size: 16.0,
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 260.0,
                      child: TextField(
                        maxLines: 3,
                        controller: _detailEditingController,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                            contentPadding: const EdgeInsets.all(10.0),
                            hintText: '备注：菜品详细内容...',
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            )),
                      ),
                    )
                  ]),
            ),
            Margin(height: 30),
            Container(
              height: 40,
              width: 160,
              child: RaisedButton(
                color: Colors.blueAccent,
                textColor: Colors.white,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text(
                  "上架新菜系",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  showDialog(context: context,
                  child: AlertDialog(
                    title: Text("上架成功"),
                    content: Text("新菜品上架成功啦，快去分享给用户享用吧～～～"),

                    actions: <Widget>[
                      FlatButton(onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text("确定"),)
                    ],
                  )
                  );
                },
              ),
            )
          ],
          // ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  String pageTitle() {
    return "上架新菜品";
  }
}


class TypeItemEntity {
  String title;
  int index;

  TypeItemEntity(this.title, this.index);
}

class TypeItemWidget extends StatefulWidget {
  List<TypeItemEntity> _typeItemEntity;

  TypeItemWidget(this._typeItemEntity);

  @override
  State<StatefulWidget> createState() {
    return TypeItemWidgetState();
  }
}

class TypeItemWidgetState extends State<TypeItemWidget> {
  var _selectedStyle = BoxDecoration(
      color: Colors.orangeAccent,
      borderRadius: BorderRadius.all(Radius.circular(5.0)));
  var _normalStyle = BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.all(Radius.circular(5.0)));
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(20.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        childAspectRatio: 2.0,
        crossAxisSpacing: 10.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            alignment: Alignment.center,
            decoration: widget._typeItemEntity[index].index == _currentIndex
                ? _selectedStyle
                : _normalStyle,
            child: GestureDetector(
              child: Text(widget._typeItemEntity[index].title),
            ),
          ),
          onTap: () {
            this.setState(() {
              _currentIndex = widget._typeItemEntity[index].index;
              type = widget._typeItemEntity[index].index;
            });
          },
        );
      },
      itemCount: widget._typeItemEntity.length,
    );
  }
}
