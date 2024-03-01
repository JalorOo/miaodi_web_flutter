import 'dart:convert';
import 'package:miaodi_web/data/callback.dart';
import 'package:miaodi_web/utils/https_util.dart';

import 'user_info.dart';

/// 用户账号拥有的字段
class User {
  static UserInfo? _sharedPreferences;
  static String? _token;

  User._();

  static User? _user;

  int get assets {
    int? assets = _sharedPreferences!.assets;
    return assets == null ? 0 : assets;
  }

  static Future<User> getInstance() async {
    _user ??= User._();
    if (_sharedPreferences == null) {
      CallBack result = await HttpsUtil.getResponse("http://localhost:10380/user");
      print('拿到信息=>${result.success!}');
      var info = result.data!["info"];
      _sharedPreferences = UserInfo.fromJson(info);
    }
    if(_token == null){
      CallBack result = await HttpsUtil.getResponse("http://localhost:10380/token");
      print('拿到token=>$result');
      _token = result.data!["token"];
    }
    return _user!;
  }

  String get aiKey {
    String? v = _sharedPreferences!.aiKey;
    return v == null ? "" : v;
  }

  set aiKey(String username) {
    _sharedPreferences!.aiKey = username;
    HttpsUtil.postResponseWithHeaderAndJson("http://localhost:10380/update/aiKey",{"aiKey":username});
  }

  String get aiUrl {
    String? v = _sharedPreferences!.aiUrl;
    return v == null ? "" : v;
  }

  set aiUrl(String username) {
    _sharedPreferences!.aiUrl = username;
    HttpsUtil.postResponseWithHeaderAndJson("http://localhost:10380/update/aiUrl",{"aiUrl":username});
  }

  String get aiModelName {
    String? v = _sharedPreferences!.aiModelName;
    return v == null ? "" : v;
  }

  set aiModelName(String username) {
    _sharedPreferences!.aiModelName = username;
    HttpsUtil.postResponseWithHeaderAndJson("http://localhost:10380/update/aiModelName",{"aiModelName":username});
  }

  String get username {
    String? v = _sharedPreferences!.username;
    return v == null ? "" : v;
  }

  set username(String username) {
    HttpsUtil.postResponseWithHeaderAndJson("http://localhost:10380/update/username",{"username":username});
  }

  /// 用户令牌 [token]

  String get token {
    String? token = _token;
    return token == null ? "" : token;
  }

  set token(String token) {
    HttpsUtil.postResponseWithHeaderAndJson("http://localhost:10380/update/token",{"token":token});
  }

  /// 用户邮箱 [email]

  String get email {
    String? value = _sharedPreferences!.email;
    return value == null ? "" : value;
  }

  set email(String email) {
    HttpsUtil.postResponseWithHeaderAndJson("http://localhost:10380/update/email",{"email":email});
  }

  /// 用户id [objectId]
  String get objectId {
    String? value = _sharedPreferences!.objectId;
    return value == null ? "" : value;
  }

  /// 用户是否为 vip [vip]

  bool get vip {
    bool? value = _sharedPreferences!.vip == _sharedPreferences!.objectId;
    return value == null ? false : value;
  }

  /// 用户 vip 过期期限 [expiredTime]
  String get expiredTime {
    String? value = _sharedPreferences!.time;
    return value == null ? "" : value;
  }

  /// 用户字数统计 [wordCount]
  int get wordCount {
    int? value = _sharedPreferences!.punch;
    return value == null ? 0 : value;
  }

  // 获得创建时间
  String get createTime {
    String? value = _sharedPreferences!.createTime;
    print("创建时间:"+value!);
    return value ?? "2019-02-01 11:11:11";
  }
}
