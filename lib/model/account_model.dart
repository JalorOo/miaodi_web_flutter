import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:miaodi_web/common/constant.dart';
import 'package:miaodi_web/data/callback.dart';
import 'package:miaodi_web/utils/https_util.dart';
import 'package:miaodi_web/utils/time_utils.dart';

class AccountModel {
  static AccountModel? _model;

  static AccountModel getInstance() {
    if (_model == null) {
      _model = AccountModel._();
    }
    return _model!;
  }

  AccountModel._();

  StreamController? _controller; //数据流控制器

  StreamController? get controller => _controller;

  /// 登录
  Future<CallBack> login(var username, password) async {
    Map<String, String> args = HashMap();
    args['username'] = username;
    args['password'] = password;
    CallBack callBack = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.user + Constant.login, args);
    callBack.data!['username'] = username;
    return callBack;
  }

  /// 邮箱登录
  Future<CallBack> loginByEmail(var email, password) async {
    Map<String, String> args = HashMap();
    args['email'] = email;
    args['password'] = password;
    CallBack callBack = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.user + Constant.loginByEmail, args);
    return callBack;
  }

  /// 注册
  Future<CallBack> register(var username, password,email,verifyCode) async {
    Map<String, String> args = HashMap();
    args['username'] = username;
    args['password'] = password;
    args['verifyCode'] = verifyCode;
    args['email'] = email;
    print(verifyCode);
    CallBack callBack = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.user + Constant.register, args);
    return callBack;
  }

  /// 更新密码
  Future<CallBack> updatePassword(var token, oldPassword, newPassword) async {
    Map<String, String> args = HashMap();
    args['oldPassword'] = oldPassword;
    args['newPassword'] = newPassword;
    Options options = Options(headers: {'token': token});
    CallBack callBack = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.user + Constant.updatePassword, args,
        options: options);
    return callBack;
  }

  /// 更新用户名
  Future<CallBack> updateUsername(var token, username) async {
    Map<String, String> args = HashMap();
    args['username'] = username;
    Options options = Options(headers: {'token': token});
    CallBack callBack = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.user + Constant.updateUsername, args,
        options: options);
    return callBack;
  }

  /// 更新邮箱
  Future<CallBack> updateEmail(var token, email,verifyCode) async {
    Map<String, String> args = HashMap();
    args['email'] = email;
    args['verifyCode'] = verifyCode;
    Options options = Options(headers: {'token': token});
    CallBack callBack = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.user + Constant.updateEmail, args,
        options: options);
    return callBack;
  }

  /// 获得用户信息
  /// 这个信息每次打开App都从服务器拉取一次以保证与服务器保持一致
  syncUserInfo(var token) async {
    Options options = Options(headers: {'token': token});
    CallBack callBack = await HttpsUtil.getResponse(
        "${Constant.ip}${Constant.user}${Constant.info}",
        options: options); //获得用户信息
    return callBack;
  }

  purchase(var token, receipt, transactionId) async {
    Map<String, dynamic> args = HashMap();
    MultipartFile multipartFile = MultipartFile.fromString(receipt,
        filename: TimeUtils.getNowTime19C() + ".md");
    args['receipt'] = multipartFile;
    args['transactionId'] = transactionId;
    Options options = Options(headers: {'token': token});
    FormData formData = FormData.fromMap(args);
    CallBack callBack = await HttpsUtil.postResponseWithFile(
        "${Constant.ip}${Constant.purchase}${Constant.appleIap}", formData,
        options: options); //获得用户信息
    return callBack;
  }

  activated(var token, code) async {
    Map<String, String> args = HashMap();
    args['code'] = code;
    Options options = Options(headers: {'token': token});
    CallBack callBack = await HttpsUtil.postResponseWithHeaderAndArgus(
        "${Constant.ip}${Constant.user}${Constant.activated}", args,
        options: options); //获得用户信息
    return callBack;
  }

  /// 资源
  dispose() {}

  deleteAccount(String? token, String password) async {
    Map<String, String> args = HashMap();
    args['password'] = password;
    Options options = Options(headers: {'token': token});
    CallBack callBack = await HttpsUtil.postResponseWithHeaderAndArgus(
        Constant.ip + Constant.user + Constant.delete, args,
        options: options);
    return callBack;
  }

  /// 验证用户并向用户绑定的原邮箱发送验证码
  verifyUserByEmail(String? token) async {
    Options options = Options(headers: {'token': token});
    CallBack callBack = await HttpsUtil.getResponse(
        "${Constant.ip}${Constant.user}${Constant.verifyUserByEmail}",
        options: options);
    return callBack;
  }


  registerVerify(var email) async{
    Map<String,String> args = HashMap();
    args["email"] = email;
    CallBack callBack = await HttpsUtil.postResponseWithHeaderAndArgus(
      Constant.ip + Constant.user + Constant.registerVerify,args,
    );
    return callBack;
  }

  Future<CallBack> getPayLink(String token) async {
    Options options = Options(headers: {'token': token});
    CallBack callBack = await HttpsUtil.getResponse(
        "${Constant.ipTest}${Constant.purchase}${Constant.ezrevenuePay}",
        options: options);
    print(callBack.message!);
    return callBack;
  }

  Future<CallBack> ensurePay(String token) async {
    Options options = Options(headers: {'token': token});
    CallBack callBack = await HttpsUtil.getResponse(
        "${Constant.ipTest}${Constant.purchase}${Constant.ezrevenuePay}${Constant.ensure}",
        options: options);
    print(callBack.message!);
    return callBack;
  }

  Future<void> exit() async {
    await HttpsUtil.getResponse("http://localhost:10380/userExit");
    // print('拿到信息=>${result.success!}');
  }
}
