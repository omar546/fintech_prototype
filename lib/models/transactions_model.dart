import 'package:flutter/cupertino.dart';

class TransactionModel {
  final String title;
  final String type;
  final double amount;
  final IconData icon;
  final Color iconColor;
  final Color iconShade;

  TransactionModel(this.title, this.type, this.amount, this.icon,
      this.iconColor, this.iconShade);
}
