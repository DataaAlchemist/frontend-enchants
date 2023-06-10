import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../infrastructure/models/book/book.dart';
import '../../../../infrastructure/repositories/book_repository.dart';

final recommendedNotifier =
    ChangeNotifierProvider.autoDispose((ref) => RecommendedNotifier(ref));

class RecommendedNotifier extends ChangeNotifier {
  final Ref _ref;

  RecommendedNotifier(this._ref) {
    fetch();
  }

  List<Book> items = [];
  bool isLoading = false;

  Future<void> fetch() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _ref.read(bookRepository).getBooks();

      items = response.books;
    } catch (e) {
      // fetch();
    }
    isLoading = false;
    notifyListeners();
  }
}
