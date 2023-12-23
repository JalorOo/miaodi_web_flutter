import 'dart:async';

import 'package:dio/dio.dart';
import 'package:miaodi_web/common/config.dart';
import 'package:miaodi_web/common/constant.dart';
import 'package:miaodi_web/data/callback.dart';
import 'package:miaodi_web/data/cloud_passage.dart';
import 'package:miaodi_web/data/user.dart';
import 'package:miaodi_web/utils/https_util.dart';
import 'package:miaodi_web/utils/time_utils.dart';
import 'package:miaodi_web/viewModel/passage_view_model.dart';

class PassageModel {
  static PassageModel? _model;

  static PassageModel getInstance() {
    if (_model == null) {
      _model = PassageModel._();
    }
    return _model!;
  }

  PassageModel._() {
    //构造方法中初始化流相关的对象
    _cloudPassagesController = StreamController<List<CloudPassage>>.broadcast();
    cloudPassagesSink =
        _cloudPassagesController!.sink as StreamSink<List<CloudPassage>>;

    _trashPassagesController = StreamController<List<CloudPassage>>.broadcast();
    trashPassagesSink =
        _trashPassagesController!.sink as StreamSink<List<CloudPassage>>;
  }

  StreamController? _passageController; //数据流控制器

  StreamController? get passageController => _passageController;

  StreamController? _cloudPassagesController;

  StreamController? get cloudPassagesController => _cloudPassagesController;

  StreamSink<List<CloudPassage>>? cloudPassagesSink;

  StreamController? _trashPassagesController;

  StreamController? get trashPassagesController => _trashPassagesController;

  StreamSink<List<CloudPassage>>? trashPassagesSink;

