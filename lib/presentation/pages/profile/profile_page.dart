import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 60),
        child: SafeArea(
          child: const Text(
            'Akun',
            style: TextStyle(
              fontFamily: 'Playfair Display',
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ).padding(all: 16).border(bottom: 1, color: grey100Color),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: grey100Color,
                    borderRadius: BorderRadius.circular(120),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1545696968-1a5245650b36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1664&q=80',
                      ),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'sijohn@gmail.com',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 4),
                const Text(
                  '+62 81234567890',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildCardMenu(
              onTap: () {},
              label: 'Bookmark',
              leadingIcon: HeroIcons.bookmark,
              trailingIcon: HeroIcons.chevronRight,
            ),
            const SizedBox(height: 16),
            _buildCardMenu(
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      content: const Text('Are you sure you want to log out?'),
                      title: const Text('Confirm log out'),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                            Navigator.pushReplacementNamed(
                              context,
                              '/onboarding',
                            );
                          },
                          isDestructiveAction: true,
                          child: const Text('Log out'),
                        ),
                      ],
                    );
                  },
                );
              },
              label: 'Log out',
              leadingIcon: HeroIcons.arrowLeftOnRectangle,
              color: Colors.red[700]!,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardMenu({
    required String label,
    required HeroIcons leadingIcon,
    HeroIcons? trailingIcon,
    required Function() onTap,
    Color color = grey700Color,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(defaultBorderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        child: Row(
          children: [
            HeroIcon(leadingIcon, color: color, style: HeroIconStyle.solid),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
            const Spacer(),
            if (trailingIcon != null)
              HeroIcon(trailingIcon, color: Colors.blue),
          ],
        ).padding(all: 12),
      ),
    ).decorated(
      borderRadius: BorderRadius.circular(defaultBorderRadius),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 8,
          offset: const Offset(0, 2),
        )
      ],
    );
  }
}
