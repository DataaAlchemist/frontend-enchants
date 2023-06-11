import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/exceptions/network_exceptions.dart';
import '../../core/utils/dio_client.dart';
import '../models/book/book.dart';
import '../models/book/book_search.dart';

final bookRepository = Provider<BookRepository>((ref) {
  final dio = ref.watch(dioClient);
  final dioMl = ref.watch(dioClient2);

  return BookRepositoryImpl(dio, dioMl);
});

abstract class BookRepository {
  Future<BookResponse> getBooks();
  Future<Book> getBook(String id);
  Future<List<BookSearch>> searchBooks(String query);
  Future<List<BookSearch>> getSimilarBooks(String id);
}

class BookRepositoryImpl implements BookRepository {
  final DioClient _client;
  final DioClient _mlClient;

  const BookRepositoryImpl(this._client, this._mlClient);

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

  @override
  Future<List<BookSearch>> searchBooks(String query) async {
    try {
      final response = await _mlClient.post(
        '/api/recommend',
        data: {
          'title': query,
        },
      );
      final books = response.data as List<dynamic>;

      return books.map((e) => BookSearch.fromJson(e)).toList();
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }
  
  @override
  Future<List<BookSearch>> getSimilarBooks(String id) async {
    try {
      final response = await _mlClient.post(
        '/api/similar',
        data: {
          'id': id,
        },
      );
      final books = response.data as List<dynamic>;

      return books.map((e) => BookSearch.fromJson(e)).toList();
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }
}
