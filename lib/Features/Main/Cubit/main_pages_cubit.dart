import 'package:bloc/bloc.dart';
import '../../../Core/Resources/strings.dart';
import '../../Favourites/favourites_page.dart';
import '../../Profile/user_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../home/home_page.dart';

part 'main_pages_state.dart';

class MainPagesCubit extends Cubit<MainPagesState> with WidgetsBindingObserver {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _subscription;
  MainPagesCubit() : super(MainPagesState()) {
    WidgetsBinding.instance.addObserver(this);
    _monitorConnection();
  }
  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    _subscription.cancel();
    return super.close();
  }

  void changeIndex(int index) {
    emit(state.copyWith(index: index));
  }

  Widget listScreens() {
    Widget widget(int index) => Center(child: Text(index.toString()));
    switch (state.index) {
      case 0:
        return HomePage();
      case 1:
        return FavouritesPage();
      case 2:
        return widget(404);
      case 3:
        return ProfilePage();
      default:
        return widget(404);
    }
  }

  String listScreensName() {
    switch (state.index) {
      case 0:
        return AppStrings.home;
      case 1:
        return AppStrings.favorite;
      case 2:
        return AppStrings.maps;
      case 3:
        return AppStrings.profile;
      default:
        return "";
    }
  }

  void _monitorConnection() {
    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result.isEmpty || result.contains(ConnectivityResult.none)) {
        emit(state.copyWith(internet: false));
      } else {
        emit(state.copyWith(internet: true));
      }
    });
  }

  bool getConnectivity() => state.internet;
}
