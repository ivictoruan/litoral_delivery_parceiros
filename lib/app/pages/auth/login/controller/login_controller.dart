import 'package:flutter/material.dart';
import 'package:match/match.dart';

part 'login_controller.g.dart';

@match
enum LoginStatus {
  initial,
  success,
  login,
  loading,
  loginError,
  error,
}

class LoginController extends ChangeNotifier {
  String email = "victor@gmail.com";
  String password = "123456";

  LoginStatus status = LoginStatus.initial;

  LoginController({
    this.status = LoginStatus.initial,
  });

  void login(String email, String password) {
    status = LoginStatus.loading;

    if (email == this.email && password == this.password) {
      status = LoginStatus.success;
      notifyListeners();
    } else {
      status = LoginStatus.error;
      notifyListeners();
    }
  }
}
