import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/style.dart';
import '../../utils/ui_utils.dart';
import '../../widget/tips_dialog.dart';

class PassageVersionPage extends StatefulWidget {
  final id, title, content, time;

  const PassageVersionPage({
    Key? key,
    this.id,
    this.title,
    this.time,
    this.content,
  }) : super(key: key);

  @override
  _PassageVersionPageState createState() => _PassageVersionPageState();
}

class _PassageVersionPageState extends State<PassageVersionPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            UiUtils.isDarkMode(context) ? Colors.black12 : lightItemColor,
        title: Text(
          widget.title,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "过期时间: ${widget.time.toString()}",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SelectableText(widget.content),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 120,
        height: 42,
        child: TextButton(
          onPressed: () async {
            Clipboard.setData(ClipboardData(text: widget.content));
            TipsDialog.toast(context, "内容已复制到剪贴板中");
          },
          child: Text("复制全文"),
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
