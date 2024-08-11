import 'package:fintech_prototype/models/cards_model.dart';
import 'package:fintech_prototype/models/earnings_model.dart';
import 'package:fintech_prototype/models/transactions_model.dart';
import 'package:fintech_prototype/modules/stats_screen.dart';
import 'package:fintech_prototype/shared/cubit/states.dart';
import 'package:fintech_prototype/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/home_screen.dart';
import '../../modules/profile_screen.dart';
import '../../modules/wallet_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(BuildContext context) =>
      BlocProvider.of<AppCubit>(context);
  //VARS
  var currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const WalletScreen(),
    const StatsScreen(),
    const ProfileScreen(),
  ];

  //DUMMY TRANSACTIONS
  List<TransactionModel> transactions = [
    TransactionModel('Adobe Illustrator', 'Subscription fee', -32.00,
        Icons.laptop_rounded, Styles.yellowColor, Styles.yellowShadeColor),
    TransactionModel('Dribble', 'Subscription fee', -15.00,
        Icons.laptop_rounded, Styles.yellowColor, Styles.yellowShadeColor),
    TransactionModel('House', 'Saving', -50.00, Icons.file_download_outlined,
        Styles.purpleColor, Styles.purpleShadeColor),
    TransactionModel(
        'Sony Camera',
        'Shopping fee',
        -200.00,
        Icons.shopping_bag_outlined,
        Styles.violetColor,
        Styles.violetShadeColor),
    TransactionModel('Paypal', 'Salary', 32.00, Icons.credit_card_outlined,
        Styles.greenColor, Styles.greenShadeColor),
  ];

  //DUMMY EARNINGS
  List<EarningsModel> earnings = [
    EarningsModel('Upwork', 3000, Styles.redColor),
    EarningsModel('Freepik', 3000, Styles.pinkColor),
    EarningsModel('Envato', 2000, Styles.blueColor),
    EarningsModel('WWR', 3000, Styles.redColor),
    EarningsModel('Pexels', 2000, Styles.pinkColor),
    EarningsModel('Freelancer', 3000, Styles.blueColor),
  ];

  //DUMMY CARDS
  List<CardsModel> cards = [
    CardsModel('Client Name', 1234123412343456, 25000.40, '09/23', 'visa'),
    CardsModel(
        'Client Name', 5555666677778888, 11000.30, '08/21', 'mastercard'),
    CardsModel('Client Name', 9876987698769876, 25000.40, '09/23', 'visa'),
    CardsModel('Client Name', 4234123452543555, 2000.10, '05/13', 'mastercard'),
  ];

  //NAV
  Future<void> changeBottomNavBarState(index) async {
    if (index != currentIndex) {
      currentIndex = index;
      emit(AppChangeNavBarState());
    }
  }
}
