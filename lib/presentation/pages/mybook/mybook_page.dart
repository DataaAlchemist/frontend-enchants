import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';

class MyBookPage extends StatefulWidget {
  const MyBookPage({super.key});

  @override
  State<MyBookPage> createState() => _MyBookPageState();
}

class _MyBookPageState extends State<MyBookPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 60),
        child: SafeArea(
          child: const Text(
            'Buku Saya',
            style: TextStyle(
              fontFamily: 'Playfair Display',
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ).padding(all: 16).border(bottom: 1, color: grey100Color),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeroIcon(
              HeroIcons.informationCircle,
              size: 48,
              color: grey500Color,
              style: HeroIconStyle.solid,
            ),
            SizedBox(height: 12),
            Text(
              'Maaf, fitur ini belum tersedia',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: grey700Color,
              ),
            ),
            SizedBox(height: 128),
          ],
        ),
      ),
    );
  }
}
