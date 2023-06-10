import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../widgets/books/book_card.dart';
import '../../../widgets/books/shimmer_book_card.dart';
import '../viewmodels/recommended_notifier.dart';

class HomeRecommendedBooks extends ConsumerStatefulWidget {
  const HomeRecommendedBooks({super.key});

  @override
  ConsumerState<HomeRecommendedBooks> createState() =>
      _HomeRecommendedBooksState();
}

class _HomeRecommendedBooksState extends ConsumerState<HomeRecommendedBooks> {
  @override
  Widget build(BuildContext context) {
    if (ref.watch(recommendedNotifier).isLoading) {
      return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ShimmerBookCard().padding(right: 16);
        },
      ).height(300);
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final book = ref.watch(recommendedNotifier).items[index];
        return BookCard(
          onPressed: () {
            // Navigator.pushNamed(
            //   context,
            //   '/book/detail',
            //   arguments: book,
            // );
          },
          imageUrl: book.image ?? '',
          title: book.title,
          author: book.author.name,
          rating: '5.0 (2.5K)',
        ).padding(right: 16);
      },
      itemCount: ref.watch(recommendedNotifier).items.length,
    ).height(316);
  }
}
