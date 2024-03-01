import 'dart:convert';
import 'package:dio/dio.dart';

class ChatModel {
  /// sk-dG8XriNj9vEXy9TUvv5CU1b4bOZmwNJCVZ6WgRSJNgJeOVJl
  /// https://api.chatanywhere.tech/v1/chat/completions
  static Future<Map> postResponseInOpenAi(String key, String url,
      {List<Map<String, String>> history = const [],
      String modelName = "gpt-3.5-turbo"}) async {
    try {
      Response response;
      Options options = Options(headers: {'Authorization': 'Bearer $key'});
      print(url);
      print(key);
      print(modelName);
      response = await Dio().post(url,
          options: options,
          data: json.encode({"model": modelName, "messages": history}));
      // print(response.toString());
      final jsonMap = json.decode(response.toString());
      return jsonMap;
    } catch (e) {
      print("错误$e");
      return {};
    }
  }

  static Future<Map> postResponseToMiaodiAI(String key, String url,
      {List<Map<String, String>> history = const [],
      String modelName = "gpt-3.5-turbo"}) async {
    try {
      Response response;
      Options options = new Options(headers: {'token': key});
      response = await Dio().post(url,
          options: options,
          data: json.encode({"modelName": modelName, "history": history}));
      final jsonMap = json.decode(response.toString());
      return jsonMap;
    } catch (e) {
      print("错误$e");
      return {};
    }
  }

  static Future<List<dynamic>> fetchDataFromServer() async {
    try {
      Response response = await Dio().get('https://libv.miaodiapp.com/ai/model.json');
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.toString());
        List<dynamic> list = data['list'];
        return list;
      } else {
        print('模型数据取得 Failed to load data');
        return [];
      }
    } catch (e) {
      print('模型数据取得 Error: $e');
    }
    return [];
  }
}
