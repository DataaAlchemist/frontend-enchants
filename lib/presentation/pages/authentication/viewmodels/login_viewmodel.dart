import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/exceptions/network_exceptions.dart';
import '../../../../core/themes/theme.dart';
import '../../../../infrastructure/repositories/authentication_repository.dart';

final loginViewModel =
    ChangeNotifierProvider.autoDispose((ref) => LoginViewModel(ref));

class LoginViewModel extends ChangeNotifier {
  final Ref _ref;

  LoginViewModel(this._ref);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isObscured = true;

  void toggleObscure() {
    isObscured = !isObscured;
    notifyListeners();
  }

  void login(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    
    isLoading = true;
    notifyListeners();

    try {
      await _ref.read(authenticationRepository).login(email: '', password: '');

      // reset password visibility
      isObscured = true;

      // navigate to home
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, '/home');
    } on NetworkExceptions catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: orange500Color,
        content: Text(e.message.toString()),
      ));
    }

    isLoading = false;
    notifyListeners();
  }
}
