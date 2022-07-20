import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaodi_web/generated/l10n.dart';
import 'package:miaodi_web/utils/ui_utils.dart';

class InputBottomSheet {
  static oneInput(BuildContext context,
      TextEditingController textEditingController,
      FocusNode focusNode,
      String title,
      tips,
      Function callback,
      {bool obscureText = false}) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color:
                  UiUtils.isDarkMode(context) ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              clipBehavior: Clip.antiAlias,
              // 进行底部填充，否则看不到编辑框
              padding: EdgeInsets.only(
                  bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: 60,
                      color: Theme
                          .of(context)
                          .accentColor,
                      child: ListTile(
                        leading: InkWell(
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        title: Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 16),
                    child: Text(tips,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.w400)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 4),
                      child: TextField(
                        controller: textEditingController,
                        autofocus: true,
                        obscureText: obscureText,
                        decoration: InputDecoration(),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                S.of(context).cancel,
                                style: TextStyle(
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            TextButton(
                                onPressed: () {
                                  callback();
                                },
                                child: Text(
                                  S.of(context).sure,
                                  style: TextStyle(
                                    color: Colors.amber,
                                  ),
                                ))
                          ])),
                ],
              ),
            ),
          );
        });
  }

  static threeInput(BuildContext context,
      TextEditingController textEditingController0,
      textEditingController1,
      textEditingController2,
      FocusNode focusNode,
      String title,
      hint0,
      hint1,
      hint2,
      bool obscureText,
      Function callback) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color:
                  UiUtils.isDarkMode(context) ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              clipBehavior: Clip.antiAlias,
              // 进行底部填充，否则看不到编辑框
              padding: EdgeInsets.only(
                  bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: 60,
                      color: Theme.of(context).colorScheme.secondary,
                      child: ListTile(
                        leading: InkWell(
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        title: Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: TextField(
                        controller: textEditingController0,
                        obscureText: obscureText,
                        autofocus: true,
                        decoration: InputDecoration(
                            labelText: hint0, border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16))
                        )),
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: TextField(
                        controller: textEditingController1,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                            labelText: hint1, border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16))
                        )),
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: TextField(
                        controller: textEditingController2,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                            labelText: hint2, border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16))
                        )),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                S.of(context).cancel,
                                style: TextStyle(
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            TextButton(
                                onPressed: () {
                                  callback();
                                },
                                child: Text(
                                  S.of(context).sure,
                                  style: TextStyle(
                                    color: Colors.amber,
                                  ),
                                ))
                          ])),
                ],
              ),
            ),
          );
        });
  }

  static oneInputAndOneVerification(BuildContext context,
      TextEditingController verifyController,
      TextEditingController emailController,
      FocusNode focusNode,
      String title,
      verifyTips,
      tips,

      Function verifyCallback, callback,
      {bool obscureText = false}) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color:
                  UiUtils.isDarkMode(context) ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              clipBehavior: Clip.antiAlias,
              // 进行底部填充，否则看不到编辑框
              padding: EdgeInsets.only(
                  bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: 60,
                      color: Theme
                          .of(context)
                          .accentColor,
                      child: ListTile(
                        leading: InkWell(
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        title: Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: TextField(
                              controller: verifyController,
                              obscureText: obscureText,
                              autofocus: true,
                              decoration: InputDecoration(
                                  labelText: verifyTips,//悬浮提示
                                  border: OutlineInputBorder(//边框
                                borderRadius: BorderRadius.all(Radius.circular(16))
                              )
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 12,top: 6),
                            child: GestureDetector(
                              child: Container(
                                width: 90,
                                height: 36,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16)),
                                    color: Theme
                                        .of(context)
                                        .colorScheme
                                        .secondary
                                ),
                                child: Center(
                                  child: Text(
                                    S.of(context).getVerifyCode,
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                verifyCallback();
                              },
                            )
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: TextField(
                        controller: emailController,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          labelText: tips,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16))
                          )
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                S.of(context).cancel,
                                style: TextStyle(
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            TextButton(
                                onPressed: () {
                                  callback();
                                },
                                child: Text(
                                  S.of(context).sure,
                                  style: TextStyle(
                                    color: Colors.amber,
                                  ),
                                ))
                          ])),
                ],
              ),
            ),
          );
        });
  }
}
