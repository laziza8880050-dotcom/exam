
import 'package:animate_do/animate_do.dart';
import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/router/app_pages.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/core/widget/blur_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoarding3 extends StatefulWidget {
  const OnBoarding3({super.key});

  @override
  State<OnBoarding3> createState() => _OnBoarding3State();
}

class _OnBoarding3State extends State<OnBoarding3> {
  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://media.istockphoto.com/id/1300412259/photo/runner-in-an-athletics-track.jpg?s=2048x2048&w=is&k=20&c=8HlZQzDs5qoOqpqLXLS6ImcJZ2G-zpYUKVZXjOGcBp0=',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 350),
             SlideInLeft(
              child: Container(
                height: 169,
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.primary),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    SvgPicture.asset('assets/icons/person.svg'),
                    Text(
                      'A community for You, \n   Challenge Yourself',
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
              SizedBox(height: 18,),
                   SlideInDown(child: BlurBotton(backcolor: AppColors.grey, text: 'Next', bordercolor: AppColors.white, onPressed:(){Navigator.pushNamed(context, AppPages.signup);}))
         
          ],
        ),
      ),
    );
  }
}
