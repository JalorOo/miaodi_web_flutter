import 'package:intl/intl.dart';
/// 匹配中文、英文与数字
/// [content] 为内容
/// 返回统计出来的字数
int countWord(String content) {
  RegExp regExp = new RegExp(r"([\u4e00-\u9fa5])|([a-zA-Z]+)|(\d)");
  int i = regExp.allMatches(content).length;
  return i;
}

/// 数字模式
String getFormatMoney(int number) {
  var format = NumberFormat('0,000');
  return format.format(number);
}
