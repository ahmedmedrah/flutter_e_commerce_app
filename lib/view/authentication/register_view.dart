import 'package:e_commerce_app/core/viewmodel/auth_view_model.dart';
import 'package:e_commerce_app/view/authentication/login_view.dart';
import 'package:e_commerce_app/view/widget/custom_button.dart';
import 'package:e_commerce_app/view/widget/custom_text.dart';
import 'package:e_commerce_app/view/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: () => Get.off(LoginView()),child: Icon(Icons.arrow_back,color: Colors.black,)),
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
                CustomText(
                  text: 'Sign Up,',
                  fontSize: 30,
                ),
                SizedBox(height: 30),
                CustomTextFormField(
                  fieldName: 'Name',
                  hintText: 'John Smith',
                  onSave: (value) {
                    controller.name = value;
                  },
                  validator: (value) {
                    if (value == null) return 'error';
                  },
                ),
                SizedBox(height: 40),CustomTextFormField(
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
                CustomButton(
                  text: 'SIGN UP',
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      controller.createAccountWithEmailAndPassword();
                    }
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
