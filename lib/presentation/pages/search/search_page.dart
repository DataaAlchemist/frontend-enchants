import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../../infrastructure/models/book/book_search.dart';
import 'viewmodels/search_viewmodel.dart';

class SearchArgs {
  final String query;

  const SearchArgs(this.query);
}

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SearchArgs?;
    final vm = ref.watch(searchViewModel);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          args!.query,
          style: const TextStyle(
            fontFamily: 'Playfair Display',
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: grey900Color,
      ),
      body: vm.when(
        initial: () {
          ref.read(searchViewModel.notifier).search(args.query);

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        loaded: (books) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            itemCount: books.length,
            itemBuilder: (context, index) {
              return _buildBookList(books[index]);
            },
          );
        },
        error: (message) {
          return Center(
            child: Text(
              message,
              style: const TextStyle(color: grey500Color),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBookList(BookSearch book) {
    return Row(
      children: [
        Container(
          width: 120,
          height: 120 * 1.5,
          decoration: BoxDecoration(
            color: grey100Color,
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff06070D).withOpacity(.12),
                offset: const Offset(0, 7),
                blurRadius: 14,
              )
            ],
            image: DecorationImage(
              image: NetworkImage(book.image),
              fit: BoxFit.cover,
            )
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              book.author,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: grey500Color,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.star_rounded, color: yellowColor, size: 20),
                const SizedBox(width: 2),
                Text(
                  '4.9 (${book.ratingsCount})',
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              book.description,
              style: const TextStyle(
                color: grey500Color,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ).expanded(),
      ],
    ).padding(bottom: 16);
  }
}
