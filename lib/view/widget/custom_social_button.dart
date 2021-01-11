import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomSocialButton extends StatelessWidget {
  final String text, imageAsset;
  final Function onPressed;

  const CustomSocialButton({this.text, this.imageAsset, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(10)),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        onPressed: onPressed,
        child: Row(
          children: [
            Image.asset(imageAsset,height: 30,),
            Expanded(
              child: CustomText(
                text: text,
                alignment: Alignment.center,
              ),
            )
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
