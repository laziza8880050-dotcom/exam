import 'package:animate_do/animate_do.dart';
import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/feature/on_boarding/screens/on_boarding_1.dart';
import 'package:flutter/material.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
       Future.delayed(const Duration(seconds: 5),(){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OnBoarding1()));
            });
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://plus.unsplash.com/premium_photo-1661582233706-fbdca649e3bd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 326),
             SlideInUp(
              child: Text(
                'Welcome to',
                style: context.customTextStyle(
                  color: AppColors.yellow,
                  weight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(height: 18,),
            SlideInLeft(child: Image.asset('assets/images/fb.png',height: 84,width: 182,)),
       
            SlideInLeft(child: Image.asset('assets/images/FITBODY.png',height: 84,width: 182,)),
         
          ],
        ),
      ),
    );
  }
}
