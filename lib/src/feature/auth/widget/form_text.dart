import 'package:fitness/src/core/const/colors/app_colors.dart';
import 'package:fitness/src/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class FormText extends StatelessWidget {
  final String textsverxu;
  final TextInputAction textInputAction;
  final String? inputFomat;
  final TextEditingController? controller;
  final String?labelText;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? keybordtype;
final bool obscureText;
  const FormText({  super.key, required this.textsverxu, required this.textInputAction, this.inputFomat, this.controller, this.labelText, this.validator, this.keybordtype, required this.obscureText, this.onFieldSubmitted});
 
  

  @override
  Widget build(BuildContext context) {
    return Column(children: [ 
      Align(alignment: AlignmentGeometry.topLeft,
        child: Text(textsverxu, style: context.customTextStyle(fontSize: 18, weight: FontWeight.w600, color: AppColors.black1),)),
      SizedBox(height: 7,),
      TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText,
        controller: controller,
        validator: validator,
        keyboardType:keybordtype ,
         decoration: InputDecoration(
           filled: true,
           fillColor: AppColors.white,
          
           focusedBorder:  UnderlineInputBorder(borderSide:BorderSide.none, borderRadius: BorderRadius.circular(15)),
        border: UnderlineInputBorder(borderSide: BorderSide(color:AppColors.green ), borderRadius: BorderRadius.circular(15)),

        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.red),borderRadius: BorderRadius.circular(15))
  
           
         ),
       ),
       ],);
  }
}