import 'package:equatable/equatable.dart';

import 'author.dart';
import 'book_genre.dart';

class BookResponse {
  final List<Book> books;

  BookResponse(this.books);

  factory BookResponse.fromJson(List<dynamic> json) {
    final books = <Book>[];
    for (final book in json) {
      books.add(Book.fromJson(book));
    }
    return BookResponse(books);
  }
}

class Book extends Equatable {
  final String isbn;
  final String title;
  final Author author;
  final BookGenre genre;
  final String description;
  final String image;

  const Book({
    required this.isbn,
    required this.title,
    required this.author,
    required this.genre,
    required this.description,
    required this.image,
  });

  @override
  List<Object?> get props => [isbn, title, author, genre, description, image];

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      isbn: json['isbn'] as String,
      title: json['title'] as String,
      // author: Author.fromJson(json['author'] as Map<String, dynamic>),
      // genre: BookGenre.fromJson(json['genre'] as Map<String, dynamic>),
      author: Author(id: json['author']['_id'], name: json['author']['author']),
      genre: BookGenre(id: json['genre']['_id'], genre: json['genre']['genre']),
      description: json['description'] as String,
      image: json['image'] as String,
    );
  }
}
