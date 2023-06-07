import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../core/themes/theme.dart';
import '../widgets/rounded_button.dart';
import '../widgets/secondary_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                Image(
                  image: const AssetImage('assets/study.png'),
                  width: size.width * 0.8,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Selamat Datang di Enchants',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ).padding(horizontal: 20),
                const SizedBox(height: 12),
                const Text(
                  'Semua buku favoritmu dalam satu tempat, baca buku apa pun, tinggal di rumah, saat bepergian, atau di mana pun.',
                  style: TextStyle(color: grey500Color),
                  textAlign: TextAlign.center,
                ).padding(horizontal: 20),
              ],
            ),
            const SizedBox(height: 32),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RoundedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  label: 'Daftar Akun',
                ).padding(horizontal: 20).constrained(width: size.width),
                const SizedBox(height: 12),
                SecondaryButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  label: 'Masuk',
                ).padding(horizontal: 20).constrained(width: size.width),
                const SizedBox(height: 12),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(color: grey500Color),
                    children: [
                      TextSpan(
                        text:
                            'Dengan masuk atau mendaftar, kamu telah menyetujui semua ',
                      ),
                      TextSpan(
                        text: 'syarat dan ketentuan',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(text: ' kami'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ],
        ),
      ).center(),
    );
  }
}
