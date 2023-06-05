import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';
import '../../widgets/rounded_button.dart';
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
        leading: const BackButton(color: grey900Color),
      ),
      body: Form(
        key: ref.watch(registerViewModel).formKey,
        child: SingleChildScrollView(
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
              TextFormField(
                validator: (String? name) {
                  if (name == null || name.isEmpty) {
                    return 'Nama lengkap tidak boleh kosong';
                  }

                  return null;
                },
                onSaved: (String? name) {
                  ref.read(registerViewModel).fullname = name!;
                },
                decoration: const InputDecoration(
                  hintText: 'Masukkan nama lengkap',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Usia',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              DropdownSearch<int>(
                validator: (int? usia) {
                  if (usia == null) {
                    return 'Pilih usia terlebih dahulu';
                  }

                  return null;
                },
                items: ref.watch(registerViewModel).ages,
                selectedItem: ref.watch(registerViewModel).selectedAge,
                onChanged: (value) {
                  ref.read(registerViewModel).selectedAge = value!;
                },
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    hintText: 'Pilih usia',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Alamat',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              TextFormField(
                validator: (String? address) {
                  if (address == null || address.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }

                  return null;
                },
                onSaved: (String? address) {
                  ref.read(registerViewModel).address = address!;
                },
                decoration: const InputDecoration(
                  hintText: 'Masukkan alamat',
                ),
                maxLines: 2,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 16),
              const Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              TextFormField(
                validator: (String? email) {
                  if (email == null || email.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }

                  // check email format using regex
                  if (!RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$')
                      .hasMatch(email)) {
                    return 'Format email tidak valid';
                  }

                  return null;
                },
                onSaved: (String? email) {
                  ref.read(registerViewModel).email = email!;
                },
                decoration: const InputDecoration(
                  hintText: 'Masukkan alamat email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              TextFormField(
                validator: (String? password) {
                  if (password == null || password.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }

                  // contains at least one uppercase letter, one lowercase letter and one number
                  if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{3,}$')
                      .hasMatch(password)) {
                    return 'Harus mengandung huruf besar, huruf kecil dan angka';
                  }

                  return null;
                },
                onSaved: (String? password) {
                  ref.read(registerViewModel).password = password!;
                },
                onChanged: (String? password) {
                  ref.read(registerViewModel).password = password!;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Masukkan password',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Konfirmasi Password',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              TextFormField(
                validator: (String? password) {
                  if (password == null || password.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }

                  if (password != ref.read(registerViewModel).password) {
                    return 'Konfirmasi password harus sesuai dengan password';
                  }

                  return null;
                },
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Konfirmasi password'),
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
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}
