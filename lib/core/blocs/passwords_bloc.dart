import 'package:flutter/material.dart';
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
    final note = Password(
      text: textPasswordController.text,
    );
    bool isValidPassword = checkValidPassword(note);
    if (isValidPassword) {
      _notes.add(note);
      textPasswordController.clear();
    } else {
      shouldDisplayError = true;
    }
    notifyListeners();
  }

  bool checkValidPassword(Password note) {
    //Whatever business logic: will check if any with exactly same value
    return !_notes.contains(note);
  }
}
