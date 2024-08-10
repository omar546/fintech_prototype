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
