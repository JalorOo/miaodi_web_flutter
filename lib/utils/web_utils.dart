import 'dart:convert';

// import 'dart:html';

class WebUtils{

  static String getUrl(var para){
    var uri;
    // uri = Uri.dataFromString(window.location.href);
    print("网址：$uri");//converts string to a uri
    Map<String, String> params = uri.queryParameters; // query parameters automatically populated
    var param1 = params[para];
    print("参数1：$param1");// return value of parameter "param1" from uri
    print("参数all：${jsonEncode(params)}");//can use returned parameters to encode as json
    return param1!;
  }

}