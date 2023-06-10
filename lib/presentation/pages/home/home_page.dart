import 'package:book_store/presentation/pages/book/book_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../widgets/books/book_card.dart';
import '../../widgets/books/shimmer_book_card.dart';
import '../../widgets/enchant_icon_button.dart';
import 'viewmodels/home_viewmodel.dart';
import 'viewmodels/recommended_notifier.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    ref.read(homeViewModel).initialize(this);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          Future.wait([
            ref.read(recommendedNotifier).fetch(),
          ]);
        },
        displacement: 32 + mediaQuery.padding.top,
        edgeOffset: 32 + mediaQuery.padding.top,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: mediaQuery.padding.top + 16),
              const Text(
                'Selamat Datang, Kinanti!',
                style: TextStyle(
                  color: grey500Color,
                  fontWeight: FontWeight.w500,
                ),
              ).padding(horizontal: 20),
              const SizedBox(height: 2),
              Row(
                children: [
                  const Text(
                    'Apa yang ingin kamu baca hari ini?',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ),
                  ).expanded(),
                  EnchantIconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/notifications');
                    },
                    icon: Icons.notifications_rounded,
                  ),
                ],
              ).padding(horizontal: 20),
              const SizedBox(height: 24),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Cari',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search_rounded),
                ),
                textInputAction: TextInputAction.search,
              )
                  .padding(horizontal: 4, vertical: 2)
                  .decorated(
                    color: grey100Color.withOpacity(.4),
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                  )
                  .padding(horizontal: 20),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Rekomendasi',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ).expanded(),
                  InkResponse(
                    onTap: () {},
                    child: const Text(
                      'Lihat semua',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ).padding(horizontal: 20),
              const SizedBox(height: 16),
              if (ref.watch(recommendedNotifier).isLoading)
                ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const ShimmerBookCard().padding(right: 16);
                  },
                ).height(300)
              else
                ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final book = ref.watch(recommendedNotifier).items[index];
                    return BookCard(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/book/detail',
                          arguments: BookDetailArgs(book.isbn),
                        );
                      },
                      imageUrl: book.image,
                      title: book.title,
                      author: book.author.name,
                      rating: '5.0 (2.5K)',
                    ).padding(right: 16);
                  },
                  itemCount: ref.watch(recommendedNotifier).items.length,
                ).height(316),
              const SizedBox(height: 24),
              const Text(
                'Berdasarkan Genre',
                style: TextStyle(
                  fontFamily: 'Playfair Display',
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ).padding(horizontal: 20),
              const SizedBox(height: 12),
              TabBar(
                controller: ref.watch(homeViewModel).tabController,
                isScrollable: true,
                unselectedLabelColor: grey500Color,
                labelColor: Colors.black,
                indicatorColor: primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                labelPadding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16,
                ),
                splashFactory: NoSplash.splashFactory,
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Text('Novel'),
                  Text('Science'),
                  Text('Romantic'),
                ],
              ),
              const SizedBox(height: 16),
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  BookCard(
                    onPressed: () {},
                    imageUrl:
                        'https://cdnwpseller.gramedia.net/wp-content/uploads/2021/10/06103314/laut-bercerita.jpg',
                    title: 'Laut Bercerita',
                    author: 'Leila S. Chudori',
                    rating: '4.8 (2.5k)',
                  ).padding(right: 16),
                  BookCard(
                    onPressed: () {},
                    imageUrl:
                        'https://m.media-amazon.com/images/I/41Ds5rRv+2L.jpg',
                    title: 'The Psychology of Money',
                    author: 'Morgan Housel',
                    rating: '4.8 (2.5k)',
                  ).padding(right: 16),
                  BookCard(
                    onPressed: () {},
                    imageUrl:
                        'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/2/14/3eab234a-1277-40f7-8015-ae51154efd2e.jpg.webp',
                    title: 'Atomic Habits',
                    author: 'James Clear',
                    rating: '4.8 (2.5k)',
                  ).padding(right: 16),
                ],
              ).height(320),
              const SizedBox(height: 128),
            ],
          ),
        ),
      ),
    );
  }
}
