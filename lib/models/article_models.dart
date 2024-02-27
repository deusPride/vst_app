import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl;
  final int views;
  final DateTime createdAt;

  Article(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.body,
      required this.author,
      required this.authorImageUrl,
      required this.category,
      required this.imageUrl,
      required this.views,
      required this.createdAt});

  static List<Article> articles = [
    Article(
        id: '0',
        title: "test Article 0",
        subtitle: "Test subtitle",
        body: "Test body",
        author: "Test author",
        authorImageUrl: "Will Find",
        category: "Test Category",
        imageUrl:
            "https://images.pexels.com/photos/8354525/pexels-photo-8354525.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        views: 6,
        createdAt: DateTime.now().subtract((const Duration(hours: 15)))),
    Article(
        id: '1',
        title: "test Article 1",
        subtitle: "Test subtitle 1",
        body: "Test body",
        author: "Test author",
        authorImageUrl: "Will Find",
        category: "Test Category",
        imageUrl:
            "https://images.pexels.com/photos/8354525/pexels-photo-8354525.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        views: 6,
        createdAt: DateTime.now().subtract((const Duration(hours: 15)))),
    Article(
        id: '2',
        title: "test Article",
        subtitle: "Test subtitle",
        body:
            "Velit veniam aute enim id reprehenderit minim sit.Esse in ex nostrud exercitation magna officia occaecat et aliquip irure id.",
        author: "Test author",
        authorImageUrl: "Will Find",
        category: "Test Category",
        imageUrl:
            "https://images.pexels.com/photos/8354525/pexels-photo-8354525.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        views: 6,
        createdAt: DateTime.now().subtract((const Duration(hours: 15))))
  ];

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        body,
        author,
        authorImageUrl,
        category,
        imageUrl,
        views,
        createdAt
      ];
}
