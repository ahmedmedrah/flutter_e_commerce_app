import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';
 class CustomButton extends StatelessWidget {
   final String text;
   final Function onPressed;

  const CustomButton({this.text, this.onPressed});

   @override
   Widget build(BuildContext context) {
     return FlatButton(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
       padding: EdgeInsets.all(16),
       onPressed: onPressed,
       child: CustomText(
         text: text,
         alignment: Alignment.center,
         color: Colors.white,
       ),
       color: primaryColor,
     );
   }
 }
