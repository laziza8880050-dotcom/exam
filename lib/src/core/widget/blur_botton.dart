import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class BlurBotton extends StatelessWidget {
  final Color backcolor;
  final String text;
  final Color bordercolor;
  final void Function()? onPressed;
  const BlurBotton({
    super.key,
    required this.backcolor,
    required this.text,
    required this.bordercolor,
    required  this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(211, 44),
        backgroundColor: backcolor.withOpacity(0.30),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: bordercolor.withOpacity(0.4)),
        ),
      ),
      child: Text(
        text,
        style: context.customTextStyle(
          fontSize: 18,
          color: AppColors.white,
          weight: FontWeight.bold,
        ),
      ),
    );
  }
}
