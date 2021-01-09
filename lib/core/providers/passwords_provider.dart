import 'package:flutter/material.dart';
import 'package:flutter_testing/core/helpers/password_helper.dart';
import 'package:flutter_testing/core/models/password.dart';

class PasswordsProvider extends ChangeNotifier {
  List<Password> _passwords;
  List<Password> get passwords => _passwords;

  bool shouldDisplayError = false;

  TextEditingController textPasswordController = TextEditingController();

  PasswordsProvider() {
    _passwords = List<Password>();
  }

  void addPassword() {
    final password = Password(
      text: textPasswordController.text,
    );
    bool isValidPassword = PasswordsHelper().isValidPassword(password.text);
    if (isValidPassword) {
      _passwords.add(password);
      textPasswordController.clear();
    } else {
      shouldDisplayError = true;
    }
    notifyListeners();
  }
}
