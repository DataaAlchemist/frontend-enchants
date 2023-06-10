import 'package:book_store/core/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/exceptions/network_exceptions.dart';
import '../models/book/book_genre.dart';

final genreRepository = Provider<GenreRepository>((ref) {
  return GenreRepositoryImpl();
});

abstract class GenreRepository {
  Future<List<BookGenre>> getGenres();
}

class GenreRepositoryImpl implements GenreRepository {
  @override
  Future<List<BookGenre>> getGenres() async {
    try {
      final response = await supabase.from('genres').select('*').execute();
      final genres = <BookGenre>[];

      response.data.forEach((element) {
        genres.add(BookGenre(id: element['id'], genre: element['name']));
      });

      return genres;
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }
}
