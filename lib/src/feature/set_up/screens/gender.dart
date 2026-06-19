import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/router/app_pages.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/core/widget/blur_botton.dart';
import 'package:fitness/src/feature/set_up/cubit/set_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  bool bosildimiMale = false;
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
              'Whats Your Gender',
              style: context.customTextStyle(
                fontSize: 25,
                weight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(height: 14),
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
          SizedBox(height: 46),
          CircleAvatar(
            radius: 100,
            backgroundColor: AppColors.white,
            child: InkWell(
              onTap: () {
                setState(() {
                  bosildimiMale = !bosildimiMale;
                });
              },
              child: CircleAvatar(
                radius: 99,
                backgroundColor: bosildimiMale
                    ? AppColors.yellow
                    : AppColors.black,
                child: Icon(
                  Icons.male,
                  size: 150,
                  color: bosildimiMale ? AppColors.black1 : AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Male',
            style: context.customTextStyle(
              fontSize: 20,
              weight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 19),
          CircleAvatar(
            radius: 100,
            backgroundColor: AppColors.white,
            child: InkWell(
              onTap: () {
                setState(() {
                  bosildimiMale = false;
                });
              },
              child: CircleAvatar(
                radius: 99,
                backgroundColor: bosildimiMale == false
                    ? AppColors.yellow
                    : AppColors.black,
                child: Icon(
                  Icons.female,
                  size: 150,
                  color: bosildimiMale == false ? AppColors.black1 : AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Female',
            style: context.customTextStyle(
              fontSize: 20,
              weight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 5),
          BlurBotton(
            backcolor: AppColors.grey,
            text: 'Continue',
            bordercolor: AppColors.white,
            onPressed: () {
              context.read<SetUpCubit>().collectInfo(
                key: "gender",
                value: bosildimiMale == true ? "Male" : "Female",
              );
              Navigator.pushNamed(context, AppPages.old);
            },
          ),
        ],
      ),
    );
  }
}
