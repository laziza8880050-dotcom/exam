import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/router/app_pages.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/feature/home/cubit/home_cubit.dart';
import 'package:fitness/src/feature/home/cubit/home_state.dart';
import 'package:fitness/src/feature/home/widget/ads.dart';
import 'package:fitness/src/feature/home/widget/lesson.dart';
import 'package:fitness/src/feature/home/widget/sentr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        actions: [
          SvgPicture.asset('assets/icons/seach.svg'),
          SizedBox(width: 21),
          SvgPicture.asset('assets/icons/zvonok.svg'),
          SizedBox(width: 21),
          SvgPicture.asset('assets/icons/user.svg'),
        ],
        title: Text(
            FirebaseAuth.instance.currentUser?.email ??
                                'No email',
          style: context.customTextStyle(
            color: AppColors.fioletoviy,
            fontSize: 30,
            weight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading) {
            return CircularProgressIndicator();
          } else if (state.status == HomeStatus.succes) {
            print('xolat succes');
            return Column(
              children: [
                Align(
                  alignment: AlignmentGeometry.topLeft,
                  child: Text(
                    'Its time to challenge your limits.',
                    style: context.customTextStyle(
                      fontSize: 13,
                      weight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset('assets/images/stop.png'),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Recommendations',
                        style: context.customTextStyle(
                          fontSize: 15,
                          weight: FontWeight.w500,
                          color: AppColors.yellow,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppPages.zvezda);
                        },
                        child: Text(
                          'see All',
                          style: context.customTextStyle(
                            fontSize: 15,
                            weight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      SvgPicture.asset('assets/icons/a.svg'),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: List.generate(
                      2,
                      (index) => Lesson(
                        zvezda: state.lesson[index].zvezda ?? false,
                        video: state.lesson[index].video ?? false,
                        text: state.lesson[index].name ?? 'no name',
                        min: state.lesson[index].min ?? '5 Minuts',
                        kcal: state.lesson[index].kcal ?? '5 kcal',
                        url: state.lesson[index].image ?? '',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 19),
                seredina(),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text(
                      'Articles & Tips',
                      style: context.customTextStyle(
                        fontSize: 20,
                        weight: FontWeight.w500,
                        color: AppColors.yellow,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7),
                SizedBox(height: 155,
                  child: ListView.builder(scrollDirection: Axis.horizontal,
                  
                  padding: EdgeInsets.only(left: 25),
                    itemCount: 5,
                    itemBuilder: (context, index){return
                      Ads(zvezda: state.lesson[index].zvezda!, text: state.lesson[index].name!, url: state.lesson[index].image!);
                   
                  }
                  ),
                ),

              ],
            );
          }
          print('xolat errorda');
          return SizedBox();
        },
      ),
    
    );
  }
}

