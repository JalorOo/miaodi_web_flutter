/// [UserInfo] 是用户信息类
/// 用于从服务器端获取用户数据
class UserInfo {
  String? punchTime;
  String? time;
  String? email;
  int? punch;
  String? username;
  String? objectId;
  String? vip;
  int? assets;
  String? createTime;

  UserInfo(
      {this.punchTime,
        this.time,
        this.email,
        this.punch,
        this.username,
        this.objectId,
        this.vip,
        this.assets,this.createTime});

  UserInfo.fromJson(Map<String, dynamic> json) {
    punchTime = json['punchTime'];
    time = json['time'];
    email = json['email'];
    punch = json['punch'];
    username = json['username'];
    objectId = json['objectId'];
    vip = json['vip'];
    assets = json['assets'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['punchTime'] = this.punchTime;
    data['time'] = this.time;
    data['email'] = this.email;
    data['punch'] = this.punch;
    data['username'] = this.username;
    data['objectId'] = this.objectId;
    data['vip'] = this.vip;
    data['assets'] = this.assets;
    data['createTime'] = this.createTime;
    return data;
  }
}