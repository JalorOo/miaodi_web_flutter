class CloudPassage {
  int? id;
  String? title;
  String? user;
  int? last;
  int? share;
  String? book;
  String? chara;
  String? updateTime;
  String? createTime;
  String? content;

  CloudPassage(
      {this.id,
        this.title,
        this.user,
        this.last,
        this.share,
        this.book,
        this.chara,
        this.updateTime,
        this.createTime,
        this.content});

  CloudPassage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    user = json['user'];
    last = json['last'];
    share = json['share'];
    book = json['book'];
    chara = json['chara'];
    updateTime = json['updateTime'];
    createTime = json['createTime'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['user'] = this.user;
    data['last'] = this.last;
    data['share'] = this.share;
    data['book'] = this.book;
    data['chara'] = this.chara;
    data['updateTime'] = this.updateTime;
    data['createTime'] = this.createTime;
    data['content'] = this.content;
    return data;
  }
}
