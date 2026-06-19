import 'package:animate_do/animate_do.dart';
import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/router/app_pages.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/core/widget/blur_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoarding2 extends StatefulWidget {
  const OnBoarding2({super.key});

  @override
  State<OnBoarding2> createState() => _OnBoarding2State();
}

class _OnBoarding2State extends State<OnBoarding2> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://media.istockphoto.com/id/1368046748/photo/shot-of-an-attractive-young-woman-standing-and-leaning-on-her-kitchen-counter-while-enjoying.jpg?s=2048x2048&w=is&k=20&c=qPW3k8hcr9Pqc9iJycrzxKP-Y12T83ntWCqiPdwVcNc=',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
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
                    SvgPicture.asset('assets/icons/apple.svg'),
                    Text(
                      'Find nutrition tips that fit \n            your lifestyle',
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
                          width: 20,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == index
                                ?AppColors.white
                                : AppColors.fioletoviy,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
             SizedBox(height: 18,),
                   SlideInDown(child: BlurBotton(backcolor: AppColors.grey, text: 'Next', bordercolor: AppColors.white, onPressed:(){Navigator.pushNamed(context, AppPages.onboarding3);}))
          
          ],
        ),
      ),
    );
  }
}
