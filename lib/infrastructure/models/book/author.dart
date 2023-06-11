import 'package:equatable/equatable.dart';

class Author extends Equatable {
  final String? id;
  final String name;

  const Author({
    this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['_id'] as String,
      name: json['name'] as String,
    );
  }
}
