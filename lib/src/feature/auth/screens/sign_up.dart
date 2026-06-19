import 'package:animate_do/animate_do.dart';
import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/router/app_pages.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/core/widget/blur_botton.dart';
import 'package:fitness/src/feature/auth/cubit/auth_cubit.dart';
import 'package:fitness/src/feature/auth/cubit/auth_state.dart';
import 'package:fitness/src/feature/auth/validator/app_validator.dart';
import 'package:fitness/src/feature/auth/widget/form_text.dart';
import 'package:fitness/src/feature/set_up/cubit/set_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   TextEditingController  confirmpassword = TextEditingController();
   TextEditingController  nameController = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    confirmpassword.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leadingWidth: 24,
        centerTitle: true,
        title: Text(
          'Create Account',
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
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.status == AuthStatus.loaded) {
            Navigator.pushNamed(context, AppPages.setup);
          } else if (state.status == AuthStatus.error) {}
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Lets start!',
                    style: context.customTextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Container(
                  height: 474,
                  width: double.infinity,
                  color: AppColors.primary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 41),
                    child: Column(
                      children: [
                        SizedBox(height: 32),
                         SlideInLeft(
                          child: FormText(
                            controller: nameController,
                            obscureText: false,
                            keybordtype: TextInputType.name,
                            textsverxu: 'Full name',
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(height: 19),
                         SlideInLeft(
                          child: FormText(
                            controller: emailController,
                            validator: AppValidator.email,
                            obscureText: false,
                            keybordtype: TextInputType.emailAddress,
                            textsverxu: 'Email or Mobile Number',
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(height: 19),
                         SlideInLeft(
                          child: FormText(
                            controller: passwordController,
                            obscureText: true,
                            validator: AppValidator.password,
                            keybordtype: TextInputType.number,
                            textsverxu: 'Password',
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(height: 19),
                         SlideInLeft(
                          child: FormText(
                            obscureText: true,
                            keybordtype: TextInputType.number,
                            validator: AppValidator.confirm,
                          controller: confirmpassword,
                            textsverxu: ' Confirm Password',
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 26),
                Text(
                  'By continuing, you agree to',
                  style: context.customTextStyle(
                    fontSize: 13,
                    weight: FontWeight.w300,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: AlignmentGeometry.center,
                  child: Row(
                    children: [
                      Spacer(),
                      Center(
                        child: Text(
                          'Terms of Use',
                          style: context.customTextStyle(
                            fontSize: 13,
                            weight: FontWeight.w300,
                            color: AppColors.yellow,
                          ),
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        'and',
                        style: context.customTextStyle(
                          fontSize: 13,
                          weight: FontWeight.w300,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        'Privacy Policy.',
                        style: context.customTextStyle(
                          fontSize: 13,
                          weight: FontWeight.w300,
                          color: AppColors.yellow,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                state.status == AuthStatus.loading
                    ? Center(child: CircularProgressIndicator())
                    : BlurBotton(
                        backcolor: AppColors.black,
                        text: 'Sign Up',
                        bordercolor: AppColors.white,
                        onPressed: () {

                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().singUp(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            print(
                              '${emailController.text} and keldi ${passwordController.text}',
                            );
                          }
                          context.read<SetUpCubit>().collectInfo(
                key: "name",
                value: nameController.text,
              );
               Navigator.pushNamed(context, AppPages.setup); 
                

                        },
                      ),
                SizedBox(height: 19),
                Text(
                  'or sign up with',
                  style: context.customTextStyle(
                    fontSize: 13,
                    weight: FontWeight.w300,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 18),
                Row(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () {
                        context.read<AuthCubit>().singinwithgoogle();
                      },
                      child: SvgPicture.asset('assets/icons/google.svg'),
                    ),
                    SizedBox(width: 16),
                    SvgPicture.asset('assets/icons/f.svg'),
                    SizedBox(width: 16),
                    SvgPicture.asset('assets/icons/finger.svg'),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      'Already have an account?',
                      style: context.customTextStyle(
                        fontSize: 13,
                        weight: FontWeight.w300,
                        color: AppColors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppPages.login);
                      },
                      child: Text(
                        'Log in',
                        style: context.customTextStyle(
                          fontSize: 13,
                          weight: FontWeight.w300,
                          color: AppColors.yellow,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
