import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaodi_web/common/event_name.dart';
import 'package:miaodi_web/common/style.dart';
import 'package:miaodi_web/data/callback.dart';
import 'package:miaodi_web/generated/l10n.dart';
import 'package:miaodi_web/utils/event_bus.dart';
import 'package:miaodi_web/utils/https_util.dart';
import 'package:miaodi_web/utils/ui_utils.dart';
import 'package:miaodi_web/viewModel/account_view_model.dart';
import 'package:miaodi_web/widget/tips_dialog.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _verifyController = TextEditingController();
  bool _secretNow = true;
  Icon _icon = Icon(Icons.remove_red_eye_outlined, size: 20);
  AccountViewModel _accountViewModel = AccountViewModel.getInstance();

  /// 是否可被点击
  bool _isClick = true;

  /// 倒计时
  Timer? _countdownTimer;

  /// 秒数
  int _seconds = 60;

  /// 按钮文字提示
  String _getCodeTips = "";

  @override
  void initState() {
    _getCodeTips = S.current.getVerifyCode;
    eventBus.on(EventName.registerState, (arg) async {
      if (mounted) {
        Navigator.pop(context); //关闭等待弹窗
        await TipsDialog.show(
            context,
            S.of(context).tips,
            (arg as CallBack).success == true
                ? S.of(context).registerSuccessfully
                : S.of(context).registerUnsuccessfully+","+S.of(context).reason+": ${(arg).message}");
        if ((arg).success == true) {
          await HttpsUtil.getResponse("http://localhost:10380/registerWinClose");
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: UiUtils.isDarkMode(context) ? darkMainColor : mainColor,
          title: Text(S.of(context).register),
          leading: const SizedBox(),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 150,
                  padding: EdgeInsets.only(top: 35, bottom: 12),
                  child: Center(
                    child: Image.asset(
                      "images/logo.png",
                      fit: BoxFit.fill,
                    ),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Container(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Column(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.only(left: 12, top: 20, right: 12),
                            child: TextField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_box_rounded,
                                    color: Colors.grey,
                                  ),
                                  hintText: S.of(context).username,
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                  ),
                                  suffix: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      _usernameController.text = '';
                                    },
                                  )),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: _secretNow,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.vpn_key_rounded,
                                    color: Colors.grey,
                                  ),
                                  hintText: S.of(context).password,
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                  ),
                                  suffix: IconButton(
                                    icon: _icon,
                                    onPressed: () {
                                      setState(() {
                                        _secretNow = !_secretNow;
                                        if (_secretNow) {
                                          _icon = Icon(
                                            Icons.remove_red_eye_outlined,
                                            size: 20,
                                          );
                                        } else {
                                          _icon = Icon(
                                            Icons.remove_red_eye,
                                            size: 20,
                                          );
                                        }
                                      });
                                    },
                                  )),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                  ),
                                  hintText: S.of(context).email,
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                  ),
                                  suffix: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      _emailController.text = '';
                                    },
                                  )),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 12, right: 12, bottom: 30),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _verifyController,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.qr_code,
                                          color: Colors.grey,
                                        ),
                                        hintText: S.of(context).verifyCode,
                                        hintStyle: TextStyle(
                                          fontSize: 18,
                                        ),
                                        suffix: IconButton(
                                          icon: Icon(
                                            Icons.close,
                                            size: 20,
                                          ),
                                          onPressed: () {
                                            _verifyController.text = '';
                                          },
                                        )),
                                  ),
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: 36,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        color: _isClick
                                            ? Colors.amber
                                            : Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                    child: Center(
                                      child: Text(
                                        _getCodeTips,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  onTap: () async {
                                    if (!_isClick) {
                                      return; //拦截
                                    }
                                    if (_emailController.text.isEmpty) {
                                      TipsDialog.show(context,
                                          S.of(context).tips, S.of(context).fillEmail);
                                      return;
                                    }
                                    _isClick = !_isClick;
                                    _countdownTimer = new Timer.periodic(
                                        new Duration(seconds: 1), (timer) {
                                      setState(() {
                                        if (_seconds > 0) {
                                          _seconds--;
                                          setState(() {
                                            print(_seconds);
                                            _getCodeTips = "${_seconds}s";
                                            print(_getCodeTips);
                                          });
                                        } else {
                                          // 重置
                                          _seconds = 60;
                                          _getCodeTips = S.of(context).getVerifyCode;
                                          _isClick = true;
                                          _countdownTimer!.cancel();
                                          _countdownTimer = null;
                                        }
                                      });
                                    });
                                    CallBack callback = await _accountViewModel
                                        .registerVerify(_emailController.text);
                                    TipsDialog.show(context, S.of(context).tips,
                                        "${callback.message!}");
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ))),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: InkWell(
                child: Container(
                  width: 200,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.amber),
                  child: Center(
                    child: Text(
                      S.of(context).register,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                onTap: () => {
                  if (_usernameController.text == "" ||
                      _passwordController.text == "" ||
                      _emailController.text == "" ||
                      _verifyController.text == "")
                    {
                      TipsDialog.show(
                          context, S.of(context).tips, S.of(context).canNotNull)
                    }
                  else
                    {
                      TipsDialog.wait(context, S.of(context).tips,
                          S.of(context).registering+", " + S.of(context).wait),
                      _accountViewModel.register(
                          _usernameController.text,
                          _passwordController.text,
                          _emailController.text,
                          _verifyController.text)
                    }
                },
              )),
            ],
          ),
        ));
  }
}
