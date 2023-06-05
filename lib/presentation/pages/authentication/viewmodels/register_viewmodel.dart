import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerViewModel =
    ChangeNotifierProvider.autoDispose((ref) => RegisterViewModel());

class RegisterViewModel extends ChangeNotifier {
  RegisterViewModel() {
    for (var i = 11; i <= 100; i++) {
      ages.add(i);
    }
  }
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;
  List<int> ages = [];

  String? fullname;
  int? selectedAge;
  String? address;
  String? email;
  String? password;
  String? confirmPassword;

  void togglePasswordObscure() {
    isPasswordObscured = !isPasswordObscured;
    notifyListeners();
  }

  void toggleConfirmPasswordObscure() {
    isConfirmPasswordObscured = !isConfirmPasswordObscured;
    notifyListeners();
  }

  void register(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading = true;
    notifyListeners();
    
    await Future.delayed(const Duration(seconds: 1));

    isLoading = false;
    notifyListeners();

    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/register/genre');
  }
}
