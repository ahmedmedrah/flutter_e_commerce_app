import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/view/widget/custom_text.dart';
import 'package:e_commerce_app/view/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Welcome,',
                  fontSize: 30,
                ),
                CustomText(
                  text: 'Sign up,',
                  fontSize: 18,
                  color: primaryColor,
                ),
              ],
            ),
            SizedBox(height: 30,),
            CustomText(
              text: 'Sign in to continue',
              fontSize: 14,
              color: Colors.grey,
            ),
            CustomTextFormField(),
            CustomTextFormField(),
          ],
        ),
      ),
    );
  }
}
