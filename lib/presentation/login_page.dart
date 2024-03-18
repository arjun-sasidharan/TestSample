import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_sample/application/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(title: Text('Login'),),
          body: Column(
            children: [
              TextFormField(controller: c.emailController, decoration: InputDecoration(hintText: "Email"),),
              TextFormField(controller: c.passwordController, obscureText: true, decoration: InputDecoration(hintText: "Password"),),

              ElevatedButton(onPressed: () {

              }, child: Text('Login'))
            ],
          ),
        );
      }
    );
  }
}
