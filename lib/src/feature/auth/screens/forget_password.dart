
import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/core/widget/blur_botton.dart';
import 'package:fitness/src/feature/auth/cubit/auth_cubit.dart';
import 'package:fitness/src/feature/auth/cubit/auth_state.dart';
import 'package:fitness/src/feature/auth/validator/app_validator.dart';
import 'package:fitness/src/feature/auth/widget/form_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toastification/toastification.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leadingWidth: 24,
        centerTitle: true,
        title: Text(
          'Forgotten Password',
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
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.loaded) {
            toastification.show(context: context, type: ToastificationType.success, title: Text('Check your email !'));
            
          }else if(state.status == AuthStatus.error){
 toastification.show(context: context, type: ToastificationType.error, title: Text('xato'));
       
          }
        },
        child: Column(
          children: [
            SizedBox(height: 107),
            Center(
              child: Text(
                'Forgot Password?',
                style: context.customTextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  weight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 26),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, \nsed do eiusmod tempor incididunt ut labore et dolore \n                                      magna aliqua. ',
              style: context.customTextStyle(
                fontSize: 13,
                weight: FontWeight.w300,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 37),
            Container(
              height: 122,
              width: double.infinity,
              color: AppColors.primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 42),
                child: Column(
                  children: [
                    Spacer(),
                    FormText(
                      onFieldSubmitted: (email) {
                        context.read<AuthCubit>().forgetpassword(email: email);
                      },
                      textsverxu: 'Enter your email address',
                      textInputAction: TextInputAction.done,
                      obscureText: false,
                      controller: emailController,
                      validator: AppValidator.email,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 46),
            BlurBotton(
              backcolor: AppColors.black3,
              text: 'Continue',
              bordercolor: AppColors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
