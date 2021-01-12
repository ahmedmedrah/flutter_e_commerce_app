import 'package:e_commerce_app/view/authentication/login_view.dart';
import 'package:e_commerce_app/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'helpers/binding.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return GetMaterialApp(
     initialBinding: Binding(),
     home: Scaffold(
       body: ControlView(),
     ),
   );
  }
}

