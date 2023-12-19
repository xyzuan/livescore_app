class ArticlesResult {
  final String status;
  final int totalResults;
  final List<Article> articles;

  ArticlesResult({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ArticlesResult.fromJson(Map<String, dynamic> json) {
    List<dynamic> articleList = json['article'];
    List<Article> articles = articleList
        .map((articleJson) => Article.fromJson(articleJson))
        .toList();

    return ArticlesResult(
      status: json["status"],
      totalResults: json["results"],
      articles: articles
          .where((article) =>
              article.id != null &&
              article.image.isNotEmpty &&
              article.title != null &&
              article.body.isNotEmpty &&
              article.externalLink != null)
          .toList(),
    );
  }
}

class Article {
  final int id;
  final String image;
  final String title;
  final String body;
  final String externalLink;
  final DateTime dateCreated;

  Article({
    required this.id,
    required this.image,
    required this.title,
    required this.body,
    required this.externalLink,
    required this.dateCreated,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json["id"],
      image: json["image"],
      title: json["title"],
      body: json["body"],
      externalLink: json["externalLink"],
      dateCreated: DateTime.parse(json["dateCreated"]),
    );
  }
}
