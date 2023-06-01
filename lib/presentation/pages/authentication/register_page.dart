import 'package:book_store/core/themes/theme.dart';
import 'package:book_store/presentation/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import 'viewmodels/register_viewmodel.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daftar Akun',
              style: TextStyle(
                fontFamily: 'Playfair Display',
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Nama Lengkap',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan nama lengkap',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan alamat email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Masukkan password'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Konfirmasi Password',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Konfirmasi password'),
            ),
            const SizedBox(height: 24),
            if (ref.watch(registerViewModel).isLoading)
              const RoundedButton(
                label: 'Loading',
                enabled: false,
              ).constrained(width: size.width)
            else
              RoundedButton(
                onPressed: () {
                  ref.read(registerViewModel).register(context);
                },
                label: 'Daftar',
              ).constrained(width: size.width),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  'Sudah mempunyai akun?',
                  style: TextStyle(color: grey500Color),
                ),
                const SizedBox(width: 4),
                InkResponse(
                  onTap: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
