import 'dart:convert';

import 'package:miaodi_web/data/callback.dart';
import 'package:miaodi_web/data/cloud_passage.dart';
import 'package:miaodi_web/utils/https_util.dart';
import 'package:miaodi_web/utils/time_utils.dart';

class PassageViewModel{

  int _pageNum = 0;
  int _loadingPageNum = 0;
  // webSocket是否发生错误
  bool isWebSocketError = true;

  String _deviceName = TimeUtils.getNowTime19C();

  /// 模糊查询是否使用以及其内容，这个属性被page所引用
  FuzzyQuery fuzzyQuery = FuzzyQuery();

  // 用于显示当前加载到第几页
  int get loadingPageNum => _loadingPageNum;

  /// 查找关键词的列表
  List<TextMatch> textMatchList = [];

  static List<CloudPassage> cloudPassagesList = [];
  Stream<List<CloudPassage>>? cloudPassageStream;

  PassageViewModel._internal() {
    // 构造方法中初始化流相关的对象
  }

  static PassageViewModel? _viewModel;

  static PassageViewModel getInstance() {
    if (_viewModel == null) {
      _viewModel = PassageViewModel._internal();
    }
    return _viewModel!;
  }

  Future<int> queryPassage()async {
    CallBack result = await HttpsUtil.getResponse("http://localhost:10380/passageLength");
    print('拿到文章=>${result.success!}');
    int length = result.data!["length"];
    return length;
  }

}

/// 模糊查询类
class FuzzyQuery {
  // 是否在查询
  bool isUsed = false;
  // 查询内容
  String searchContent = "";

  FuzzyQuery._();

  static FuzzyQuery? _fuzzyQuery;

  // 工厂模式 : 单例公开访问点
  factory FuzzyQuery() => _getInstance();

  static FuzzyQuery _getInstance() {
    _fuzzyQuery ??= FuzzyQuery._();
    return _fuzzyQuery!;
  }
}

/// 匹配类
class TextMatch {
  String displayContent;
  int position;

  TextMatch(this.displayContent,this.position);
}