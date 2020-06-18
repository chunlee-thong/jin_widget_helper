import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  int min = 10;
  int max = 99;

  int get randomness => max - Random().nextInt(max - min);
  final formKey = GlobalKey<FormState>();

  void onValidateForm() {
    formKey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Validator page"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          children: <Widget>[
            TextFormField(
              validator: (value) => JinFormValidator.validateEmail(value),
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            JinWidget.verticalSpace(12),
            TextFormField(
              validator: (value) => JinFormValidator.validatePhoneNumber(value),
              decoration: InputDecoration(
                labelText: "Phone number",
                border: OutlineInputBorder(),
              ),
            ),
            JinWidget.verticalSpace(12),
            TextFormField(
              validator: (value) => JinFormValidator.validatePassword(value, length: 5),
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            JinWidget.verticalSpace(12),
            TextFormField(
              validator: (value) => JinFormValidator.validateField(value, "description"),
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
            ),
            JinWidget.verticalSpace(12),
            TextFormField(
              validator: (value) => JinFormValidator.validateNumber(
                value,
                "age",
                min: 10,
                max: 99,
                isInteger: true,
              ),
              decoration: InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(),
              ),
            ),
            JinWidget.verticalSpace(12),
            ActionButton(
              child: Text("Validate"),
              onPressed: onValidateForm,
            ),
          ],
        ),
      ),
    );
  }
}
