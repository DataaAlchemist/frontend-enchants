part of 'book_detail_recommendations_viewmodel.dart';

@freezed
class BookDetailRecommendationsState with _$BookDetailRecommendationsState {
  const factory BookDetailRecommendationsState.initial() = _Initial;
  const factory BookDetailRecommendationsState.loaded(List<BookSearch> books) = _Loaded;
  const factory BookDetailRecommendationsState.error(String message) = _Error;
}
