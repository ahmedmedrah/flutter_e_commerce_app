import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String fieldName, hintText;
  final Function onSave, validator;

  const CustomTextFormField(
      {this.fieldName, this.hintText, this.onSave, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CustomText(
            text: fieldName,
            fontSize: 14,
            color: Colors.grey[900],
          ),
          TextFormField(
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
