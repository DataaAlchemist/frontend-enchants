import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/exceptions/network_exceptions.dart';
import '../../../../infrastructure/models/book/book_search.dart';
import '../../../../infrastructure/repositories/book_repository.dart';

part 'search_state.dart';
part 'search_viewmodel.freezed.dart';

final searchViewModel = StateNotifierProvider<SearchViewModel, SearchState>(
  (ref) => SearchViewModel(ref),
);

class SearchViewModel extends StateNotifier<SearchState> {
  final Ref _ref;
  
  SearchViewModel(this._ref) : super(const SearchState.initial());

  Future<void> search(String query) async {
    state = const SearchState.initial();

    try {
      final books = await _ref.read(bookRepository).searchBooks(query);

      state = SearchState.loaded(books);
    } on NetworkExceptions catch (e) {
      state = SearchState.error(e.message);
    }
  }
}
