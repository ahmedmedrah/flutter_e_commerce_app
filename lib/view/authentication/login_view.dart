import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/viewmodel/auth_view_model.dart';
import 'package:e_commerce_app/view/authentication/register_view.dart';
import 'package:e_commerce_app/view/widget/custom_button.dart';
import 'package:e_commerce_app/view/widget/custom_social_button.dart';
import 'package:e_commerce_app/view/widget/custom_text.dart';
import 'package:e_commerce_app/view/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[50],
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Welcome,',
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: (){Get.to(RegisterView());},
                      child: CustomText(
                        text: 'Sign up,',
                        fontSize: 18,
                        color: primaryColor,
                      ),
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
                  onSave: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) return 'error';
                  },
                ),
                SizedBox(height: 40),
                CustomTextFormField(
                  fieldName: 'Password',
                  hintText: '********',
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) return 'error';
                  },
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
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      controller.signInWithEmailAndPassword();
                    }
                  },
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
                  onPressed: () {
                    controller.facebookSignInMethod();
                  },
                ),
                SizedBox(height: 10),
                CustomSocialButton(
                  text: 'Continue with Google',
                  imageAsset: 'assets/images/google.png',
                  onPressed: () {
                    controller.googleSignInMethod();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
