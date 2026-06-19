import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:flutter/cupertino.dart';

class seredina extends StatelessWidget {
  const seredina({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 181,
      width: double.infinity,
      color: AppColors.primary,
      child: Center(
        child: Container(
          height: 125,
          width: 324,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Weekly \nChallenge',
                      style: context.customTextStyle(
                        fontSize: 24,
                        weight: FontWeight.w500,
                        color: AppColors.yellow,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Plank With Hip Twist',
                      style: context.customTextStyle(
                        fontSize: 12,
                        weight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 18),
                Container(
                  height: 125,
                  width: 149,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset('assets/images/women.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
