import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class Uppro extends StatelessWidget {
  const Uppro({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.yellow,
    padding: EdgeInsets.symmetric(
      
      horizontal: 30,
      vertical: 15,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  child: Text('update profile', style: context.customTextStyle(fontSize: 20, weight: FontWeight.w500, color: AppColors.black1),),
);
  }
}