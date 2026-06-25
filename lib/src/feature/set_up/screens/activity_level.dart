import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/router/app_pages.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/core/widget/blur_botton.dart';
import 'package:fitness/src/feature/set_up/cubit/set_up_cubit.dart';
import 'package:fitness/src/feature/set_up/cubit/set_up_state.dart';
import 'package:fitness/src/feature/set_up/widget/knopka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ActivityLevel extends StatefulWidget {
  const ActivityLevel({super.key});

  @override
  State<ActivityLevel> createState() => _ActivityLevelState();
}

class _ActivityLevelState extends State<ActivityLevel> {
  List<String> buttonText = ['Beginner', "Intermediet", "Advanced"];

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
      body: BlocConsumer<SetUpCubit, SetUpState>(
        listener: (context, state) {
          if (state.status == SetUpStatus.success) {
            Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Center(
                child: Text(
                  'Physical Activity Level',
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
              SizedBox(height: 114),
              Knopka(text: buttonText[0]),
              SizedBox(height: 36),
              Knopka(text: buttonText[1]),
              SizedBox(height: 36),
              Knopka(text: buttonText[2]),
              SizedBox(height: 114),
              state.status == SetUpStatus.loading
                  ? Center(child: CircularProgressIndicator())
                  : BlurBotton(
                      backcolor: AppColors.grey,
                      text: 'Continue',
                      bordercolor: AppColors.white,
                      onPressed: () {
                          context.read<SetUpCubit>().sendInfo();
                    Navigator.pushNamed(context, AppPages.main)  ;
                             
                      },
                    ),
            ],
          );
        },
      ),
    );
  }
}
