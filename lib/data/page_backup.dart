class PageBackUp {
  int? id;
  int? pageId;
  String? title;
  String? content;
  String? book;
  String? chapter;
  String? user;
  String? updateTime;

  PageBackUp(
      {this.id,
        this.pageId,
        this.title,
        this.content,
        this.book,
        this.chapter,
        this.user,
        this.updateTime});

  PageBackUp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageId = json['pageId'];
    title = json['title'];
    content = json['content'];
    book = json['book'];
    chapter = json['chapter'];
    user = json['user'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pageId'] = this.pageId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['book'] = this.book;
    data['chapter'] = this.chapter;
    data['user'] = this.user;
    data['updateTime'] = this.updateTime;
    return data;
  }
}
