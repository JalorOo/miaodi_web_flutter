import 'dart:async';

import 'package:flutter/services.dart';
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

  registerVerify(var email) async {
    CallBack callBack = await _model.registerVerify(email);
    return callBack;
  }

  deleteAccount(String text) {

  }

  exit() {

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

}
