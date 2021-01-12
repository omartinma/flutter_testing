import 'package:flutter/material.dart';
import 'package:flutter_testing/core/helpers/password_helper.dart';
import 'package:flutter_testing/core/models/password.dart';

class PasswordsProvider extends ChangeNotifier {
  List<Password> _passwords;
  List<Password> get passwords => _passwords;
  String _password;
  String get passWord => _password;

  bool shouldDisplayError = false;

  PasswordsProvider() {
    _passwords = List<Password>();
  }

  void addPassword() {
    final password = Password(
      text: passWord,
    );
    bool isValidPassword = PasswordsHelper().isValidPassword(password.text);
    if (isValidPassword) {
      _passwords.add(password);
      changePassword(null);
    } else {
      shouldDisplayError = true;
    }
    notifyListeners();
  }

  void changePassword(String newPassword) {
    _password = newPassword;
  }
}
