import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class Info
 extends StatefulWidget {
  final String valuee;
  final String title;
  const Info
  ({super.key, required this.title, required this.valuee });

  @override
  State<Info> createState() => InfoState();
}

class InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return  Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
      widget.title,
        style: context.customTextStyle(fontSize: 20, weight: FontWeight.bold, color: AppColors.white)
      ),
      Text(
    widget.valuee,
        style: context.customTextStyle(fontSize: 20, weight: FontWeight.w500, color: AppColors.white)
      ),
    ],
  );
}


}