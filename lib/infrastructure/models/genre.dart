import 'package:equatable/equatable.dart';

final genreList = <Genre>[
  const Genre('Science Fiction'),
  const Genre('Fantasy'),
  const Genre('Mystery'),
  const Genre('Romance'),
  const Genre('Thriller'),
  const Genre('Historical Fiction'),
  const Genre('Biography'),
  const Genre('Self-help'),
  const Genre('Young Adult'),
  const Genre('Horror'),
  const Genre('Crime'),
  const Genre('Dystopian'),
  const Genre('Adventure'),
  const Genre('Comedy'),
  const Genre('Non-fiction'),
  const Genre('Poetry'),
  const Genre('Science'),
  const Genre('Memoir'),
  const Genre('Children\'s'),
  const Genre('Graphic Novel'),
  const Genre('Satire'),
  const Genre('Western'),
  const Genre('Erotica'),
  const Genre('Action'),
  const Genre('Suspense'),
  const Genre('Philosophy'),
  const Genre('Travel'),
  const Genre('Cooking'),
  const Genre('Art'),
  const Genre('Business'),
  const Genre('Psychology'),
  const Genre('History'),
  const Genre('Religion'),
  const Genre('Sports'),
  const Genre('Science Fiction/Fantasy'),
  const Genre('Historical Mystery'),
  const Genre('Paranormal'),
  const Genre('Urban Fantasy'),
  const Genre('Contemporary'),
  const Genre('Literary Fiction'),
];

class Genre extends Equatable {
  final String name;

  const Genre(this.name);

  @override
  List<Object?> get props => [name];
}
