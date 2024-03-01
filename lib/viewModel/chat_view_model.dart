import 'package:flutter/material.dart';
import '../../common/constant.dart';
import '../../model/chat_model.dart';

import '../common/config.dart';
import '../data/chat_massage.dart';
import '../data/user.dart';
import '../utils/https_util.dart';

class ChatViewModel extends ChangeNotifier {
  final List<ChatMessage> _messages = [];
  bool _isThinking = false;
  bool _isTipsShowing = false;
  String _prompt = "";

  bool get isThinking => _isThinking;

  List<ChatMessage> get messages => _messages;

  ChatViewModel._internal() {
    // 构造方法中初始化流相关的对象
  }

  static ChatViewModel? _viewModel;

  static ChatViewModel getInstance() {
    _viewModel ??= ChatViewModel._internal();
    return _viewModel!;
  }

  addPrompt(String prompt) {
    _prompt = prompt;
    print(_prompt);
  }

  init(String s) {
    _messages.add(ChatMessage(
      text: s,
      isMe: false,
    ));
    notifyListeners();
  }

  _thinking(bool isThink) {
    if (isThink) {
      addAnswer("喵宝思考中ing🤔️");
      _isTipsShowing = true;
      _isThinking = true;
    } else {
      _isThinking = false;
      _currentAnswer = "";
      // _stop = false;
    }
    notifyListeners();
  }

  addAnswer(String answer) {
    _messages.insert(
        0,
        ChatMessage(
          text: answer,
          isMe: false,
        ));
    notifyListeners();
  }

  String _currentAnswer = "";

  addAnswerStream(String answer) {
    if (_currentAnswer.isNotEmpty) {
      _messages.removeAt(0);
    }
    _currentAnswer = answer;
    _messages.insert(
        0,
        ChatMessage(
          text: answer,
          isMe: false,
        ));
    notifyListeners();
  }

  addQuestion(String question) {
    _stop = false;
    _messages.insert(
        0,
        ChatMessage(
          text: question,
          isMe: true,
        ));
    notifyListeners();
  }

  _removeThinkingTips() {
    if (_isTipsShowing) {
      _isTipsShowing = false;
      _messages.removeAt(0);
      notifyListeners();
    }
  }

  dealResponse(Map response) async {
    if (response.isNotEmpty) {
      try {
        String allRes = response['choices'][0]['message']['content'];
        _removeThinkingTips();

        /// 打字模式
        for (int i = 1; i <= allRes.length; i++) {
          if (_stop) {
            break;
          }
          addAnswerStream(allRes.substring(0, i));
          await Future.delayed(const Duration(milliseconds: 50));
        }
      } catch (e) {
        _removeThinkingTips();
        addAnswer("出错了，结果返回错误。返回的结果如下：$response️");
      }
    } else {
      _removeThinkingTips();
      addAnswer("出错了，请检查网络。若确定非网络问题，请联系开发者。️");
    }
    _thinking(false);
  }

  Future? _future;

  bool isResponse = false; // 是否已经响应

  Future<void> handleSubmitted(String text) async {
    addQuestion(text);
    List<Map<String, String>> history = _messages.reversed
        .map((e) => {"role": e.isMe ? "user" : "assistant", "content": e.text})
        .toList();
    User user = await User.getInstance();
    if (user.aiUrl.isNotEmpty) {
      // if (!user.aiModelName.startsWith("gpt")) {
      // gpt 自己的模型则不需要将prompt消失掉.
      if (_prompt.isNotEmpty) {
        history.insert(0, {'role': 'user', "content": "$_prompt"});
      } else {
        history.insert(0, {'role': 'user', "content": "请称呼我为小喵主，然后介绍你自己。"});
      }
      // history[0]['role'] = "system";
      // }
      while (history.last['role'] != "user") {
        history.removeLast();
      }
      print(history);
      isResponse = false;
      Future.delayed(Duration(milliseconds: 400), () {
        if (!isResponse) {
          _thinking(true);
        }
      });
      String key = user.aiKey;
      Function request = ChatModel.postResponseInOpenAi;
      if (user.aiUrl == ipIn + Constant.miaodiAI) {
        request = ChatModel.postResponseToMiaodiAI;
        key = user.token;
      }
      if (user.aiModelName.isEmpty) {
        _future = request(key, user.aiUrl, history: history)
            .then((response) => {isResponse = true, dealResponse(response)});
      } else {
        _future = request(key, user.aiUrl,
                history: history, modelName: user.aiModelName)
            .then((response) => {isResponse = true, dealResponse(response)});
      }
    } else {
      _removeThinkingTips();
      addAnswer("喵主还没配置喵宝的Api，没有办法对你的问题进行响应哦！️");
    }
  }

  bool _stop = false;

  stopThinking() {
    _stop = true;
    if (_future != null) {
      _future!.ignore();
    }
    if (!isResponse) {
      _removeThinkingTips();
      addAnswer("喵主你结束了我的思考哦！️");
    }
    _thinking(false);
  }

  /// 目前不支持把所有对话历史清空，但可以保留最后一个
  cleanAllHistory() {
    _messages.clear();
    notifyListeners();
  }
  Future getModelList() async {
    return await ChatModel.fetchDataFromServer();
  }

}
