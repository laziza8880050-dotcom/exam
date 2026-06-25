import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class Deteilpro extends StatelessWidget {
  final String titile;
  final String nima;
  const Deteilpro({super.key, required this.titile, required this.nima});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(alignment: AlignmentGeometry.topLeft,
            child: Text(
              titile,
              style: context.customTextStyle(
                fontSize: 15,
                weight: FontWeight.w700,
                color: AppColors.fioletoviy,
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
          ),
          child:Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(alignment: AlignmentGeometry.topLeft,
                  child: Text(nima,  style: context.customTextStyle(
                    fontSize: 18,
                    weight: FontWeight.w500,
                    color: AppColors.black1,
                  ),),
                ),
              ),
              Spacer()
            ],
          ) ,
        ),
      ],
    );
  }
}
