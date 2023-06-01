import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerViewModel =
    ChangeNotifierProvider.autoDispose((ref) => RegisterViewModel());

class RegisterViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;

  void togglePasswordObscure() {
    isPasswordObscured = !isPasswordObscured;
    notifyListeners();
  }

  void toggleConfirmPasswordObscure() {
    isConfirmPasswordObscured = !isConfirmPasswordObscured;
    notifyListeners();
  }

  void register(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    
    await Future.delayed(const Duration(seconds: 1));

    isLoading = false;
    notifyListeners();

    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/register/genre');
  }
}
