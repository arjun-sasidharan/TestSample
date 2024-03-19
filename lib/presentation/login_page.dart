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
            appBar: AppBar(
              title: const Text('Login'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: c.emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      errorText: c.emailTextFieldErrorText,
                    ),
                  ),
                  TextFormField(
                    controller: c.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      errorText: c.passwordTextFieldErrorText,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        c.login();
                      },
                      child: const Text('Login')),
                  const SizedBox(height: 40,),
                  if (c.loginErrorText.isNotEmpty)
                    Text(c.loginErrorText, style: const TextStyle(color: Colors.red),)
                ],
              ),
            ),
          );
        });
  }
}
