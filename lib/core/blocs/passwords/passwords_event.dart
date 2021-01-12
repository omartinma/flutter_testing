part of 'passwords_bloc.dart';

@immutable
abstract class PasswordsEvent {}

class ClearPassword extends PasswordsEvent {}

class ChangePassword extends PasswordsEvent {
  final String newPassword;

  ChangePassword({this.newPassword});
}

class CreatePassword extends PasswordsEvent {}
