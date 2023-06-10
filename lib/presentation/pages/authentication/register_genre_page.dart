import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../widgets/enchant_chip.dart';
import '../../widgets/rounded_button.dart';
import 'viewmodels/register_viewmodel.dart';

class RegisterGenrePage extends ConsumerStatefulWidget {
  const RegisterGenrePage({super.key});

  @override
  ConsumerState<RegisterGenrePage> createState() => _RegisterGenrePageState();
}

class _RegisterGenrePageState extends ConsumerState<RegisterGenrePage> {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: const BackButton(color: grey900Color),
      ),
      bottomNavigationBar: RoundedButton(
        onPressed: () {
          ref.read(registerViewModel).createAccount(context);
        },
        label: 'Buat Akun Saya',
        enabled: ref.watch(registerViewModel).selectedGenre.length >= 3,
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
            if (ref.watch(registerViewModel).isLoading)
              const CircularProgressIndicator()
            else
              Wrap(
                spacing: 8,
                runSpacing: 12,
                children: ref.watch(registerViewModel).genres.map((genre) {
                  return EnchantChip(
                    onPressed: () {
                      ref.read(registerViewModel).addGenre(genre);
                    },
                    label: genre.genre,
                    isActive: ref
                        .watch(registerViewModel)
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
