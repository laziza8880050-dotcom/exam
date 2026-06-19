
import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/router/app_pages.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/core/widget/blur_botton.dart';
import 'package:fitness/src/feature/set_up/cubit/set_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:numberpicker/numberpicker.dart';

class Old extends StatefulWidget {
  const Old({super.key});

  @override
  State<Old> createState() => _OldState();
}

class _OldState extends State<Old> {
  int _currentValue = 1;

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
              'How Old Are You?',
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
          SizedBox(height: 87),
          Center(
            child: Text(
              ' $_currentValue',
              style: context.customTextStyle(
                fontSize: 64,
                weight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(height: 33),
          Center(child: SvgPicture.asset('assets/icons/tri.svg')),
          SizedBox(height: 23),

          Row(
            children: [
              Container(height: 99, width: 110, color: AppColors.primary),
              Center(
                child: Container(
                  height: 99,
                  width: 200,
                  color: AppColors.primary,
                  child: NumberPicker(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColors.white, width: 2),
                    ),
                    axis: Axis.horizontal,
                    itemWidth: 65,

                    textStyle: context.customTextStyle(
                      fontSize: 25,
                      color: AppColors.fioletoviy,
                      weight: FontWeight.bold,
                    ),
                    value: _currentValue,
                    minValue: 18,
                    maxValue: 100,
                    onChanged: (value) => setState(() => _currentValue = value),
                  ),
                ),
              ),
              Container(height: 99, width: 101, color: AppColors.primary),
            ],
          ),
          SizedBox(height: 200),
          BlurBotton(
            backcolor: AppColors.grey,
            text: 'Continue',
            bordercolor: AppColors.white,
            onPressed: () {
              context.read<SetUpCubit>().collectInfo(
                key: 'old',
                value: _currentValue,
              );
              Navigator.pushNamed(context, AppPages.yourwidth);
            },
          ),
        ],
      ),
    );
  }
}
