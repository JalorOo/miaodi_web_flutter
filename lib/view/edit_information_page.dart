import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaodi_web/common/style.dart';
import 'package:miaodi_web/data/callback.dart';
import 'package:miaodi_web/data/user.dart';
import 'package:miaodi_web/generated/l10n.dart';
import 'package:miaodi_web/utils/ui_utils.dart';
import 'package:miaodi_web/viewModel/account_view_model.dart';
import 'package:miaodi_web/widget/input_bottom_sheet.dart';
import 'package:miaodi_web/widget/settings_item.dart';
import 'package:miaodi_web/widget/tips_dialog.dart';

class EditInformationPage extends StatefulWidget {
  final User user;

  EditInformationPage({Key? key, required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EditInformationPageState();
  }
}

class _EditInformationPageState extends State<EditInformationPage> {
  late User _user;

  AccountViewModel _accountViewModel = AccountViewModel.getInstance();

  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _verifyController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: UiUtils.isDarkMode(context) ? darkMainColor : mainColor,
        foregroundColor: UiUtils.isDarkMode(context) ? Colors.white : Colors.black,
        title: Text("修改个人信息"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 16,
          ),
          SettingsItem(
            leading: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            title: Text(S.of(context).username),
            trailing: Icon(Icons.keyboard_arrow_right),
            subtitle:
                Text(_user == null ? S.of(context).loading : _user.username),
            onTap: () async {
              _controller.text = "";
              _focusNode.requestFocus();
              InputBottomSheet.oneInput(
                  context,
                  _controller,
                  _focusNode,
                  S.of(context).changeUsername,
                  S.of(context).inputNewUsername, () async {
                if (_controller.text.isNotEmpty) {
                  Navigator.pop(context);
                  TipsDialog.wait(
                      context, S.of(context).wait, S.of(context).changing);
                  CallBack callback =
                      await _accountViewModel.updateUsername(_controller.text);
                  Navigator.pop(context);
                  if (callback.success!) {
                    setState(() {});
                    TipsDialog.toast(context, callback.message!);
                  } else {
                    TipsDialog.show(
                        context, S.of(context).error, callback.message!);
                  }
                }
              });
            },
          ),
          SettingsItem(
            leading: Icon(Icons.email, color: Colors.amber),
            title: Text(S.of(context).email),
            trailing: Icon(Icons.keyboard_arrow_right),
            subtitle:
                Text(_user == null ? S.of(context).loading : _user.email),
            onTap: () async {
              _controller.text = "";
              _verifyController.text = "";
              _focusNode.requestFocus();
              InputBottomSheet.oneInputAndOneVerification(
                  context,
                  _verifyController,
                  _controller,
                  _focusNode,
                  S.of(context).changeEmail,
                  S.of(context).inputVerifyCode,
                  S.of(context).inputNewEmail, () async {
                TipsDialog.wait(context, S.of(context).wait,
                    S.of(context).verifyCodeApplication);
                CallBack callback = await _accountViewModel.verifyUserByEmail();
                Navigator.pop(context);
                TipsDialog.show(
                    context, S.of(context).tips, "${callback.message!}");
              }, () async {
                if (_controller.text.isNotEmpty) {
                  Navigator.pop(context);
                  TipsDialog.wait(
                      context, S.of(context).wait, S.of(context).changing);
                  CallBack callback = await _accountViewModel.updateEmail(
                      _controller.text, _verifyController.text);
                  Navigator.pop(context);
                  if (callback.success!) {
                    setState(() {});
                    TipsDialog.toast(context, callback.message!);
                  } else {
                    TipsDialog.show(
                        context, S.of(context).error, callback.message!);
                  }
                }
              });
            },
          ),
          SettingsItem(
            leading: Icon(
              Icons.remove_red_eye_sharp,
              color: Colors.green,
            ),
            title: Text(S.of(context).password),
            trailing: Icon(Icons.keyboard_arrow_right),
            subtitle: Text("********"),
            onTap: () async {
              _controller.text = "";
              _controller2.text = "";
              _controller3.text = "";
              _focusNode.requestFocus();
              InputBottomSheet.threeInput(
                  context,
                  _controller,
                  _controller2,
                  _controller3,
                  _focusNode,
                  S.of(context).changePassword,
                  S.of(context).inputOldPassword,
                  S.of(context).inputNewPassword,
                  S.of(context).inputNewPasswordAgain,
                  true, () async {
                if (_controller.text.isNotEmpty &&
                    _controller2.text.isNotEmpty &&
                    _controller3.text.isNotEmpty) {
                  if (_controller3.text == _controller2.text) {
                    Navigator.pop(context);
                    TipsDialog.wait(
                        context, S.of(context).wait, S.of(context).changing);
                    CallBack callback = await _accountViewModel.updatePassword(
                        _controller.text, _controller2.text);
                    Navigator.pop(context);
                    if (callback.success!) {
                      setState(() {});
                      TipsDialog.toast(context, callback.message!);
                    } else {
                      TipsDialog.show(
                          context, S.of(context).error, callback.message!);
                    }
                  } else {
                    TipsDialog.show(context, S.of(context).error,
                        S.of(context).checkTwoPasswordAgain);
                  }
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
