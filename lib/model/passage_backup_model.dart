import 'dart:async';
import 'package:dio/dio.dart';

import '../common/constant.dart';
import '../data/callback.dart';
import '../data/page_backup.dart';
import '../data/user.dart';
import '../utils/https_util.dart';
import '../viewModel/passage_backup_view_model.dart';

class PassageBackupModel {
  static PassageBackupModel? _model;

  static PassageBackupModel getInstance() {
    if (_model == null) {
      _model = PassageBackupModel._();
    }
    return _model!;
  }

  PassageBackupModel._() {
    //构造方法中初始化流相关的对象

    _cloudPassagesController = StreamController<List<PageBackUp>>.broadcast();
    cloudPassagesSink =
        _cloudPassagesController!.sink as StreamSink<List<PageBackUp>>;
  }

  StreamController? _controller; //数据流控制器

  StreamController? get passageController => _controller;

  StreamController? _cloudPassagesController;

  StreamController? get cloudPassagesController => _cloudPassagesController;

  StreamSink<List<PageBackUp>>? cloudPassagesSink;

  queryHistoryPassages(var id, pageNum) async {
    User _user = await User.getInstance();
    if (_user.token == null || _user.token == "") {
      print('用户未登录');
      return;
    }
    //int pageNum = 0;
    // 配置参数
    Map<String, dynamic> map = new Map();
    map['id'] = id;
    // 服务器接受的参数 String title, String content, String book, String chapter
    map['pageNum'] = pageNum;
    Options options = new Options(headers: {'token': _user.token});
    CallBack callback = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.pageBackup + Constant.query, map,
        options: options);
    if (!callback.success!) return;
    // 这里的参数是与postman请求返回中的data中的key相同的
    var jsonList = callback.data!['pages'] as List;
    print(callback.message);
    List<PageBackUp> list =
        jsonList.map((m) => new PageBackUp.fromJson(m)).toList();
    if (pageNum == 0)
      PassageBackupViewModel.cloudPassagesList = list;
    else
      PassageBackupViewModel.cloudPassagesList.addAll(list);
    cloudPassagesSink!.add(PassageBackupViewModel.cloudPassagesList);
  }

  /// 释放资源
  dispose() {}
}
