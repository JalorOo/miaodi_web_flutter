class AssetsHistory {
  int? rest;
  String? info;
  String? time;
  int? effect;

  AssetsHistory({this.rest, this.info, this.time, this.effect});

  AssetsHistory.fromJson(Map<String, dynamic> json) {
    rest = json['rest'];
    info = json['info'];
    time = json['time'];
    effect = json['effect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rest'] = this.rest;
    data['info'] = this.info;
    data['time'] = this.time;
    data['change'] = this.effect;
    return data;
  }
}
