import 'package:flutter/material.dart';
import 'package:flutter_testing/core/helpers/password_helper.dart';
import 'package:flutter_testing/core/models/password.dart';

class PasswordsBloc extends ChangeNotifier {
  List<Password> _notes;
  List<Password> get notes => _notes;

  bool shouldDisplayError = false;

  TextEditingController textPasswordController = TextEditingController();

  PasswordsBloc() {
    _notes = List<Password>();
  }

  addPassword() {
    final password = Password(
      text: textPasswordController.text,
    );
    bool isValidPassword = PasswordsHelper().isValidPassword(password.text);
    if (isValidPassword) {
      _notes.add(password);
      textPasswordController.clear();
    } else {
      shouldDisplayError = true;
    }
    notifyListeners();
  }
}
