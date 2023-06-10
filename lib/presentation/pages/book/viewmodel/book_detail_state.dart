part of 'book_detail_viewmodel.dart';

@freezed
class BookDetailState with _$BookDetailState {
  const factory BookDetailState.initial() = _Initial;
  const factory BookDetailState.loaded(Book book) = _Loaded;
  const factory BookDetailState.error(String message) = _Error;
}
