import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/view/widget/custom_button.dart';
import 'package:e_commerce_app/view/widget/custom_social_button.dart';
import 'package:e_commerce_app/view/widget/custom_text.dart';
import 'package:e_commerce_app/view/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
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
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            CustomText(
              text: 'Sign in to continue',
              fontSize: 14,
              color: Colors.grey,
            ),
            SizedBox(height: 30),
            CustomTextFormField(
              fieldName: 'Email',
              hintText: 'email@example.com',
              onSave: (value) {},
              validator: (value) {},
            ),
            SizedBox(height: 40),
            CustomTextFormField(
              fieldName: 'Password',
              hintText: '********',
              onSave: (value) {},
              validator: (value) {},
            ),
            SizedBox(height: 20),
            CustomText(
              text: 'forget password',
              fontSize: 14,
              alignment: Alignment.topRight,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'SIGN IN',
              onPressed: () {},
            ),
            SizedBox(height: 10),
            CustomText(
              text: '-OR-',
              alignment: Alignment.center,
            ),
            SizedBox(height: 20),
            CustomSocialButton(
              text: 'Continue with Facebook',
              imageAsset: 'assets/images/facebook.png',
              onPressed: () {},
            ),
            SizedBox(height: 10),
            CustomSocialButton(
              text: 'Continue with Google',
              imageAsset: 'assets/images/google.png',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
