import 'package:book_store/presentation/pages/authentication/viewmodels/register_genre_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../../infrastructure/models/genre.dart';
import '../../widgets/enchant_chip.dart';
import '../../widgets/rounded_button.dart';

class RegisterGenrePage extends ConsumerStatefulWidget {
  const RegisterGenrePage({super.key});

  @override
  ConsumerState<RegisterGenrePage> createState() => _RegisterGenrePageState();
}

class _RegisterGenrePageState extends ConsumerState<RegisterGenrePage> {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    // final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: grey900Color,
        ),
      ),
      bottomNavigationBar: RoundedButton(
        onPressed: () {},
        label: 'Buat Akun Saya',
        enabled: ref.watch(registerGenreViewModel).selectedGenre.length >= 3,
      )
          .boxShadow(
            offset: const Offset(0, 2),
            blurRadius: 8,
            color: Colors.black.withOpacity(.2),
          )
          .padding(bottom: padding.bottom + 16, horizontal: 20),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Genre\nFavorit',
              style: TextStyle(
                fontFamily: 'Playfair Display',
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pilih minimal 3 genre yang kamu sukai',
              style: TextStyle(color: grey500Color),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: genreList.map((genre) {
                return EnchantChip(
                  onPressed: () {
                    ref.read(registerGenreViewModel).addGenre(genre);
                  },
                  label: genre.name,
                  isActive: ref
                      .watch(registerGenreViewModel)
                      .selectedGenre
                      .contains(genre),
                );
              }).toList(),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 64 + 16),
          ],
        ),
      ),
    );
  }
}
