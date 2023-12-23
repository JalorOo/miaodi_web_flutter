import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:miaodi_web/common/style.dart';
import 'package:miaodi_web/data/callback.dart';
import 'package:miaodi_web/data/user.dart';
import 'package:miaodi_web/generated/l10n.dart';
import 'package:miaodi_web/view/cloud/cloud_services_page.dart';
import 'package:miaodi_web/view/edit_information_page.dart';
import 'package:miaodi_web/utils/time_utils.dart';
import 'package:miaodi_web/utils/ui_utils.dart';
import 'package:miaodi_web/viewModel/account_view_model.dart';
import 'package:miaodi_web/viewModel/passage_view_model.dart';
import 'package:miaodi_web/widget/input_bottom_sheet.dart';
import 'package:miaodi_web/widget/settings_item.dart';
import 'package:miaodi_web/widget/tips_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import 'assets_page.dart';

class AccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AccountPageState();
  }
}

class _AccountPageState extends State<AccountPage> {
  bool _currentState1 = false;
  bool _currentState2 = false;
  bool _currentState3 = false;
  bool _currentState4 = false;
  bool chooseClipBoard = false;
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _verifyController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  AccountViewModel _accountViewModel = AccountViewModel.getInstance();
  PassageViewModel _passageViewModel = PassageViewModel.getInstance();
  User? _user;

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: UiUtils.isDarkMode(context)
                ? [Color(0xff665866), Color(0xff3f484c)]
                : [Color(0xfff5e8f5), Color(0xffe2edf5)]), //背景渐变
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   systemOverlayStyle: UiUtils.isDarkMode(context)
        //       ? SystemUiOverlayStyle.light
        //       : SystemUiOverlayStyle.dark,
        //   centerTitle: true,
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   title: Text(
        //     S.of(context).account,
        //   ),
        // ),
        body: LayoutBuilder(
          builder: (_, constraints) {
            // 根据不同的屏幕进行适配
            print(constraints.maxHeight);
            // 大屏幕，则使用Expanded
            if (constraints.maxHeight > 600) {
              return Column(
                children: <Widget>[
                  _userHeader(),
                  // 用户个别数据
                  _userData(),
                  // VIP卡片
                  _vipCard(),
                  // 其他信息
                  Expanded(
                    child: _otherInfo(),
                  ),
                  // ListTile(
                  //   leading: SizedBox(),
                  //   title: Text("生成邀请-激活码"),
                  //   subtitle: Text("2V3fw1629604677353"),
                  //   onTap: () {},
                  // ),
                ],
              );
            } else {
              // 小屏幕，则使用ScrollView
              return SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    _userHeader(),
                    // 用户个别数据
                    _userData(),
                    // VIP卡片
                    _vipCard(),
                    // 其他信息
                    _otherInfo(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  int _passagesCount = 0;

  Future<void> _getUserInfo() async {
    _user = await User.getInstance();
    _passagesCount = await _passageViewModel.queryPassage();
    setState(() {});
    // 若激活成功，则弹出说明一下
    CallBack callBack = await _accountViewModel.syncUserInfo();
    if (callBack.success!) {
      TipsDialog.show(context, "激活", callBack.message!);
    }
    setState(() {});
  }

  unSupportItem() {
    ListView(
      children: [
        Divider(
          height: 2,
        ),
        Padding(
          padding: EdgeInsets.only(left: 68, top: 20, bottom: 6),
          child: Text(
            S.of(context).seniorMemberServices,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 13,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.wb_cloudy_rounded,
            color: Colors.indigoAccent,
          ),
          title: Text("拉取文章备份"),
          subtitle: Text("从云端设定的云端拉取数据"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.refresh,
            color: Colors.lightGreen,
          ),
          title: Text("自动从云拉取"),
          subtitle: Text("及时同步云端到本地。默认使用喵滴的云服务。若启动了WebDav,则使用WebDav"),
          trailing: Switch(
            activeColor: Colors.orange,
            value: _currentState1,
            onChanged: (bool value) {
              setState(() {
                _currentState1 = !_currentState1;
              });
              if (_currentState1 == true) {
              } else {}
            },
          ),
        ),
        ListTile(
          leading: SizedBox(),
          title: Text("拉取Todo备份"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.event,
            color: Colors.grey,
          ),
          title: Text("剪贴板记录"),
          subtitle: Text("开启后,App可读取剪贴板进行文本导入"),
          trailing: Switch(
            activeColor: Colors.orange,
            value: _currentState2,
            onChanged: (bool value) {
              setState(() {
                _currentState2 = !_currentState2;
              });
              if (_currentState2 == true) {
                chooseClipBoard = true;
              } else {
                chooseClipBoard = false;
              }
            },
          ),
        ),
        ListTile(
          leading: SizedBox(),
          title: Text(
            "剪贴板导入询问",
            style: TextStyle(
              color: chooseClipBoard ? Colors.black : Colors.grey,
            ),
          ),
          subtitle: Text(
            "开启后,每次从剪贴板导入期间会进行询问",
            style: TextStyle(
              color: chooseClipBoard ? Colors.black : Colors.grey,
            ),
          ),
          trailing: Switch(
            activeColor: Colors.orange,
            value: _currentState3,
            onChanged: (bool value) {
              setState(() {
                _currentState3 = !_currentState3;
              });
              if (_currentState3 == true) {
              } else {}
            },
          ),
        ),
        ListTile(
          leading: Icon(Icons.home, color: Colors.red),
          title: Text("通知栏快捷记录"),
          subtitle: Text("开启后每次App打开将在通知栏创建一条通知用于快速记录灵感"),
          trailing: Switch(
            activeColor: Colors.orange,
            value: _currentState4,
            onChanged: (bool value) {
              setState(() {
                _currentState4 = !_currentState4;
              });
              if (_currentState4 == true) {
              } else {}
            },
          ),
        ),
      ],
    );
  }

  Widget _userInfoDataItem({required String data, required String name}) {
    return Container(
      //color: Colors.amber,
      height: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(name, style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  _serviceItem({required Icon leading, required Text title}) {
    return Container(
      margin: EdgeInsets.only(right: 50),
      child: Column(
        children: [leading, title],
      ),
    );
  }

  _userHeader() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 80,
      // color: Colors.red,
      child: Row(
        children: [
          Expanded(
            child: Container(
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _user == null ? S.of(context).loading : _user!.username,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _user == null
                        ? S.of(context).loading
                        : _user!.vip
                            ? S.of(context).membership
                            : S.of(context).needActivate,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return EditInformationPage(user: _user!);
              }));
            },
            child: Container(
              width: 80,
              // color: Colors.purple,
              child: Stack(
                children: [
                  CircleAvatar(
                    //foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    radius: 80,
                    child: Image.asset('images/logo.png'),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            border: Border.all(color: Colors.white)),
                        width: 20,
                        height: 20,
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 12,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _userData() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      //color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return AssetsPage();
              }));
            },
            child: _userInfoDataItem(
                data: _user == null
                    ? S.of(context).loading
                    : (_user!.assets).toString(),
                name: S.of(context).assets),
          ),
          _userInfoDataItem(
              data: "$_passagesCount", name: S.of(context).passageNum),
          _userInfoDataItem(
              data: _user == null
                  ? S.of(context).loading
                  : "${TimeUtils.calculate(_user!.createTime, TimeUtils.getNowTime10C())}",
              name: S.of(context).usedDays),
          SizedBox(
            width: 80,
          )
        ],
      ),
    );
  }

  _vipCard() {
    return GestureDetector(
      onTap: () async {
        // if (_user == null || !_user!.vip || _user!.expiredTime != "") {
        //   var result = await Navigator.push(context,
        //       MaterialPageRoute(builder: (context) {
        //     return PayPage();
        //   }));
        //   if (result != null && result == 1) {
        //     setState(() {});
        //   }
        // } else {
        //   // 永久会员打开网页
        // }
        CallBack s = await _accountViewModel.getPayLink();
        if (!s.success!) {
          TipsDialog.show(context, "出错了", s.message!);
        } else {
          launch(s.data!["url"]);
        }
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 26, 20, 0),
        padding: EdgeInsets.only(left: 16, right: 16),
        height: 70,
        decoration: BoxDecoration(
            color: Color(0xff282D41),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            )),
        child: Row(
          children: [
            // 左边的信息
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "VIP",
                      style: TextStyle(color: Colors.amber, fontSize: 20),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      _user == null
                          ? S.of(context).loading
                          : _user!.vip
                              ? _user!.expiredTime == ""
                                  ? S.of(context).foreverMembership
                                  : S.of(context).activated(_user!.expiredTime)
                              : S.of(context).aboutMembership,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            // 激活按钮
            Container(
              padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
              decoration: BoxDecoration(
                  color:
                      _user == null || !_user!.vip || _user!.expiredTime != ""
                          ? thirdColor
                          : Colors.orange,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  )),
              child: Text(
                _user == null
                    ? S.of(context).loading
                    : _user!.vip
                        ? _user!.expiredTime == ""
                            ? S.of(context).myPrivilege
                            : S.of(context).continueVIP
                        : S.of(context).purchase,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _otherInfo() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: UiUtils.isDarkMode(context) ? Colors.black54 : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.credit_card,
            ),
            title: Text(S.of(context).accountId),
            trailing: Text(
              _user == null ? S.of(context).loading : _user!.objectId,
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {},
          ),
          Container(
              margin: EdgeInsets.only(left: 16, right: 16), child: Divider()),
          ListTile(
            leading: Icon(
              Icons.list,
            ),
            title: Text(S.of(context).level),
            trailing: Text(
              _user == null
                  ? S.of(context).loading
                  : (_user!.wordCount ~/ 1000).toString(),
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {},
          ),
          Container(
            margin: EdgeInsets.only(left: 16, top: 30, bottom: 30),
            child: Text(
              S.of(context).moreService,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CloudServicesPage();
                    }));
                  },
                  child: _serviceItem(
                      leading: Icon(
                        Icons.cloud,
                        color: Colors.grey,
                      ),
                      title: Text(
                        S.of(context).cloudService,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    launch('https://libv.miaodiapp.com/');
                  },
                  child: _serviceItem(
                    leading: Icon(
                      Icons.screen_search_desktop_rounded,
                      color: Colors.grey,
                    ),
                    title: Text(S.of(context).platformSupport,
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    launch('https://miaodiapp.com/');
                  },
                  child: _serviceItem(
                    leading: Icon(
                      Icons.help,
                      color: Colors.grey,
                    ),
                    title: Text(S.of(context).help,
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            //购买的按钮
            margin: EdgeInsets.only(top: 20, left: 16, right: 16),
            width: double.infinity,
            height: 48,
            child: TextButton(
              onPressed: () async {
                await _accountViewModel.exit();
              },
              child: Text(S.of(context).logout),
              style: TextButton.styleFrom(
                primary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 0.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                backgroundColor: Colors.orange,
              ),
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  _controller.text = "";
                  _focusNode.requestFocus();
                  InputBottomSheet.oneInput(
                      context,
                      _controller,
                      _focusNode,
                      S.of(context).accountDelete,
                      S.of(context).logoutWarning, () async {
                    if (_controller.text.isNotEmpty) {
                      Navigator.pop(context);
                      TipsDialog.wait(context, S.of(context).wait,
                          S.of(context).loggingOut);
                      CallBack callback = await _accountViewModel
                          .deleteAccount(_controller.text);
                      Navigator.pop(context);
                      if (callback.success!) {
                        TipsDialog.toast(context, callback.message!);
                      } else {
                        TipsDialog.show(
                            context, S.of(context).error, callback.message!);
                      }
                    }
                  }, obscureText: true);
                },
                child: Text(S.of(context).accountDelete,
                    style: TextStyle(color: Colors.blue))),
          ))
        ],
      ),
    );
  }
}
