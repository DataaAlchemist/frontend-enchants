import 'dart:math';

import 'package:book_store/core/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginViewModel =
    ChangeNotifierProvider.autoDispose((ref) => LoginViewModel());

class LoginViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool isObscured = true;

  void toggleObscure() {
    isObscured = !isObscured;
    notifyListeners();
  }

  void login(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    isLoading = false;
    notifyListeners();

    // ignore: use_build_context_synchronously

    if (Random().nextBool()) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, '/home');
      return;
    }
    
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: orange500Color,
      content: Text('Akun anda belum terdaftar'),
    ));
  }
}
