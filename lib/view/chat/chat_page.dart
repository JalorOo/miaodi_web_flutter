import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widget/tips_dialog.dart';
import '../../common/style.dart';
import '../../data/chat_massage.dart';
import '../../utils/state_manager.dart';
import '../../utils/ui_utils.dart';
import '../../viewModel/chat_view_model.dart';
import '../ai_manage_page.dart';
import 'component/spread_widget.dart';

class ChatPage extends StatefulWidget {
  final String content;

  const ChatPage({Key? key, this.content = ""}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  FocusNode focusNode = FocusNode();

  ChatViewModel chatViewModel = ChatViewModel.getInstance();

  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initTips();
    _initSpeech();
  }

  _initTips() {
    if (this.widget.content.isNotEmpty) {
      chatViewModel.cleanAllHistory();
      chatViewModel.addPrompt("给你以下文本: \n ${widget.content}");
    }
    if (chatViewModel.messages.length == 0) {
      // 初始化
      chatViewModel.init("我是喵宝，请问有什么可以帮到您？");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  // SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  /// This has to happen only once per app
  void _initSpeech() async {
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    setState(() {});
  }

  Future<void> _handleSubmitted(String text) async {
    if (text.isEmpty) {
      TipsDialog.toast(context, "喵主，请输入内容！");
      return;
    }
    _textController.clear();
    chatViewModel.handleSubmitted(text);
  }

  Widget _buildSoundInput() {
    return Container(
      height: 300,
      child: Card(
          color: Colors.blue,
          elevation: 3,
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: SpreadWidget(
              radius: 100,
              maxRadius: 350,
              spreadColor: Colors.lightBlueAccent,
              cycles: 100,
              child: const Icon(Icons.keyboard_voice,
                  size: 56, color: Colors.white),
            ),
          )),
    );
  }

  bool _visible = false;

  Widget _buildTextComposer(bool isThinking) {
    if (isThinking) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: UiUtils.isDarkMode(context) ? darkItemColor : lightItemColor,
          border: Border(
            top: BorderSide(
                color: UiUtils.isDarkMode(context)
                    ? darkItemColor
                    : Colors.grey.shade300),
          ),
        ),
        child: GestureDetector(
          onTap: () => {chatViewModel.stopThinking()},
          child: Container(
            height: 46,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.red,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "思考中，点击可打断",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 16,
                ),
                Icon(
                  Icons.pause_circle,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: UiUtils.isDarkMode(context) ? darkItemColor : lightItemColor,
        border: Border(
          top: BorderSide(
              color: UiUtils.isDarkMode(context)
                  ? darkItemColor
                  : Colors.grey.shade300),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              focusNode.hasFocus
                  ? IconButton(
                      icon: Icon(Icons.keyboard_hide_rounded),
                      onPressed: () {
                        focusNode.unfocus();
                      },
                    )
                  : SizedBox(),
              Expanded(
                child: _visible
                    ? SizedBox()
                    : Container(
                        height: 36,
                        child: CupertinoTextField(
                          textInputAction: TextInputAction.send,
                          style: TextStyle(
                              color: UiUtils.isDarkMode(context)
                                  ? Colors.white
                                  : Colors.black),
                          focusNode: focusNode,
                          maxLines: 2,
                          minLines: 1,
                          controller: _textController,
                          placeholder: '请输入消息',
                          onSubmitted: _handleSubmitted,
                        ),
                      ),
              ),
              CupertinoButton(
                child: Text('发送'),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ],
          ),
          Visibility(visible: _visible, child: _buildSoundInput())
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        elevation: 0,
        backgroundColor:
            UiUtils.isDarkMode(context) ? darkItemColor : lightItemColor,
        title: Text(
          "喵宝助手",
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AiManagePage();
                }));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: ChangeNotifierProvider<ChatViewModel>(
        data: chatViewModel,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                // Wrap CustomScrollView with Expanded
                child: CustomScrollView(
                  reverse: true,
                  slivers: [
                    SliverToBoxAdapter(
                      // Wrap conditional button with SliverToBoxAdapter
                      child: Consumer<ChatViewModel>(
                        builder: (ctx, c) {
                          if (c.messages.length > 1 && !c.isThinking) {
                            return _cleanHistoryButton();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      // Wrap conditional button with SliverToBoxAdapter
                      child: Consumer<ChatViewModel>(
                        builder: (ctx, c) {
                          if (c.messages.length > 2 && !c.isThinking) {
                            return _copyButton();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ),
                    Consumer<ChatViewModel>(
                      builder: (ctx, c) {
                        return SliverList(
                          // Replace ListView.builder with SliverList
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return _messageItem(c.messages[index]);
                            },
                            childCount: c.messages.length,
                          ),
                        );
                      },
                    ),
                    SliverToBoxAdapter(
                        // Wrap Text with SliverToBoxAdapter
                        child: widget.content.isNotEmpty
                            ? Container(
                                margin: EdgeInsets.all(contentMargin),
                                child: Text("选择的文本：${widget.content}",
                                    style: TextStyle(color: Colors.grey)),
                              )
                            : SizedBox()),
                  ],
                ),
              ),
              Consumer<ChatViewModel>(
                builder: (ctx, c) {
                  return _buildTextComposer(c.isThinking);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cleanHistoryButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          chatViewModel.cleanAllHistory();
          _initTips();
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 16, top: 8),
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          width: 120,
          height: 32,
          child: Center(child: Text("清空对话历史")),
        ),
      ),
    );
  }

  Widget _messageItem(ChatMessage message) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: message.isMe
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '我',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 12, right: 12),
                        margin:
                            EdgeInsets.only(top: 5.0, left: contentMargin + 36),
                        child: SelectableText(
                          message.text,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 36,
                  margin: EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text("😊"),
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  margin: EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    backgroundImage: message.isMe
                        ? NetworkImage('https://picsum.photos/id/1027/200/200')
                        : NetworkImage(
                            'https://libv.miaodiapp.com/static/ic.png',
                            scale: 1),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        message.isMe ? '我' : '喵宝',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 12, right: 12),
                        margin: EdgeInsets.only(
                            top: 5.0, right: contentMargin + 36),
                        child: SelectableText(
                          message.text,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _copyButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Clipboard.setData(
              ClipboardData(text: chatViewModel.messages.first.text));
          TipsDialog.toast(context, "已经复制到你的剪贴板中");
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 8, top: 8),
          decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          width: 120,
          height: 32,
          child: Center(child: Text("复制")),
        ),
      ),
    );
  }
}
