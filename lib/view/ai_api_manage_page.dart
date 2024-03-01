import 'package:flutter/material.dart';
import '../../common/constant.dart';
import '../../common/style.dart';
import '../../data/user.dart';
import '../../generated/l10n.dart';
import '../../utils/ui_utils.dart';
import '../../widget/tips_dialog.dart';

class AiApiManagePage extends StatefulWidget {
  const AiApiManagePage({Key? key}) : super(key: key);

  @override
  _AiApiManagePageState createState() => _AiApiManagePageState();
}

class _AiApiManagePageState extends State<AiApiManagePage> {
  TextEditingController _token = TextEditingController();
  TextEditingController _url = TextEditingController();
  TextEditingController _modelName = TextEditingController();

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            UiUtils.isDarkMode(context) ? darkItemColor : lightItemColor,
        title: Text(
          "喵宝助手API设置",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Theme(
              data: Theme.of(context).copyWith(
                  hintColor: Colors.grey, //定义下划线颜色
                  inputDecorationTheme: InputDecorationTheme(
                      //labelStyle: TextStyle(color: Colors.grey),
                      hintStyle: TextStyle(color: Colors.grey))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 20),
                      child: Text("Key"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: TextField(
                        autofocus: true,
                        controller: _token,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "sk-xxxxx",
                          prefixIcon: Icon(
                            Icons.vpn_key_rounded,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 20),
                      child: Text("服务器地址"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: TextField(
                        autofocus: true,
                        controller: _url,
                        decoration: InputDecoration(
                          hintText: "https://api.chatanywhere.tech/v1/chat/completions",
                          prefixIcon: Icon(
                            Icons.all_inclusive,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 16, right: 16, top: 20),
                      child: Text("模型选择"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: TextField(
                        autofocus: true,
                        controller: _modelName,
                        decoration: InputDecoration(
                          hintText: "miaodiapp",
                          prefixIcon: Icon(
                            Icons.device_thermostat_sharp,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 25, left: 16, right: 16),
                        child: GestureDetector(
                          onTap: () => save(),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                              ),
                              child: Center(
                                child: Text(
                                  S.of(context).saveSettings,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 20),
                      child: Text("Key为必填项目，服务器地址与模型选择可选填\n\n服务器地址默认为 https://api.chatanywhere.tech/v1/chat/completions\n\n模型默认为 miaodiapp", style: tipsStyle),
                    ),
                  ]))
        ],
      ),
    );
  }

  save() async {
    print("保存了");
    TipsDialog.toast(context, S.of(context).saveSuccessfully);
    String url = _url.text;
    if (url.isEmpty) {
      url = Constant.aiApiUrl;
    }
    User user = await User.getInstance();
    if (_modelName.text.isNotEmpty) {
      user.aiModelName = _modelName.text;
    }
    user.aiKey = _token.text;
    user.aiUrl = url;
  }

  Future<void> getUserInfo() async {
    User user = await User.getInstance();
    _token.text = user.aiKey;
    if (!user.aiUrl.contains("libv"))
      _url.text = user.aiUrl;
  }
}
