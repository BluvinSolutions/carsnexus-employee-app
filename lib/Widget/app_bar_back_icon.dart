import 'package:voyzo_employee/Theme/Theme.dart';
import 'package:voyzo_employee/Theme/colors.dart';
import 'package:flutter/material.dart';

class AppBarBack extends StatelessWidget {
  const AppBarBack({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 5),
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 11, right: 5),
        decoration: BoxDecoration(borderRadius: AppBorderRadius.k10, border: Border.all(color: AppColors.stroke)),
        child: const Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: AppColors.icon,
        ),
      ),
    );
  }
}
