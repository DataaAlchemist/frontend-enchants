import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/exceptions/network_exceptions.dart';
import '../../../../infrastructure/models/book/book_search.dart';
import '../../../../infrastructure/repositories/book_repository.dart';

part 'book_detail_recommendations_state.dart';
part 'book_detail_recommendations_viewmodel.freezed.dart';

final bookDetailRecommendationsViewModel = StateNotifierProvider.family<
    BookDetailRecommendationsViewModel,
    BookDetailRecommendationsState,
    String>((ref, String bookId) {
  return BookDetailRecommendationsViewModel(ref, bookId);
});

class BookDetailRecommendationsViewModel
    extends StateNotifier<BookDetailRecommendationsState> {
  final Ref _ref;
  final String _bookId;

  BookDetailRecommendationsViewModel(this._ref, this._bookId)
      : super(const BookDetailRecommendationsState.initial());

  Future<void> initialize() async {
    state = const BookDetailRecommendationsState.initial();

    try {
      final books = await _ref.read(bookRepository).getSimilarBooks(_bookId);
      state = BookDetailRecommendationsState.loaded(books);
    } on NetworkExceptions catch (e) {
      state = BookDetailRecommendationsState.error(e.message);
    }
  }
}
