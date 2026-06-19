import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/router/app_pages.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/core/widget/blur_botton.dart';
import 'package:fitness/src/feature/auth/cubit/auth_cubit.dart';
import 'package:fitness/src/feature/auth/validator/app_validator.dart';
import 'package:fitness/src/feature/auth/widget/form_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:toastification/toastification.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _SignUpState();
}

class _SignUpState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
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
        title: InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppPages.login);
          },
          child: Text(
            'Log In',
            style: context.customTextStyle(
              color: AppColors.yellow,
              fontSize: 20,
              weight: FontWeight.bold,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(onTap: (){
            Navigator.popAndPushNamed(context, AppPages.signup);
          },  child: SvgPicture.asset('assets/icons/2.svg', width: 12, height: 12)),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 26,),
            Center(
              child: Text(
                'Welcome!',
                style: context.customTextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  weight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 26,),
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, \nsed do eiusmod tempor incididunt ut labore et dolore \n                                      magna aliqua. ',style: context.customTextStyle(
                fontSize: 13,
                weight: FontWeight.w300,
                color: AppColors.white,
              ),),
            SizedBox(height: 100),
            Container(
              height: 272,
              width: double.infinity,
              color: AppColors.primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 41),
                child: Column(
                  children: [
                    SizedBox(height: 22),
               
                   
                    FormText(
                      validator: AppValidator.email,
                      obscureText: false,
                      keybordtype: TextInputType.emailAddress,
                      textsverxu: 'Email or Mobile Number',
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 29),
                    FormText(
                      obscureText: true,
                      validator: AppValidator.password,
                      keybordtype: TextInputType.number,
                      textsverxu: 'Password',
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 19),
                  
                  ],
                ),
              ),
            ),
            SizedBox(height: 26),
            
           
            SizedBox(height: 20),
            BlurBotton(
              backcolor: AppColors.black,
              text: 'Log in',
              bordercolor: AppColors.white,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthCubit>().logIn(
                   
                  email: emailController.text,
                  password: passwordController.text,
                );   
                print('${emailController.text} and keldi ${passwordController.text}');
                Navigator.pushNamed(context, AppPages.main); 
                    }
                
              
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
                InkWell(onTap: () {
                   context.read<AuthCubit>().singinwithgoogle();
                },
                  child: SvgPicture.asset('assets/icons/google.svg')),
                SizedBox(width: 16),
                SvgPicture.asset('assets/icons/f.svg'),
                SizedBox(width: 16),
                SvgPicture.asset('assets/icons/finger.svg'),
                Spacer(),
              ],
            ),
            SizedBox(height: 100),
            Row(
              children: [
                Spacer(),
                Text(
                  'Don’t have an account?',
                  style: context.customTextStyle(
                    fontSize: 13,
                    weight: FontWeight.w300,
                    color: AppColors.white,
                  ),
                ),
                InkWell(onTap: () {
                   if (_formKey.currentState!.validate()){
                      context.read<AuthCubit>().logIn(
                      email: emailController.text,
                      password: passwordController.text,


                    );
                    Navigator.pushReplacementNamed(context, AppPages.home);
                    } else {
                      toastification.show(
                        type: ToastificationType.error,
                        title: Text('Make sure every input is correct !')
                      );
                    }
                   },
                  child: Text(
                    ' Sign Up',
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
      ),
    );
  }
}
