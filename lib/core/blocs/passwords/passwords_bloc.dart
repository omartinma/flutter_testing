import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_testing/core/helpers/password_helper.dart';
import 'package:flutter_testing/core/models/password.dart';
import 'package:meta/meta.dart';

part 'passwords_event.dart';
part 'passwords_state.dart';

class PasswordsBloc extends Bloc<PasswordsEvent, PasswordsState> {
  PasswordsBloc() : super(PasswordLoadSuccess.initial());

  @override
  Stream<PasswordsState> mapEventToState(
    PasswordsEvent event,
  ) async* {
    if (event is PasswordSaveTried) {
      final currentPassword = event.newPassword;
      bool isValidPassword = PasswordsHelper().isValidPassword(currentPassword);
      if (isValidPassword) {
        final passwords = List<Password>.from(state.passwords);
        passwords.add(Password(text: currentPassword));
        yield PasswordLoadSuccess(passwords: passwords);
      } else {
        yield PasswordLoadFailure(passwords: state.passwords);
      }
    }
  }
}
