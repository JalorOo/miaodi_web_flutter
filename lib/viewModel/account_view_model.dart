import 'dart:async';

import 'package:flutter/services.dart';
import 'package:miaodi_web/data/assets_history.dart';
import 'package:miaodi_web/model/account_model.dart';
import 'package:miaodi_web/common/event_name.dart';
import 'package:miaodi_web/data/callback.dart';
import 'package:miaodi_web/data/user.dart';
import 'package:miaodi_web/data/user_info.dart';
import 'package:miaodi_web/utils/event_bus.dart';

class AccountViewModel {
  AccountModel _model = AccountModel.getInstance();

  AccountViewModel._internal() {
    // 构造方法中初始化流相关的对象
  }

  static AccountViewModel? _viewModel;

  static AccountViewModel getInstance() {
    if (_viewModel == null) {
      _viewModel = AccountViewModel._internal();
    }
    return _viewModel!;
  }

  /// 会员激活
  activated(var code) async {
    User user = await User.getInstance();
    if ("" == user.token) {
      return;
    }
    CallBack callBack = await _model.activated(user.token, code);
    if (callBack.success!) {
      // 更新用户信息
      // syncUserInfo();
    }
    eventBus.emit(EventName.activatedState, callBack);
  }


  verifyUserByEmail() async {
    User user = await User.getInstance();
    if ("" == user.token) {
      print('没有用户');
      return CallBack(success: false, message: "用户未登录，请重新登录");
    }
    CallBack callBack = await _model.verifyUserByEmail(user.token);
    return callBack;
  }

  register(var username, password, email, verifyCode) async {
    print(verifyCode);
    CallBack callback =
    await _model.register(username, password, email, verifyCode);
    eventBus.emit(EventName.registerState, callback);
  }

  registerVerify(var email) async {
    CallBack callBack = await _model.registerVerify(email);
    return callBack;
  }

  deleteAccount(String text) async {
    User user = await User.getInstance();
    if ("" == user.token) {
      print('没有用户');
      return CallBack(success: false, message: "用户未登录，请重新登录");
    }
    CallBack callback = await _model.deleteAccount(user.token, text);
    if (callback.success!) {
      exit();
    }
    return callback;
  }

  exit() {
    _model.exit();
  }

  /// 更新密码
  Future<CallBack> updatePassword(var oldPassword, newPassword) async {
    User user = await User.getInstance();
    if ("" == user.token) {
      print('没有用户');
      return CallBack(success: false, message: "用户未登录，请重新登录");
    }
    CallBack callback =
    await _model.updatePassword(user.token, oldPassword, newPassword);
    if (callback.success!) {
      // 若登录成功
      //存储信息
      User user = await User.getInstance();
      user.token = callback.data!["token"];
    }
    return callback;
  }

  /// 更新用户名
  Future<CallBack> updateUsername(var username) async {
    User user = await User.getInstance();
    if ("" == user.token) {
      print('没有用户');
      return CallBack(success: false, message: "用户未登录，请重新登录");
    }
    CallBack callback = await _model.updateUsername(user.token, username);
    if (callback.success!) {
      user.username = username;
    }
    return callback;
  }

  /// 更新邮箱
  Future<CallBack> updateEmail(var email, verifyCode) async {
    User user = await User.getInstance();
    if ("" == user.token) {
      print('没有用户');
      return CallBack(success: false, message: "用户未登录，请重新登录");
    }
    CallBack callback = await _model.updateEmail(user.token, email, verifyCode);
    if (callback.success!) {
      user.email = email;
    }
    return callback;
  }

  syncUserInfo() async {
    CallBack callBack = await ensurePay();
    print(callBack.message!);
    return callBack;
  }

  Future<CallBack> getPayLink() async {
    User user = await User.getInstance();
    if(user.vip){
      return CallBack(success: false,message: "请使用手机设备进行续费");
    }
    CallBack callBack = await _model.getPayLink(user.token);
    return callBack;
  }

  Future<CallBack> ensurePay() async {
    User user = await User.getInstance();
    if (user.vip) {
      return CallBack(success: false,message: "请使用手机设备进行续费");
    }
    CallBack callBack = await _model.ensurePay(user.token);
    if(callBack.success!){
      return callBack;
    }
    return callBack;
  }

  Future<List<AssetsHistory>> getAssetsHistory() async {
    User user = await User.getInstance();
    if ("" == user.token) {
      print('没有用户');
      return [];
    }
    return _model.getAssetsHistory(user.token);
  }

  /// 转赠喵点
  transferAssets(var password,anotherUsername,count) async {
    User user = await User.getInstance();
    if ("" == user.token) {
      print('没有用户');
      return [];
    }
    CallBack callback = await _model.transferAssets(password,anotherUsername,count,user.token);
    return callback;
  }

}
