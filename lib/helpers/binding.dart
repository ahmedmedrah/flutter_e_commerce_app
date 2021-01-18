import 'package:e_commerce_app/core/viewmodel/auth_view_model.dart';
import 'package:e_commerce_app/core/viewmodel/control_view_model.dart';
import 'package:e_commerce_app/core/viewmodel/home_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => AuthViewModel());
   Get.lazyPut(() => ControlViewModel());
   Get.lazyPut(() => HomeViewModel());
  }

}