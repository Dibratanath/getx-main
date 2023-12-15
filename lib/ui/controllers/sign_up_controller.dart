import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utility/urls.dart';

class SignUpController extends GetxController{
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  bool _signUpInProgress = false;
  String _faildMessage = "";

  bool get signUpInProgress => _signUpInProgress;
  String get signUpFaildMessage => _faildMessage;

  Future<bool> signUp() async {
    _signUpInProgress = true;
    update();

    final  response =
    await NetworkCaller()
        .postRequest(Urls.registration, body: {
      "firstName": _firstNameTEController.text.trim(),
      "lastName" : _lastNameTEController.text.trim(),
      "email" : _emailTEController.text.trim(),
      "password" : _passwordTEController.text,
      "mobile": _mobileTEController.text.trim(),
    }
    );
    _signUpInProgress = false;
    update();
    if (response.isSuccess) {
        return true;
      } else {

              _faildMessage = 'Account creation failed! Please try again.';

      }
    return false;
    }
  }