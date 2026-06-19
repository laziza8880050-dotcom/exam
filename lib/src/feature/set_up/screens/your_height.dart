import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/router/app_pages.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:fitness/src/core/widget/blur_botton.dart';
import 'package:fitness/src/feature/set_up/cubit/set_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:flutter_svg/svg.dart';

class YourHeight extends StatefulWidget {
  const YourHeight({super.key});

  @override
  State<YourHeight> createState() => _YourHeightState();
}

class _YourHeightState extends State<YourHeight> {
  RulerPickerController? _rulerPickerController;

  num currentValue = 40;

  List<RulerRange> ranges = const [
    RulerRange(begin: 0, end: 10, scale: 0.1),
    RulerRange(begin: 10, end: 100, scale: 1),
      RulerRange(begin: 1000, end: 10000, scale: 100),
    
  ];

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: currentValue);
  }

  Widget _buildChangeRangerBtn(String tip, List<RulerRange> rangeList) {
    return InkWell(
      onTap: () {
        setState(() {
          ranges = rangeList;
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        color: Colors.blue,
        child: Text(tip, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leadingWidth: 24,
        centerTitle: false,
        title: Text(
          'Back',
          style: context.customTextStyle(
            color: AppColors.yellow,
            fontSize: 20,
            weight: FontWeight.bold,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset('assets/icons/2.svg', width: 12, height: 12),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 36),
          Center(
            child: Text(
              'What Is Your Height', 
              style: context.customTextStyle(
                fontSize: 25,
                weight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(height: 31),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore\n                                         magna aliqua. ',
            style: context.customTextStyle(
              fontSize: 14,
              weight: FontWeight.w400,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 40),
          Text(
            ("${currentValue.toStringAsFixed(1)}cm"),
            style: context.customTextStyle(
              fontSize: 85,
              weight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                Text(
                  ("${currentValue.toStringAsFixed(1)}cm"),
                  style: context.customTextStyle(
                    fontSize: 25,
                    weight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),

                SizedBox(width: 50),

                RotatedBox(
                  quarterTurns: 5,
                  child: RulerPicker(
                    rulerScaleTextStyle: context.customTextStyle(
                      fontSize: 20,
                      color: AppColors.white,
                    ),
                    rulerBackgroundColor: AppColors.primary,
                    controller: _rulerPickerController!,
                    onBuildRulerScaleText: (index, value) {
                      return value.toInt().toString();
                    },
                    ranges: ranges,

                    scaleLineStyleList: const [
                      ScaleLineStyle(
                        color: AppColors.white,
                        width: 1.5,
                        height: 30,
                        scale: 0,
                      ),
                      ScaleLineStyle(
                        color: AppColors.white,
                        width: 1,
                        height: 25,
                        scale: 5,
                      ),
                      ScaleLineStyle(
                        color: AppColors.white,
                        width: 1,
                        height: 15,
                        scale: -1,
                      ),
                    ],

                    onValueChanged: (value) {
                      setState(() {
                        currentValue = value;
                      });
                    },
                    width: MediaQuery.of(context).size.width,

                    height: 80,
                    rulerMarginTop: 10,
                    // marker: Container(
                    //     width: 8,
                    //     height: 50,
                    //     decoration: BoxDecoration(
                    //         color: Colors.red.withAlpha(100),
                    //         borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                SizedBox(width: 12),
                SvgPicture.asset('assets/icons/tri_sto.svg'),
                  
              ],
            ),
          ),
          SizedBox(height: 10,),
           BlurBotton(
              backcolor: AppColors.grey,
              text: 'Continue',
              bordercolor: AppColors.white,
              onPressed: () {
                  context.read<SetUpCubit>().collectInfo(key: 'cm', value: currentValue );
            
                  Navigator.pushNamed(context, AppPages.goal); 
                
              
              },
            ),
        ],
      ),
    );
  }
}
