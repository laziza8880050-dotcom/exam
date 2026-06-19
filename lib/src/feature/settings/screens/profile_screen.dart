import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/router/app_pages.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/feature/home/cubit/home_cubit.dart';
import 'package:fitness/src/feature/set_up/cubit/set_up_cubit.dart';
import 'package:fitness/src/feature/settings/cubit/user_cubit.dart';
import 'package:fitness/src/feature/settings/cubit/user_state.dart';
import 'package:fitness/src/feature/settings/cubit/widget/pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_avatar/ui_avatar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state.status == UserStatus.loading) {
            return CircularProgressIndicator();
          } else if (state.status == UserStatus.succes) {
            print('xolat succes');

            return Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 289,
                      width: double.infinity,
                      color: AppColors.primary,
                      child: Column(
                        children: [
                          SizedBox(height: 31),
                          Row(
                            children: [
                              SizedBox(width: 36),
                              SvgPicture.asset('assets/icons/k.svg'),
                              SizedBox(width: 9),
                              Text(
                                'My Profile',
                                style: context.customTextStyle(
                                  fontSize: 20,
                                  weight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          UiAvatar(
                            size: 150,
                            name:
                                FirebaseAuth.instance.currentUser?.email ??
                                'No email',
                            useRandomColors: true,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          SizedBox(height: 5),
                          Text(
                          ( FirebaseAuth.instance.currentUser?.displayName?.isEmpty ?? false)
                          ? FirebaseAuth.instance.currentUser!.displayName !
                          :'NO',
                            style: context.customTextStyle(
                              fontSize: 20,
                              weight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            FirebaseAuth.instance.currentUser?.email ??
                                'No email',
                            style: context.customTextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 86),
                    Pro(url: 'assets/icons/1k.svg', sms: 'Profile'),
                    SizedBox(height: 15),
                    InkWell(onTap: (){Navigator.pushNamed(context, AppPages.zvezda);},
                      child: Pro(url: 'assets/icons/2k.svg', sms: 'Favorite')),
                    SizedBox(height: 15),
                    Pro(url: 'assets/icons/3k.svg', sms: 'Privacy Policy'),
                    SizedBox(height: 15),
                    Pro(url: 'assets/icons/4k.svg', sms: 'Settings'),
                    SizedBox(height: 15),
                    Pro(url: 'assets/icons/5k.svg', sms: 'Help'),
                    SizedBox(height: 15),
                    InkWell(onTap: (){ FirebaseAuth.instance.signOut().then((v){
                  Navigator.pushNamed(context, AppPages.onboarding);
                });},
                      child: Pro(url: 'assets/icons/6k.svg', sms: 'Logout')),
                  ],
                ),
                Positioned(
                  top: 268,
                  left: 36,
                  right: 36,
                  child: Container(
                    height: 60,
                    width: 323,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.fioletoviy,
                    ),
                    child: Row(children: [
                     
                          ],),
                  ),
                ),
              ],
            );
          }
          print('eroe');
          return SizedBox();
        },
      ),
    );
  }
}
  //Text( FirebaseAuth.instance.currentUser?.email ?? 'No email',
    //    

     //    )