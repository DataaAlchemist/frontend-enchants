import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../core/themes/theme.dart';
import '../notifiers/bottom_nav/bottom_nav_notifier.dart';
import 'home/home_page.dart';
import 'mybook/mybook_page.dart';
import 'profile/profile_page.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bottomNavNotifier);

    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      body: PageView(
        controller: state.controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          MyBookPage(),
          ProfilePage(),
        ],
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          state.changeIndex(index);
        },
        currentIndex: state.index,
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: grey500Color,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: primaryColor,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: grey500Color,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.home, style: HeroIconStyle.solid),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.bookOpen, style: HeroIconStyle.solid),
            label: 'Buku Saya',
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.user, style: HeroIconStyle.solid),
            label: 'Akun',
          ),
        ],
      ).boxShadow(
        color: Colors.black.withOpacity(.08),
        offset: const Offset(0, -2),
        blurRadius: 2,
      ),
    );
  }
}

