import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Lesson extends StatefulWidget {
  const Lesson({super.key, required this.zvezda, required this.video , required this.text, required this.min, required this.kcal, required this.url});
final bool zvezda ;
final bool video ;
final String text;
final String min;
final String kcal;
final String url;




  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.only(left: 10),
                    height: 160,
                    width: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: AppColors.white, width: 1),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentGeometry.topLeft,
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.only(
                              topLeft: Radius.circular(18),
                              topRight: Radius.circular(16),
                            ),
                            child: Image.network(widget.url,
                             height: 100,
                              width: 175,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 6,
                          right: 8,
                          left: 140,
                          bottom: 117,
                          child: SvgPicture.asset(
                            'assets/icons/star.svg',
                            color:widget.zvezda== true ? AppColors.yellow :AppColors.white,
                            height: 5,
                            width: 5,
                          ),
                        ),
                        Positioned(
                          top: 79,
                          left: 126,
                          right: 8,
                          bottom: 36,
                          child:  widget.video ==true ? SvgPicture.asset('assets/icons/pley.svg') : SizedBox()
                        ),

                        Positioned(
                          top: 104,
                          left: 11,
                          child: Text(
                            widget.text,
                            style: context.customTextStyle(
                              fontSize: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yellow,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 128,
                          left: 11,
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/Time.svg'),
                              SizedBox(width: 5,),
                              Text(widget.min  ,style: context.customTextStyle(
                              fontSize: 12,
                              weight: FontWeight.w500,
                              color: AppColors.white,
                            ),),
                            SizedBox(width: 10,),
                              SvgPicture.asset('assets/icons/ogon.svg'),
                              SizedBox(width: 5,),
                              Text(widget.kcal  ,style: context.customTextStyle(
                              fontSize: 12,
                              weight: FontWeight.w500,
                              color: AppColors.white,
                            ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
  }
}