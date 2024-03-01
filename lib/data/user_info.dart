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
  String? aiKey;
  String? aiUrl;
  String? aiModelName;

  UserInfo(
      {this.punchTime,
        this.time,
        this.email,
        this.punch,
        this.username,
        this.objectId,
        this.vip,
        this.assets,this.createTime,this.aiKey,this.aiModelName,this.aiUrl});

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
    aiKey = json['aiKey'];
    aiModelName = json['aiModelName'];
    aiUrl = json['aiUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['punchTime'] = punchTime;
    data['time'] = time;
    data['email'] = this.email;
    data['punch'] = this.punch;
    data['username'] = this.username;
    data['objectId'] = this.objectId;
    data['vip'] = this.vip;
    data['assets'] = this.assets;
    data['createTime'] = this.createTime;
    data['aiKey'] = this.aiKey;
    data['aiModelName'] = this.aiModelName;
    data['aiUrl'] = this.aiUrl;
    return data;
  }
}