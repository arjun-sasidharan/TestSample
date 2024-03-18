import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_sample/domain/i_login_repository.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() {
      if (emailController.text.isEmpty) {
        return;
      }
      if (!emailController.text.isEmail) {
         return;
      }
      if (passwordController.text.isEmpty) {
        return;
      }


  }

}