import 'package:book_store/core/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookDetailViewModel =
    ChangeNotifierProvider.autoDispose((ref) => BookDetailViewModel());

class BookDetailViewModel extends ChangeNotifier {
  void pinjamBuku(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: orange500Color,
      content: Text('Stok buku sedang kosong'),
    ));
  } 
}
