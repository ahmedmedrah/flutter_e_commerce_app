import 'package:e_commerce_app/core/viewmodel/auth_view_model.dart';
import 'package:e_commerce_app/view/authentication/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  AuthViewModel viewModel = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('home'),
              RaisedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Get.offAll(LoginView());
                },
                child: Text('logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
