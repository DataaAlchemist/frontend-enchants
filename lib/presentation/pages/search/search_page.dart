import 'package:book_store/core/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

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
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildBookList();
        },
      ),
    );
  }

  Widget _buildBookList() {
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
          ),
        ),
        const SizedBox(width: 16),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The Alchemist',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Paulo Coelho',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: grey500Color,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star_rounded, color: yellowColor, size: 20),
                SizedBox(width: 2),
                Text(
                  '4.9 (200K)',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.left,
                ),
                SizedBox(width: 8),
              ],
            ),
            SizedBox(height: 12),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nisi eget nunc ultricies aliquet.',
              style: TextStyle(
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
