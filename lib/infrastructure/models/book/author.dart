import 'package:equatable/equatable.dart';

class Author extends Equatable {
  final String id;
  final String name;
  final int v;

  const Author({
    required this.id,
    required this.name,
    required this.v,
  });

  @override
  List<Object?> get props => [id, name, v];

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['_id'] as String,
      name: json['name'] as String,
      v: json['__v'] as int,
    );
  }
}
