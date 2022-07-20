class CallBack {
  bool? success;
  int? code;
  String? message;
  Map<String, dynamic>? data;

  CallBack({this.success, this.code, this.message, this.data});

  factory CallBack.fromJson(Map<String, dynamic> json) {
    return CallBack(
        success: json['success'],
        code: json['code'],
        message: json['info'],
        data: json['data']);
  }
}

class ImgCallback {
  int? code;
  String? msg;
  Data? data;
  int? time;

  ImgCallback({this.code, this.msg, this.data, this.time});

  ImgCallback.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['time'] = this.time;
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? url;
  int? size;
  String? mime;
  String? sha1;
  String? md5;
  String? quota;
  String? useQuota;

  Data(
      {this.id,
        this.name,
        this.url,
        this.size,
        this.mime,
        this.sha1,
        this.md5,
        this.quota,
        this.useQuota});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    size = json['size'];
    mime = json['mime'];
    sha1 = json['sha1'];
    md5 = json['md5'];
    quota = json['quota'];
    useQuota = json['use_quota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['size'] = this.size;
    data['mime'] = this.mime;
    data['sha1'] = this.sha1;
    data['md5'] = this.md5;
    data['quota'] = this.quota;
    data['use_quota'] = this.useQuota;
    return data;
  }
}

