import 'package:fintech_prototype/models/transactions_model.dart';
import 'package:fintech_prototype/shared/styles/colors.dart';
import 'package:flutter/material.dart';

Widget buildProfileButton(
        {required void Function() action,
        required IconData icon,
        required String text,
        Color? iconColor}) =>
    GestureDetector(
      onTap: action,
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                spreadRadius: 0,
                blurRadius: 3),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: iconColor,
            ),
            const SizedBox(height: 5),
            Text(text),
          ],
        ),
      ),
    );

Widget buildTransactionsList(List<TransactionModel> transactions) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              height: 64,
              width: 343,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: CircleAvatar(
                      backgroundColor: transactions[index].iconShade,
                      child: Icon(
                        transactions[index].icon,
                        size: 25,
                        color: transactions[index].iconColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions[index].title,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(transactions[index].type,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      transactions[index].amount < 0
                          ? '-\$${transactions[index].amount.abs()}'
                          : '\$${transactions[index].amount}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: transactions[index].amount > 0
                              ? Styles.positive
                              : Styles.negative,
                          fontSize: 17),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 12,
            );
          },
          itemCount: transactions.length),
    );
