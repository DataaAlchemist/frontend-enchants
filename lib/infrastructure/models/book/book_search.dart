import 'package:equatable/equatable.dart';

class BookSearch extends Equatable {
  final String author;
  final String cleanDescription;
  final String cleanTitle;
  final String description;
  final String genre;
  final int id;
  final String image;
  final String publisher;
  final double ratingsCount;
  final String title;

  const BookSearch({
    required this.author,
    required this.cleanDescription,
    required this.cleanTitle,
    required this.description,
    required this.genre,
    required this.id,
    required this.image,
    required this.publisher,
    required this.ratingsCount,
    required this.title,
  });

  @override
  List<Object?> get props => [
        author,
        cleanDescription,
        cleanTitle,
        description,
        genre,
        id,
        image,
        publisher,
        ratingsCount,
        title,
      ];

  factory BookSearch.fromJson(Map<String, dynamic> json) => BookSearch(
    author: json['author'] as String,
    cleanDescription: json['clean_description'] as String,
    cleanTitle: json['clean_title'] as String,
    description: json['description'] as String,
    genre: json['genre'] as String,
    id: json['id'] as int,
    image: json['image'] as String,
    publisher: json['publisher'] as String,
    ratingsCount: json['ratings_count'] as double,
    title: json['title'] as String,
  );
}