  queryCloudPassages(var pageNum) async {
    User _user = await User.getInstance();
    if (_user.token == null || _user.token == "") {
      print('用户未登录');
      return;
    }
    //int pageNum = 0;
    // 配置参数
    Map<String, dynamic> map = new Map();
    // 服务器接受的参数 String title, String content, String book, String chapter
    map['pageNum'] = pageNum;
    Options options = new Options(headers: {'token': _user.token});
    CallBack callback = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.page + Constant.query, map,
        options: options);
    if (!callback.success!) return;
    // 这里的参数是与postman请求返回中的data中的key相同的
    var jsonList = callback.data!['pages'] as List;
    print(callback.message);
    List<CloudPassage> list =
        jsonList.map((m) => new CloudPassage.fromJson(m)).toList();
    if (pageNum == 0)
      PassageViewModel.cloudPassagesList = list;
    else
      PassageViewModel.cloudPassagesList.addAll(list);
    print("queryCloudPassage" + list.length.toString());
    cloudPassagesSink!.add(PassageViewModel.cloudPassagesList);
  }

  /// 释放资源
  dispose() {}



  /// 移动到回收站
  removeCloudPassage(CloudPassage c, {isLocalDelete = false}) async {
    User _user = await User.getInstance();
    if (_user.token == null || _user.token == "") {
      print('用户未登录');
      return;
    }
    //int pageNum = 0;
    // 配置参数
    Map<String, dynamic> map = new Map();
    // 服务器接受的参数 String title, String content, String book, String chapter
    map['id'] = c.id;
    Options options = new Options(headers: {'token': _user.token});
    CallBack callback = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.page + Constant.remove, map,
        options: options);
    if (!callback.success!) return;
    print("云文章移除成功");
    if (!isLocalDelete) {
      PassageViewModel.cloudPassagesList.remove(c);
      cloudPassagesSink!.add(PassageViewModel.cloudPassagesList);
    }
  }

  /// 恢复
  recoverCloudPassage(CloudPassage c) async {
    User _user = await User.getInstance();
    if (_user.token == null || _user.token == "") {
      print('用户未登录');
      return;
    }
    //int pageNum = 0;
    // 配置参数
    Map<String, dynamic> map = new Map();
    // 服务器接受的参数 String title, String content, String book, String chapter
    map['id'] = c.id;
    Options options = new Options(headers: {'token': _user.token});
    CallBack callback = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.page + Constant.recover, map,
        options: options);
    if (!callback.success!) return;
    print("云文章恢复成功");
    PassageViewModel.cloudPassagesList.remove(c);
    cloudPassagesSink!.add(PassageViewModel.cloudPassagesList);
  }

  /// 永久删除
  deleteCloudPassage(CloudPassage c) async {
    print("云文章删除");
    User _user = await User.getInstance();
    if (_user.token == null || _user.token == "") {
      print('用户未登录');
      return;
    }
    // 配置参数
    Map<String, dynamic> map = new Map();
    // 服务器接受的参数 String title, String content, String book, String chapter
    map['id'] = c.id;
    Options options = new Options(headers: {'token': _user.token});
    CallBack callback = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.page + Constant.delete, map,
        options: options);
    if (!callback.success!) {
      return;
    }
    print("云文章删除成功");
    PassageViewModel.cloudPassagesList.remove(c);
    cloudPassagesSink!.add(PassageViewModel.cloudPassagesList);
  }

  /// 设置分享以及其密码
  shareCloudPassage(String id, password) async {
    print("云文章分享");
    User _user = await User.getInstance();
    if (_user.token == null || _user.token == "") {
      print('用户未登录');
      return CallBack(success: false, message: "用户未登录");
    }
    // 配置参数
    Map<String, dynamic> map = new Map();
    // 服务器接受的参数 String title, String content, String book, String chapter
    map['id'] = id;
    map['password'] = password;
    Options options = new Options(headers: {'token': _user.token});
    CallBack callback = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.page + Constant.share, map,
        options: options);
    return callback;
  }

  unShareCloudPassage(CloudPassage c) async {
    print("取消云文章分享");
    User _user = await User.getInstance();
    if (_user.token == null || _user.token == "") {
      print("用户未登录");
      return CallBack(success: false, message: "用户未登录");
    }
    //配置参数
    Map<String, dynamic> map = new Map();
    map['id'] = c.id;
    Options options = new Options(headers: {'token': _user.token});
    CallBack callBack = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.page + Constant.unShare, map,
        options: options);
    return callBack;
  }

  /// 插入文章
  /// content 内容
  /// author 作者
  addSaid(String content, String author) async {
    print("分享一言:" + content + ",author:" + author);
    User _user = await User.getInstance();
    if (_user.token == null || _user.token == "") {
      print("用户未登录");
      return CallBack(success: false, message: "用户未登录");
    }
    //配置参数
    Map<String, dynamic> map = new Map();
    map['content'] = content;
    map['author'] = author;
    Options options = new Options(headers: {'token': _user.token});
    CallBack callBack = await HttpsUtil.postResponseWithHeaderAndArgus(
        "https://api.libv.cc/miaodi/said/add", map,
        options: options);
    return callBack;
  }

  queryTrashPassages(var pageNum) async {
    User _user = await User.getInstance();
    if (_user.token == null || _user.token == "") {
      print('用户未登录');
      return;
    }
    //int pageNum = 0;
    // 配置参数
    Map<String, dynamic> map = new Map();
    // 服务器接受的参数 String title, String content, String book, String chapter
    map['pageNum'] = pageNum;
    Options options = new Options(headers: {'token': _user.token});
    CallBack callback = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.page + Constant.query + Constant.trash, map,
        options: options);
    if (!callback.success!) return;
    // 这里的参数是与postman请求返回中的data中的key相同的
    var jsonList = callback.data!['pages'] as List;
    print(callback.message);
    List<CloudPassage> list =
        jsonList.map((m) => new CloudPassage.fromJson(m)).toList();
    if (pageNum == 0)
      PassageViewModel.trashPassagesList = list;
    else
      PassageViewModel.trashPassagesList.addAll(list);
    trashPassagesSink!.add(PassageViewModel.trashPassagesList);
  }

  /// 恢复
  recoverPassages(CloudPassage c) async {
    User _user = await User.getInstance();
    if (_user.token == null || _user.token == "") {
      print('用户未登录');
      return;
    }
    //int pageNum = 0;
    // 配置参数
    Map<String, dynamic> map = new Map();
    // 服务器接受的参数 String title, String content, String book, String chapter
    map['id'] = c.id;
    Options options = new Options(headers: {'token': _user.token});
    CallBack callback = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.page + Constant.recover, map,
        options: options);
    if (!callback.success!) return;
    print("云文章恢复成功");
    PassageViewModel.trashPassagesList.remove(c);
    trashPassagesSink!.add(PassageViewModel.trashPassagesList);
  }

  /// 永久删除
  deletePassages(CloudPassage c) async {
    print("云文章删除");
    User _user = await User.getInstance();
    if (_user.token == null || _user.token == "") {
      print('用户未登录');
      return;
    }
    // 配置参数
    Map<String, dynamic> map = new Map();
    // 服务器接受的参数 String title, String content, String book, String chapter
    map['id'] = c.id;
    Options options = new Options(headers: {'token': _user.token});
    CallBack callback = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.page + Constant.delete, map,
        options: options);
    if (!callback.success!) {
      print("云文章删除失败");
      return;
    }
    print("云文章删除成功");
    PassageViewModel.trashPassagesList.remove(c);
    trashPassagesSink!.add(PassageViewModel.trashPassagesList);
  }
}
