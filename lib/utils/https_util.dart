import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:miaodi_web/data/callback.dart';

class HttpsUtil {
  //get
  static Future<CallBack> getResponse(var url,{Options? options}) async {
    try {
      Response response;
      if (options != null)
        response =
        await Dio().get(url, options: options);
      else
        response = await Dio().get(url);
      final jsonMap = json.decode(response.toString());
      CallBack callBack = CallBack.fromJson(jsonMap);
      return callBack;
    } catch (e) {
      print(e);
    }
    return CallBack(success: false);
  }

  //get请求带参数和请求头
  static Future<CallBack> getResponseWithHeaderAndArgus(
      var url, Map<String, dynamic> argus,
      {Options? options}) async {
    try {
      Response response;
      if (options != null)
        response =
        await Dio().get(url, options: options, queryParameters: argus);
      else
        response = await Dio().get(url, queryParameters: argus);
      final jsonMap = json.decode(response.toString());
      CallBack callBack = CallBack.fromJson(jsonMap);
      return callBack;
    } catch (e) {
      print(e);
    }
    return CallBack(success: false);
  }

  //post请求带参数和请求头
  static Future<CallBack> postResponseWithHeaderAndArgus(
      var url, Map<String, dynamic> argus,
      {Options? options}) async {
    try {
      Response response;
      if (options != null)
        response =
        await Dio().post(url, options: options, queryParameters: argus);
      else
        response = await Dio().post(url, queryParameters: argus);
      final jsonMap = json.decode(response.toString());
      CallBack callBack = CallBack.fromJson(jsonMap);
      return callBack;
    } catch (e) {
      print(e);
    }
    return CallBack(success: false);
  }

  //post请求请求头json格式
  static Future<CallBack> postResponseWithHeaderAndJson(
      var url, Map<String, dynamic> map,{Options? options}) async {
    try {
      Response response;
      if (options != null)
        response = await Dio().post(url, options: options, data: map);
      else
        response = await Dio().post(url, data: map);
      final jsonMap = json.decode(response.toString());
      CallBack callBack = CallBack.fromJson(jsonMap);
      return callBack;
    } catch (e) {
      print(e);
    }
    return CallBack(success: false);
  }

  //post请求请求头json格式
  static Future<CallBack> postResponseWithFile(
      var url, FormData data,{Options? options}) async {
    try {
      Response response;
      if (options != null)
        response = await Dio().post(url, options: options, data: data);
      else
        response = await Dio().post(url, data: data);
      final jsonMap = json.decode(response.toString());
      CallBack callBack = CallBack.fromJson(jsonMap);
      return callBack;
    } catch (e) {
      print(e);
    }
    return CallBack(success: false);
  }
}
