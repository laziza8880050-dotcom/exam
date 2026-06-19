import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Pro extends StatefulWidget {
  final String url;
  final String sms;
  
  const Pro({super.key, required this.url, required this.sms});

  @override
  State<Pro> createState() => _ProState();
}

class _ProState extends State<Pro> {
  @override
  Widget build(BuildContext context) {
    return   Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(children: [
                    SvgPicture.asset(widget.url),
                    SizedBox(width: 23,),
                    Text(widget.sms, style: context.customTextStyle(fontSize: 20, weight: FontWeight.normal, color: AppColors.white),
                    
                                ),
                                Spacer(),
                                SvgPicture.asset('assets/icons/Arrow.svg')
                  ],),
                );
  }
}