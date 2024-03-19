import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_sample/domain/i_login_repository.dart';
import 'package:test_sample/domain/login_response_model.dart';
import 'package:test_sample/infrastructure/login_repository.dart';
import 'package:test_sample/presentation/product_page.dart';
import 'package:test_sample/storage/storage.dart';

class LoginController extends GetxController {
  final ILoginRepository _loginRepository = LoginRepository();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String loginErrorText = "";

  String passwordTextFieldErrorText = "";
  String emailTextFieldErrorText = "";

  login() async {
      if (emailController.text.isEmpty) {
        emailTextFieldErrorText = "* Required";
        update();
        return;
      }
      if (!emailController.text.isEmail) {
        emailTextFieldErrorText = "Enter a valid email ID";
        update();
         return;
      }
      if (passwordController.text.isEmpty) {
        passwordTextFieldErrorText = "* Required";
        update();
        return;
      }

     Either<String,User?> res = await _loginRepository.login(
     emailController.text, passwordController.text);
      res.fold((l) {
        //todo: show error message
        loginErrorText = l;

      }, (user) {
        loginErrorText = "";
        if (user != null) {
          if (user.userToken != null) {
            saveToken(user.userToken!);
            // todo: route to product screen
            Get.to(const ProductPage());
          }
        }
      });

    update();
  }

  saveToken(String token) async {
    Storage.write("token", token);
  }




}