import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miaodi_web/common/style.dart';
import 'package:miaodi_web/data/callback.dart';
import 'package:miaodi_web/data/cloud_passage.dart';
import 'package:miaodi_web/generated/l10n.dart';
import 'package:miaodi_web/utils/ui_utils.dart';
import 'package:miaodi_web/viewModel/passage_view_model.dart';
import 'package:miaodi_web/widget/tips_dialog.dart';

import '../../widget/input_bottom_sheet.dart';
import 'cloud_history_page.dart';

class CloudPassagePage extends StatefulWidget {
  CloudPassage cloudPassage;

  CloudPassagePage({Key? key, required this.cloudPassage}) : super(key: key);

  @override
  _CloudPassagePageState createState() => _CloudPassagePageState();
}

class _CloudPassagePageState extends State<CloudPassagePage> {
  PassageViewModel _passageViewModel = PassageViewModel.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            UiUtils.isDarkMode(context) ? darkItemColor : lightItemColor,
        iconTheme: IconThemeData(
            color: UiUtils.isDarkMode(context) ? Colors.white : Colors.black),
        title:
            Text(S.of(context).cloudPassageTitle(widget.cloudPassage.title!)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CloudHistoryPage(id: widget.cloudPassage.id);
                }));
              },
              icon: Icon(Icons.history))
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16, left: 10, right: 10, bottom: 10),
        child: SelectableText(widget.cloudPassage.content!),
      ),
      floatingActionButton: Container(
        width: 120,
        height: 42,
        child: TextButton(
          onPressed: () async {
            if (widget.cloudPassage.share == 0) {
              TipsDialog.showByChoose(
                  context,
                  S.of(context).tips,
                  S.of(context).shareTips,
                  S.of(context).sure,
                  S.of(context).cancel, (result) async {
                Navigator.pop(context);// 关闭选择窗口
                if (result) {
                  TextEditingController controller = TextEditingController();
                  InputBottomSheet.oneInput(
                      context, controller, FocusNode(), "设置访问密码", "若密码为空则不设置密码",
                      () async {
                    TipsDialog.wait(
                        context, S.of(context).wait, S.of(context).sharing);
                    CallBack callBack = await _passageViewModel
                        .shareCloudPassage(widget.cloudPassage,
                            password: controller.text);
                    Navigator.pop(context);//
                    Navigator.pop(context);
                    Clipboard.setData(ClipboardData(text: callBack.message));
                    TipsDialog.toast(context, S.of(context).shareSuccessfully);
                  });
                }
              });
            } else if (widget.cloudPassage.share == 1) {
              TipsDialog.showByChoose(
                  context,
                  S.of(context).tips,
                  S.of(context).unShareTips,
                  S.of(context).sure,
                  S.of(context).cancel, (result) async {
                Navigator.pop(context);
                if (result) {
                  TipsDialog.wait(
                      context, S.of(context).wait, S.of(context).unSharing);
                  CallBack callBack = await _passageViewModel
                      .unShareCloudPassage(widget.cloudPassage);
                  Navigator.pop(context);
                  TipsDialog.toast(context, callBack.message!);
                }
              });
            }
          },
          child: Text(
              widget.cloudPassage.share == 0
                  ? S.of(context).share
                  : S.of(context).unShare,
              style: TextStyle(fontWeight: FontWeight.bold)),
          style: TextButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            backgroundColor: Colors.blue,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
