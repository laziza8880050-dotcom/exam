

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/router/app_pages.dart' show AppPages;
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/feature/settings/cubit/user_cubit.dart';
import 'package:fitness/src/feature/settings/cubit/user_state.dart';
import 'package:fitness/src/feature/settings/widget/cont.dart';
import 'package:fitness/src/feature/settings/widget/deteilpro.dart';
import 'package:fitness/src/feature/settings/widget/divider.dart';
import 'package:fitness/src/feature/settings/widget/uppro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:ui_avatar/ui_avatar.dart';

class DetailProfil extends StatefulWidget {
  const DetailProfil({super.key});

  @override
  State<DetailProfil> createState() => _DetailProfilState();
}

class _DetailProfilState extends State<DetailProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state.status == ProfileStatus.loading) {
              return Center(child: Lottie.asset('assets/lottie/ptica.json'));
            }

            if (state.status == ProfileStatus.error) {
              return Center(child: Text(state.errorText ?? ''));
            }

            if (state.user == null) {
              return const SizedBox();
            }

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
                              InkWell(onTap: () {
                               Navigator.pushNamed(context, AppPages.pro)  ;
                              },
                                child: SvgPicture.asset('assets/icons/k.svg')),
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
                            state.user?.name ?? '',
                            style: context.customTextStyle(
                              color: AppColors.white,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Deteilpro(
                        titile: 'Full name',
                        nima: "${state.user?.name ?? ''}",
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Deteilpro(
                        titile: 'Email',
                        nima:
                            FirebaseAuth.instance.currentUser?.email ??
                            'No email',
                      ),
                    ),
                      SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Deteilpro(
                        titile: 'Gender',
                        nima: "${state.user?.gender ?? ''}",
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Deteilpro(
                        titile: 'Goal',
                        nima: "${state.user?.goal ?? ''}",
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Deteilpro(
                        titile: 'Weigth',
                        nima: "${state.user?.width ?? ''}",
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Deteilpro(
                        titile: 'Height',
                        nima: "${state.user?.cm ?? ''}",
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Deteilpro(
                        titile: 'Years Old',
                        nima: "${state.user?.old ?? ''}",
                      ),
                    ),
                  
                    SizedBox(height: 50),
                    Uppro(),
                    SizedBox(height: 50),

                    
                  ],
                ),
                Positioned(
                  top: 268,
                  left: 36,
                  right: 36,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.fioletoviy,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Info(
                          title: "${state.user?.width ?? ''}",
                          valuee: 'Width',
                        ),
                        CustomDivider(),
                        Info(
                          title: "${state.user?.old ?? ''}",
                          valuee: 'Years Old',
                        ),
                        CustomDivider(),
                        Info(
                          title: "${state.user?.cm ?? ''}",
                          valuee: 'Height',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
