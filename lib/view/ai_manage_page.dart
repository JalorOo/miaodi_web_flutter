import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../common/constant.dart';
import '../../common/style.dart';
import '../../data/user.dart';
import '../../generated/l10n.dart';
import '../../utils/ui_utils.dart';
import '../../widget/tips_dialog.dart';

import '../../common/config.dart';
import '../../viewModel/chat_view_model.dart';
import 'ai_api_manage_page.dart';

class AiManagePage extends StatefulWidget {
  const AiManagePage({Key? key}) : super(key: key);

  @override
  _AiManagePageState createState() => _AiManagePageState();
}

class _AiManagePageState extends State<AiManagePage> {
  TextEditingController _modelName = TextEditingController();

  bool _isUseAI = false;

  String _originModelName = "";

  ChatViewModel _viewModel = ChatViewModel.getInstance();

  List<Map> _modelList = [];

  @override
  void initState() {
    getUserInfo();
    _modelName.addListener(() {
      if (_modelName.text != _originModelName) {
        _isUseAI = false;
        setState(() {});
      }
    });
    _viewModel.getModelList().then((list) => {
          list.forEach((element) {
            _modelList.add({
              'name': element['name'],
              'model': element['model'],
            });
          })
        });
    super.initState();
  }

  void showModelSelectDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('选择模型'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _modelList.map((data) {
              return SizedBox(
                height: 56,
                child: ListTile(
                  title: Text(data['name']),
                  subtitle: Text(data['model']),
                  onTap: () {
                    // Handle selection
                    _modelName.text = data["model"];
                    Navigator.of(context).pop();
                  },
                  trailing: _modelName.text == data["model"]
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                ),
              );
            }).toList(),
          ),
          actions: <Widget>[
            new TextButton(
              child: new Text(S.of(context).cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AiApiManagePage();
              }));
            },
            icon: Icon(Icons.handyman),
            tooltip: "自定义",
          )
        ],
        elevation: 0,
        backgroundColor:
            UiUtils.isDarkMode(context) ? darkItemColor : lightItemColor,
        title: Text(
          "喵宝助手设置",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.7 > 200
                ? 200
                : MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.7 > 200
                ? 200
                : MediaQuery.of(context).size.width * 0.7,
            child: SvgPicture.asset(
              "images/chat_bot.svg",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text("模型选择"),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              autofocus: false,
              controller: _modelName,
              decoration: InputDecoration(
                hintText: "miaodiapp",
                prefixIcon: Icon(
                  Icons.device_unknown,
                  color: Colors.amber,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    showModelSelectDialog();
                  },
                  icon: Icon(Icons.arrow_drop_down),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 25, left: 16, right: 16),
              child: GestureDetector(
                onTap: () => _changeState(),
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _isUseAI ? Colors.red : Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    child: Center(
                      child: Text(
                        _isUseAI ? "取消使用" : "申请",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: Text(
                "可申请体验喵宝助手，模型可选：qwen-turbo、ERNIE-Bot-4、miaodiapp等, 具体模型支持可加喵滴Q群了解。不填默认miaodiapp。\n请勿使用喵宝做违法犯罪事情，一经发现将直接禁止使用喵宝等喵滴服务。情节严重将报送公安机关。",
                style: tipsStyle),
          ),
        ],
      ),
    );
  }

  _changeState() async {
    User user = await User.getInstance();
    if (_isUseAI) {
      user.aiKey = "";
      user.aiUrl = "";
      user.aiModelName = "";
      Navigator.pop(context);
      TipsDialog.toast(context, "取消使用成功，欢迎下次再来！");
    } else {
      user.aiKey = "";
      user.aiUrl = ipIn + Constant.miaodiAI;
      // if (_modelName.text.isNotEmpty) {
      user.aiModelName = _modelName.text;
      // }else{
      //   user.aiModelName = "gpt-3.5-turbo";
      // }
      Navigator.pop(context);
      TipsDialog.toast(context, "申请成功，快去试一试喵宝吧！");
    }
  }

  Future<void> getUserInfo() async {
    User user = await User.getInstance();
    _modelName.text = user.aiModelName;
    _originModelName = user.aiModelName;
    if (user.aiUrl.isNotEmpty) {
      _isUseAI = true;
      setState(() {});
    }
  }
}
