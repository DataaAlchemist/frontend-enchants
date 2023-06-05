import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: grey900Color,
        leading: const BackButton().padding(left: 4),
        centerTitle: false,
        title: const Text(
          'Notifikasi',
          style: TextStyle(
            fontFamily: 'Playfair Display',
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
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
              'Kamu belum memiliki notifikasi',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: grey700Color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
