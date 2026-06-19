import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/feature/set_up/cubit/set_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Knopka extends StatefulWidget {
  const Knopka({super.key, required this.text});
  final String text;

  @override
  State<Knopka> createState() => _KnopkaState();
}

class _KnopkaState extends State<Knopka> {
  @override
  Widget build(BuildContext context) {
    bool bosildimi = context.watch<SetUpCubit>().state.userInfo?.containsValue(widget.text) ?? false;
    return GestureDetector(
      onTap: () {
        context.read<SetUpCubit>().collectInfo(key: "level", value: widget.text);
        setState(() {
          
        });
      },
      child: Container(
        height: 64,
        width: 323,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),

          color: bosildimi ? AppColors.yellow : AppColors.white,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: context.customTextStyle(
              fontSize: 24,
              color: bosildimi ? AppColors.black1 : AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
