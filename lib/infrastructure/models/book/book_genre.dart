import 'package:equatable/equatable.dart';

class BookGenre extends Equatable {
  final String id;
  final String genre;

  const BookGenre({
    required this.id,
    required this.genre,
  });

  @override
  List<Object?> get props => [id, genre];

  factory BookGenre.fromJson(Map<String, dynamic> json) {
    return BookGenre(
      id: json['_id'] as String,
      genre: json['genre'] as String,
    );
  }
}