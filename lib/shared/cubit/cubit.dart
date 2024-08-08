import 'package:fintech_prototype/modules/stats_screen.dart';
import 'package:fintech_prototype/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/home_screen.dart';
import '../../modules/profile_screen.dart';
import '../../modules/wallet_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(BuildContext context) => BlocProvider.of<AppCubit>(context);
  //VARS
  var currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const WalletScreen(),
    const StatsScreen(),
    const ProfileScreen(),
  ];
  //NAV
  Future<void> changeBottomNavBarState(index) async {
    if (index != currentIndex) {
    currentIndex = index;
    emit(AppChangeNavBarState());
    }
  }
}
