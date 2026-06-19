import 'package:animate_do/animate_do.dart';
import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/router/app_pages.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/core/widget/blur_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoarding1 extends StatefulWidget {  const OnBoarding1({super.key});

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1595078475328-1ab05d0a6a0e?q=80&w=700&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Spacer(),
                  InkWell(onTap: () {
                      Navigator.pushNamed(context, AppPages.signup); 
           
                  },
                    child: SafeArea(
                      child: Text(
                        'Skip',
                        style: context.customTextStyle(
                          fontSize: 18,
                          color: AppColors.yellow,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  SvgPicture.asset('assets/icons/Arrow.svg'),
                ],
              ),
            ),
            SizedBox(height: 350),
             SlideInLeft(
              child: Container(
                height: 169,
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.primary),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    SvgPicture.asset('assets/icons/run.svg'),
                    Text(
                      'Start your journey towards A\n          more active lifestyle',
                      style: context.customTextStyle(
                        fontSize: 20,
                        color: AppColors.white,
                        weight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 24,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == index
                                ? AppColors.white
                                : AppColors.fioletoviy,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 18),
             SlideInDown(
              child: BlurBotton(
                backcolor: AppColors.grey,
                text: 'Next',
                bordercolor: AppColors.white,
                onPressed: () {
                  Navigator.pushNamed(context, AppPages.onboarding2);
                },
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
