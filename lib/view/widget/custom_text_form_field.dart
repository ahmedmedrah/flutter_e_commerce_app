import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CustomText(
            text: 'email',
            fontSize: 14,
            color: Colors.grey[900],
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'email',hintStyle: TextStyle(color: Colors.grey),fillColor: Colors.white,),
          ),
        ],
      ),
    );
  }
}
