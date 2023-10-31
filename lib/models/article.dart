class ArticleModel {
  ArticleModel({
    required this.article,
  });

  List<Article>? article;

  ArticleModel.fromJson(Map<String, dynamic> json) {
    article =
        List.from(json['article']).map((e) => Article.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['article'] = article!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Article {
  Article({
    required this.id,
    required this.image,
    this.title,
    required this.body,
  });

  String? id;
  String? image;
  String? title;
  String? body;

  Article.fromJson(Map<String, dynamic> json) {
    id = json['image_url'];
    image = json['name'];
    title = json['title'];
    body = json['permalink'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    _data['title'] = title;
    _data['body'] = body;
    return _data;
  }
}
