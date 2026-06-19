import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/router/app_pages.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/core/widget/blur_botton.dart';
import 'package:fitness/src/feature/set_up/widget/stroka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  List<String> goals = [
    'Loose weight',
    'Gain weight',
    "Muscle mass gain",
    'Shape Body',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leadingWidth: 24,
        centerTitle: false,
        title: Text(
          'Back',
          style: context.customTextStyle(
            color: AppColors.yellow,
            fontSize: 20,
            weight: FontWeight.bold,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset('assets/icons/2.svg', width: 12, height: 12),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 36),
          Center(
            child: Text(
              'What Is Your Goal?',
              style: context.customTextStyle(
                fontSize: 25,
                weight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(height: 31),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore\n                                         magna aliqua. ',
            style: context.customTextStyle(
              fontSize: 14,
              weight: FontWeight.w400,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 36),
          Container(
            height: 450,
            width: 391,
            color: AppColors.primary,
            child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                goals.length,
                (index) => Stroka(nimauchun: goals[index], index: index),
              ),
            ),
          ),
          SizedBox(height: 40),
          BlurBotton(
            backcolor: AppColors.grey,
            text: 'Continue',
            bordercolor: AppColors.white,
            onPressed: () {
              Navigator.pushNamed(context, AppPages.level);
            },
          ),
        ],
      ),
    );
  }
}
 //RoundCheckBox(
        //      onTap: (selected) {},
          //  ),