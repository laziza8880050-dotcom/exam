import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/feature/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Star extends StatefulWidget {
  const Star({super.key, required this.state, required this.index});
  final HomeState state;
  final int index;
  @override
  State<Star> createState() => _StarState();
}

class _StarState extends State<Star> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 27),
                  Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text(
                      widget.state.lesson[widget.index].name ?? '',
                      style: context.customTextStyle(
                        color: AppColors.black1,
                        fontSize: 16,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 42,
                    width: 136,
                    child: Text(
                      widget.state.lesson[widget.index].description ?? ' ',
                      style: context.customTextStyle(
                        color: AppColors.black1,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 110,
              width: 148,
              padding: EdgeInsets.only(top: 20, right: 20),
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.grey,

                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.state.lesson[widget.index].image ?? '',
                  ),
                ),
              ),
              child: SvgPicture.asset(
                'assets/icons/star.svg',
                color: AppColors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
