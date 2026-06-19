import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/router/app_pages.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/core/widget/blur_botton.dart';
import 'package:flutter/material.dart';

class SetUp extends StatefulWidget {
  const SetUp({super.key});

  @override
  State<SetUp> createState() => _SetUpState();
}

class _SetUpState extends State<SetUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.5,
            width: double.infinity,
            color: AppColors.primary,
            child: Image.asset('assets/images/opacha.png', fit: BoxFit.cover),
          ),
          SizedBox(height: 32),
          Text(
            '    Consistency Is \nThe Key To progress.\n     Dont Give Up!',
            style: context.customTextStyle(
              fontSize: 30,
              weight: FontWeight.w500,
              color: AppColors.yellow,
            ),
          ),
          SizedBox(height: 33),
          Container(
            height: 116,
            width: double.infinity,
            color: AppColors.primary,
            child: Center(
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore \n                                    magna aliqua. ',
                style: context.customTextStyle(
                  fontSize: 12,
                  color: AppColors.black1,
                ),
              ),
            ),
          ),
          SizedBox(height: 42,),
          BlurBotton(
              backcolor: AppColors.grey,
              text: 'Next',
              bordercolor: AppColors.white,
              onPressed: () {
                  Navigator.pushNamed(context, AppPages.gender); 
                
              
              },
            ),
        ],
      ),
    );
  }
}
