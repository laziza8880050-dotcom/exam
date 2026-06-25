import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/router/app_pages.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/feature/home/cubit/home_cubit.dart';
import 'package:fitness/src/feature/home/cubit/home_state.dart';
import 'package:fitness/src/feature/home/widget/star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class StarScreen extends StatefulWidget {
  const StarScreen({super.key});

  @override
  State<StarScreen> createState() => _StarScreenState();
}

class _StarScreenState extends State<StarScreen> {
  List<String> name = ['All', 'Video', 'Article'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leadingWidth: 24,
        centerTitle: false,
        title: Text(
          'Favorites',
          style: context.customTextStyle(
            color: AppColors.fioletoviy,
            fontSize: 20,
            weight: FontWeight.bold,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(onTap: () {
            Navigator.pushNamed(context, AppPages.main);
          },
            child: SvgPicture.asset('assets/icons/2.svg', width: 12, height: 12)),
        ),
        actions: [
          SvgPicture.asset('assets/icons/seach.svg'),
          SizedBox(width: 21),
          SvgPicture.asset('assets/icons/zvonok.svg'),
          SizedBox(width: 21),
          SvgPicture.asset('assets/icons/user.svg'),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading) {
            return Center(child:Lottie.asset('assets/lottie/ptica.json') ,);
          } else if (state.status == HomeStatus.succes) {
            return Column(
              children: [
                SizedBox(height: 15),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text(
                        'Sort by',
                        style: context.customTextStyle(
                          color: AppColors.yellow,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Row(
                      children: List.generate(
                        name.length,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == 0
                                ? AppColors.yellow
                                : AppColors.white,
                          ),

                          height: 18,
                          width: 71,
                          child: Center(
                            child: Text(
                              name[index],
                              style: context.customTextStyle(
                                fontSize: 12,
                                color: name[index] == 0
                                    ? AppColors.black1
                                    : AppColors.primary,
                                weight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 33),
                SizedBox(
               
                 
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: state.lesson.length,
                    itemBuilder: (context, index) {
                        return Visibility(visible: state.lesson[index].zvezda ?? false,child: Star(state: state, index: index));
                    },
                  ),
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
