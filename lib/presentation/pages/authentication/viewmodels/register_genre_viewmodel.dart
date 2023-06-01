import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../infrastructure/models/genre.dart';

final registerGenreViewModel =
    ChangeNotifierProvider.autoDispose((ref) => RegisterGenreViewModel());

class RegisterGenreViewModel extends ChangeNotifier {
  List<Genre> selectedGenre = <Genre>[];

  void addGenre(Genre genre) {
    if (selectedGenre.contains(genre)) {
      selectedGenre.remove(genre);
      notifyListeners();
      return;
    }
    
    selectedGenre.add(genre);
    notifyListeners();
  }
}
