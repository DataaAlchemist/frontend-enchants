import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../widgets/books/book_card.dart';
import '../../widgets/rounded_button.dart';
import '../home/viewmodels/recommended_notifier.dart';
import 'viewmodel/book_detail_viewmodel.dart';

class BookDetailArgs {
  final String bookId;

  const BookDetailArgs(this.bookId);
}

class BookDetailPage extends ConsumerStatefulWidget {
  const BookDetailPage({super.key});

  @override
  ConsumerState<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends ConsumerState<BookDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)!.settings.arguments as BookDetailArgs;
      ref.read(bookDetailViewModel(args.bookId).notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as BookDetailArgs;
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: grey900Color,
        leading: const BackButton().padding(left: 4),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const HeroIcon(
              HeroIcons.bookmark,
              style: HeroIconStyle.outline,
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Tersedia', style: TextStyle(fontSize: 12)),
                Text(
                  '4 Buku',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            RoundedButton(
              onPressed: () {
                // ref.read(bookDetailViewModel).pinjamBuku(context);
              },
              label: 'Pinjam Buku',
              horizontalPadding: 40,
            )
          ],
        )
            .padding(horizontal: 20, vertical: 12)
            .decorated(color: Colors.white)
            .boxShadow(
              offset: const Offset(0, -2),
              blurRadius: 2,
              color: Colors.black.withOpacity(0.1),
            ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final vm =
              ref.watch(bookDetailViewModel(args.bookId)) as BookDetailState;

          return vm.when(
            initial: () => _buildLoadingState(),
            loaded: (book) {
              return RefreshIndicator(
                onRefresh: ref
                    .read(bookDetailViewModel(args.bookId).notifier)
                    .initialize,
                displacement: 32 + mediaQuery.padding.top,
                edgeOffset: 32 + mediaQuery.padding.top,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 221,
                            height: 338,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius),
                              image: DecorationImage(
                                image: NetworkImage(book.image),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 7),
                                  blurRadius: 14,
                                  color: Colors.black.withOpacity(0.1),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            book.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Playfair Display',
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ).padding(horizontal: 20),
                          const SizedBox(height: 4),
                          Text(
                            book.author.name,
                            style: const TextStyle(
                              color: grey500Color,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HeroIcon(
                                HeroIcons.star,
                                color: yellowColor,
                                style: HeroIconStyle.solid,
                                size: 20,
                              ),
                              SizedBox(width: 4),
                              HeroIcon(
                                HeroIcons.star,
                                color: yellowColor,
                                style: HeroIconStyle.solid,
                                size: 20,
                              ),
                              SizedBox(width: 4),
                              HeroIcon(
                                HeroIcons.star,
                                color: yellowColor,
                                style: HeroIconStyle.solid,
                                size: 20,
                              ),
                              SizedBox(width: 4),
                              HeroIcon(
                                HeroIcons.star,
                                color: yellowColor,
                                style: HeroIconStyle.solid,
                                size: 20,
                              ),
                              SizedBox(width: 4),
                              HeroIcon(
                                HeroIcons.star,
                                color: yellowColor,
                                style: HeroIconStyle.solid,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text('4.8 (4K)'),
                            ],
                          ),
                        ],
                      ).center(),
                      const SizedBox(height: 24),
                      const Text(
                        'Sinopsis',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ).padding(horizontal: 20),
                      const SizedBox(height: 6),
                      Text(
                        book.description,
                        style: const TextStyle(color: grey700Color),
                      ).padding(horizontal: 20),
                      const SizedBox(height: 16),
                      const Text(
                        'Tentang penulis',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ).padding(horizontal: 20),
                      const SizedBox(height: 6),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        style: TextStyle(color: grey700Color),
                      ).padding(horizontal: 20),
                      const SizedBox(height: 16),
                      const Text(
                        'Mungkin anda juga suka',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ).padding(horizontal: 20),
                      const SizedBox(height: 12),
                      ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final book =
                              ref.watch(recommendedNotifier).items[index];
                          return BookCard(
                            onPressed: () {
                              // Navigator.pushNamed(
                              //   context,
                              //   '/book/detail',
                              //   arguments: book,
                              // );
                            },
                            imageUrl: book.image,
                            title: book.title,
                            author: book.author.name,
                            rating: '5.0 (2.5K)',
                          ).padding(right: 16);
                        },
                        itemCount: ref.watch(recommendedNotifier).items.length,
                      ).height(316),
                      const SizedBox(height: 64),
                    ],
                  ),
                ),
              );
            },
            error: (message) {
              return Center(
                child: Text(message),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }
}
