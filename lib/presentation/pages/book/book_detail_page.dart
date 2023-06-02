import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../widgets/rounded_button.dart';
import 'viewmodel/book_detail_viewmodel.dart';

class BookDetailPage extends ConsumerStatefulWidget {
  const BookDetailPage({super.key});

  @override
  ConsumerState<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends ConsumerState<BookDetailPage> {
  @override
  Widget build(BuildContext context) {
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
                ref.read(bookDetailViewModel).pinjamBuku(context);
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
      body: SingleChildScrollView(
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
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://cdnwpseller.gramedia.net/wp-content/uploads/2021/10/06103314/laut-bercerita.jpg'),
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
                const Text(
                  'Laut Bercerita',
                  style: TextStyle(
                    fontFamily: 'Playfair Display',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Leila S. Chudori',
                  style: TextStyle(
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ).padding(horizontal: 20),
            const SizedBox(height: 6),
            const Text(
              'Laut Bercerita, novel terbaru Leila S. Chudori, bertutur tentang kisah keluarga yang kehilangan, sekumpulan sahabat yang merasakan kekosongan di dada, sekelompok orang yang gemar menyiksa dan lancar berkhianat, sejumlah keluarga yang mencari kejelasan akan anaknya, dan tentang cinta yang tak akan luntur.',
              style: TextStyle(color: grey700Color),
            ).padding(horizontal: 20),
            const SizedBox(height: 16),
            const Text(
              'Tentang Penulis',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ).padding(horizontal: 20),
            const SizedBox(height: 6),
            const Text(
              'Leila Salikha Chudori adalah penulis Indonesia yang menghasilkan berbagai karya cerita pendek, novel, dan skenario drama televisi. Leila S. Chudori bercerita tentang kejujuran, keyakinan, dan tekad, prinsip dan pengorbanan.',
              style: TextStyle(color: grey700Color),
            ).padding(horizontal: 20),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
