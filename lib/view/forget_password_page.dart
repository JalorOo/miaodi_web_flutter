import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miaodi_web/data/callback.dart';
import 'package:miaodi_web/utils/https_util.dart';
import 'package:miaodi_web/utils/ui_utils.dart';
import 'package:miaodi_web/viewModel/account_view_model.dart';
import 'package:miaodi_web/widget/tips_dialog.dart';

import '../../common/style.dart';
import '../../generated/l10n.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  AccountViewModel _accountViewModel = AccountViewModel.getInstance();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _verifyController = TextEditingController();
  TextEditingController _secretController = TextEditingController();
  TextEditingController _secretVerifyController = TextEditingController();

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).passwordReset),
        backgroundColor: UiUtils.isDarkMode(context)? Colors.black12 : mainColor,
        elevation: 0,
        leading: const SizedBox(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _imageWidget(),
            _formWidget(),
            _verifyWidget(),
          ],
        ),
      ),
    );
  }

  Widget _imageWidget() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5 > 300
              ? 300
              : MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.width * 0.5 > 300
              ? 300
              : MediaQuery.of(context).size.width * 0.5,
          child: SvgPicture.asset(
            "images/forget_password.svg",
          ),
        ),
      ),
    );
  }

  var _obscureText = true;

  Widget _formWidget() {
    return Container(
      margin: EdgeInsets.all(contentMargin),
      padding: EdgeInsets.all(contentMargin),
      decoration: BoxDecoration(
        color: UiUtils.isDarkMode(context) ? Colors.black38 : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: contentMargin, right: contentMargin),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  hintText: S.of(context).email,
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
            margin: EdgeInsets.only(left: contentMargin, right: contentMargin),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _verifyController,
                    decoration: InputDecoration(
                        icon: Icon(
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
                        color: _isClick ? Colors.amber : Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
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
                      TipsDialog.show(
                          context, S.of(context).tips, S.of(context).fillEmail);
                      return;
                    }
                    _isClick = !_isClick;
                    _countdownTimer =
                        new Timer.periodic(new Duration(seconds: 1), (timer) {
                      setState(() {
                        if (_seconds > 0) {
                          _seconds--;
                          setState(() {
                            _getCodeTips = "${_seconds}s";
                          });
                        } else {
                          // 重置
                          _seconds = 60;
                          _getCodeTips = S.current.getVerifyCode;
                          _isClick = true;
                          _countdownTimer!.cancel();
                          _countdownTimer = null;
                        }
                      });
                    });
                    CallBack callback = await _accountViewModel
                        .forgetPasswordGetEmailVerify(_emailController.text);
                    TipsDialog.show(
                        context, S.of(context).tips, "${callback.message!}");
                  },
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: contentMargin, right: contentMargin),
            child: TextField(
              controller: _secretController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.password,
                    color: Colors.grey,
                  ),
                  hintText: S.of(context).password,
                  suffix: IconButton(
                    icon: Icon(
                      _obscureText == false
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: contentMargin, right: contentMargin),
            child: TextField(
              controller: _secretVerifyController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.password,
                    color: Colors.grey,
                  ),
                  hintText: S.of(context).passwordConfirmed,
                  suffix: IconButton(
                    icon: Icon(
                      _obscureText == false
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _verifyWidget() {
    return Container(
      //登录的按钮
      margin: EdgeInsets.only(
          left: 30, right: 30, top: contentMargin, bottom: contentMargin * 2),
      height: 48,
      width: 200,
      child: TextButton(
        onPressed: () async {
          if (_secretController.text == "" ||
              _secretVerifyController.text == "" ||
              _emailController.text == "" ||
              _verifyController.text == "") {
            TipsDialog.show(
                context, S.of(context).tips, S.of(context).canNotNull);
          } else if (_secretController.text != _secretVerifyController.text) {
            TipsDialog.show(context, S.of(context).tips,
                S.of(context).checkTwoPasswordAgain);
          } else {
            TipsDialog.wait(
                context, S.of(context).tips, S.of(context).resetting);
            CallBack callback =
                await _accountViewModel.verifyNewPasswordByForgot(
                    _emailController.text,
                    _verifyController.text,
                    _secretVerifyController.text);
            Navigator.pop(context);
            await TipsDialog.show(
                context, S.of(context).tips, "${callback.message!}");
            if (callback.success!) {
              await HttpsUtil.getResponse("http://localhost:10380/forgetWinClose");
            }
          }
        },
        child: Text(S.of(context).reset),
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          backgroundColor: Colors.orange,
        ),
      ),
    );
  }
}
