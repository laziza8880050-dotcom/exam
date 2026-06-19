import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Ads extends StatefulWidget {
  final bool zvezda ;
  final String text;
  final String url;
  const Ads({super.key, required this.zvezda, required this.text, required this.url});

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  @override
  Widget build(BuildContext context) {
    return   Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          height: 134,
                          width: 157,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(20),
                            child: Image.network(
                             widget.url,   fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 5,
                          right: 15,
                          child: SvgPicture.asset(
                            'assets/icons/star.svg',
                            color: widget.zvezda== true ? AppColors.yellow :AppColors.white,
                          ),
                        ),
                         ],
                    ),
                     Text(widget.text, style: context.customTextStyle(color: AppColors.white, fontSize: 12),)
                    
                  ],
                );
  }
}