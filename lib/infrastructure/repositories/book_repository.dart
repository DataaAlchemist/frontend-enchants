import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/exceptions/network_exceptions.dart';
import '../../core/utils/dio_client.dart';
import '../../providers.dart';
import '../models/book/book.dart';

final bookRepository = Provider<BookRepository>((ref) {
  final dio = ref.watch(dioClient);
  final preferences = ref.watch(sharedPreferences);

  return BookRepositoryImpl(dio, preferences);
});

abstract class BookRepository {
  Future<BookResponse> getBooks();
}

class BookRepositoryImpl implements BookRepository {
  final DioClient _client;
  final SharedPreferences _preferences;

  const BookRepositoryImpl(this._client, this._preferences);
  
  @override
  Future<BookResponse> getBooks() async {
    try {
      final response = await _client.get(
        '/api/book',
      );

      final book = BookResponse.fromJson(response.data);
      
      return book;
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }
}
