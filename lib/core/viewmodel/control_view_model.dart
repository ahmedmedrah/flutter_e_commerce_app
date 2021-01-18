import 'package:e_commerce_app/view/cart_view.dart';
import 'package:e_commerce_app/view/home_view.dart';
import 'package:e_commerce_app/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController{
  int _navigatorValue = 0;
  Widget _currentView = HomeView();


  int get navigatorValue => _navigatorValue;
  Widget get currentView =>_currentView;
  void changeSelectedValue(int selectedValue){
    _navigatorValue = selectedValue;
    switch (selectedValue){
      case 0:
        {
          _currentView = HomeView();
          break;
        }
      case 1:
        {
          _currentView = CartView();
          break;
        }
      case 2:
        {
          _currentView = ProfileView();
          break;
        }

    }
    update();
  }
}