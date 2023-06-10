import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/exceptions/network_exceptions.dart';
import '../../core/utils/dio_client.dart';
import '../models/book/book.dart';

final bookRepository = Provider<BookRepository>((ref) {
  final dio = ref.watch(dioClient);

  return BookRepositoryImpl(dio);
});

abstract class BookRepository {
  Future<BookResponse> getBooks();
  Future<Book> getBook(String id);
}

class BookRepositoryImpl implements BookRepository {
  final DioClient _client;

  const BookRepositoryImpl(this._client);
  
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
  
  @override
  Future<Book> getBook(String id) async {
    try {
      final response = await _client.get(
        '/api/book/$id',
      );

      return Book.fromJson(response.data);
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }
}
