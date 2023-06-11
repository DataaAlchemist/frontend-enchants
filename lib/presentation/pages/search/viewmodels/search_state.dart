part of 'search_viewmodel.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loaded(List<BookSearch> book) = _Loaded;
  const factory SearchState.error(String message) = _Error;
}
