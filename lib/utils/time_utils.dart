class TimeUtils{
  static int compare(DateTime d1,d2){
    return d2.difference(d1).inDays;
  }

  static String getNowTime19C(){
    //时间格式 2020-06-22 09:53:26 共19个字符
    var time = DateTime.now().toString().substring(0, 19); //获得时间
    return time;
  }

  static String getNowTime10C(){
    //时间格式 2020-06-22 09:53:26 共19个字符
    var time = DateTime.now().toString().substring(0, 10); //获得时间
    return time;
  }

  // 计算两个时间的相差
  static calculate(String createTime, String dateTime) {
    if(createTime.length > 10){
      createTime = createTime.substring(0,10);
    }
    return compare(DateTime.parse(createTime),DateTime.parse(dateTime));
  }
}