import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/exceptions/network_exceptions.dart';
import '../../../../infrastructure/models/book/book_genre.dart';
import '../../../../infrastructure/repositories/authentication_repository.dart';
import '../../../../infrastructure/repositories/genre_repository.dart';

final registerViewModel =
    ChangeNotifierProvider.autoDispose((ref) => RegisterViewModel(ref));

class RegisterViewModel extends ChangeNotifier {
  final Ref _ref;

  RegisterViewModel(this._ref) {
    for (var i = 11; i <= 100; i++) {
      ages.add(i);
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;

  List<int> ages = [];
  List<BookGenre> genres = [];

  String? fullname;
  int? selectedAge;
  String? address;
  String? email;
  String? password;
  String? confirmPassword;

  List<BookGenre> selectedGenre = <BookGenre>[];

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

    formKey.currentState!.save();

    isLoading = true;
    notifyListeners();

    try {
      final response =
          await _ref.read(authenticationRepository).checkEmail(email!);

      if (!response) {
        isLoading = false;
        notifyListeners();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email sudah terdaftar'),
          ),
        );

        return;
      }

      isLoading = false;
      notifyListeners();

      fetchGenres(context);
      Navigator.pushNamed(context, '/register/genre');
    } on NetworkExceptions catch (e) {
      isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
        ),
      );
    }
  }

  void fetchGenres(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _ref.read(genreRepository).getGenres();

      genres = response;
      notifyListeners();
    } on NetworkExceptions catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
        ),
      );
    }

    isLoading = false;
    notifyListeners();
  }

  void addGenre(BookGenre genre) {
    if (selectedGenre.contains(genre)) {
      selectedGenre.remove(genre);
      notifyListeners();
      return;
    }

    selectedGenre.add(genre);
    notifyListeners();
  }

  void createAccount(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      await _ref.read(authenticationRepository).register(
            fullname: fullname!,
            age: selectedAge!,
            address: address!,
            email: email!,
            password: password!,
            interests: selectedGenre,
          );

      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }

    isLoading = false;
    notifyListeners();
  }
}
