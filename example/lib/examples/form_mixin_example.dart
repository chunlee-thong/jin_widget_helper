import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class FormPageMixinExample extends StatefulWidget {
  FormPageMixinExample({Key key}) : super(key: key);
  @override
  _FormPageMixinExampleState createState() => _FormPageMixinExampleState();
}

class _FormPageMixinExampleState extends State<FormPageMixinExample>
    with FormPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Page mixin example')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: "chunlee_thong",
                decoration: InputDecoration(
                  labelText: "Username",
                ),
              ),
              PasswordTextFieldBuilder(
                builder: (obsecure) {
                  return TextFormField(
                    initialValue: "123456",
                    obscureText: obsecure,
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: SmallIconButton(
                        onTap: () {
                          togglePasswordObsecure();
                        },
                        icon: Icon(
                          obsecure ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  );
                },
              ),
              JinLoadingButton(
                child: Text("Login"),
                onPressed: () async {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
