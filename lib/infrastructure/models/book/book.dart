import 'package:equatable/equatable.dart';

class BookResponse {
  final List<Book> books;

  BookResponse(this.books);

  factory BookResponse.fromJson(List<dynamic> json) {
    final books = <Book>[];
    for (final book in json) {
      books.add(Book.fromJson(book));
    }
    print('hehe $books');
    return BookResponse(books);
  }
}

class Book extends Equatable {
  final String isbn;
  final String title;
  final String author;
  final String genre;
  final String ratings;
  final String? image;
  final String price;
  final String sinopsis;

  const Book({
    required this.isbn,
    required this.title,
    required this.author,
    required this.genre,
    required this.ratings,
    this.image,
    required this.price,
    required this.sinopsis,
  });

  @override
  List<Object?> get props => [
        isbn,
        title,
        author,
        genre,
        ratings,
        image,
        price,
        sinopsis,
      ];

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      author: json['author'],
      genre: json['genre'],
      isbn: json['isbn'],
      price: json['price'],
      ratings: json['ratings'],
      sinopsis: json['sinopsis'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'isbn': isbn,
      'title': title,
      'author': author,
      'genre': genre,
      'ratings': ratings,
      'image': image,
      'price': price,
      'sinopsis': sinopsis,
    };
  }
}
