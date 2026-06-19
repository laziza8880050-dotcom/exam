import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/feature/set_up/cubit/set_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class Stroka extends StatefulWidget {
  const Stroka({super.key, required this.nimauchun, required this.index});
  final String nimauchun;
  final int index;
  @override
  State<Stroka> createState() => _StrokaState();
}

class _StrokaState extends State<Stroka> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: 323,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(left: 35),
              child: Text(
                widget.nimauchun,
                style: context.customTextStyle(
                  fontSize: 18,
                  color: AppColors.black1,
                  weight: FontWeight.w400,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: RoundCheckBox(isChecked: context.watch<SetUpCubit>().state.userInfo!.containsValue(widget.nimauchun),onTap: (selected) {
                print(selected);
                context.read<SetUpCubit>().collectInfo(key: 'goal', value: widget.nimauchun);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
