import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/exceptions/network_exceptions.dart';
import '../../../../infrastructure/models/book/book.dart';
import '../../../../infrastructure/repositories/book_repository.dart';

part 'book_detail_state.dart';
part 'book_detail_viewmodel.freezed.dart';

final bookDetailViewModel = StateNotifierProvider.family((ref, String bookId) {
  return BookDetailViewModel(ref, bookId);
});

class BookDetailViewModel extends StateNotifier<BookDetailState> {
  final Ref _ref;
  final String _bookId;
  
  BookDetailViewModel(this._ref, this._bookId) : super(const BookDetailState.initial());

  Future<void> initialize() async {
    state = const BookDetailState.initial();

    try {
      final book = await _ref.read(bookRepository).getBook(_bookId);
      state = BookDetailState.loaded(book);
    } on NetworkExceptions catch (e) {
      state = BookDetailState.error(e.message);
    }
  }
}