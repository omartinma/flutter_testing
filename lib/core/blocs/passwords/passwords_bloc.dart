import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_testing/core/helpers/password_helper.dart';
import 'package:flutter_testing/core/models/password.dart';
import 'package:meta/meta.dart';

part 'passwords_event.dart';
part 'passwords_state.dart';

class PasswordsBloc extends Bloc<PasswordsEvent, PasswordsState> {
  PasswordsBloc() : super(PasswordsInitial());

  String currentPassword;
  List<Password> _passwords = List<Password>();

  @override
  Stream<PasswordsState> mapEventToState(
    PasswordsEvent event,
  ) async* {
    if (event is ChangePassword) {
      currentPassword = event.newPassword;
    } else if (event is CreatePassword) {
      bool isValidPassword = PasswordsHelper().isValidPassword(currentPassword);
      if (isValidPassword) {
        _passwords.add(Password(text: currentPassword));
        yield PasswordSaved(passwords: _passwords);
      } else {
        yield PasswordError();
      }
    }
  }
}
