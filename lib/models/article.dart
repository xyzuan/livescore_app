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
    required this.title,
    required this.body,
    required this.externalLink,
    required this.dateCreated,
  });

  int? id;
  String? image;
  String? title;
  String? body;
  String? externalLink;
  String? dateCreated;

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    body = json['body'];
    externalLink = json['externalLink'];
    dateCreated = json['dateCreated'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    _data['title'] = title;
    _data['body'] = body;
    _data['externalLink'] = externalLink;
    _data['dateCreated'] = dateCreated;
    return _data;
  }
}
