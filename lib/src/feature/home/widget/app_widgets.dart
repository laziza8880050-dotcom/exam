
import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/feature/home/cubit/home_cubit.dart';
import 'package:fitness/src/feature/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidgets extends StatefulWidget {
  final List<String> newType;
  
  const AppWidgets({super.key, required this.newType, });

  @override
  State<AppWidgets> createState() => _AppWidgetsState();
}

class _AppWidgetsState extends State<AppWidgets> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: 30,
          child: ListView.builder(
            
            scrollDirection: Axis.horizontal,
            itemCount: widget.newType.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                
                  },
                  child: Chip(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(40)),
                    backgroundColor: state.newIndex == index
                        ? AppColors.yellow
                        : AppColors.white,
                    label: Text(
                      widget.newType[index],
                      style: TextStyle(
                        color: state.newIndex == index
                            ? AppColors.black
                            : AppColors.primary,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
    );
  }
}
