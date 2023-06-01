import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModel = ChangeNotifierProvider.autoDispose<HomeViewModel>((ref) {
  return HomeViewModel();
});


class HomeViewModel extends ChangeNotifier {
  late TabController tabController;

  void initialize(TickerProvider provider) {
    tabController = TabController(length: 3, vsync: provider);
    notifyListeners();
  }
}