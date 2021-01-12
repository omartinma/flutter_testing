part of 'passwords_bloc.dart';

@immutable
abstract class PasswordsState {
  final List<Password> passwords;

  PasswordsState({this.passwords});
}

class PasswordsInitial extends PasswordsState {}

class PasswordSaved extends PasswordsState {
  final List<Password> passwords;

  PasswordSaved({this.passwords});
}

class PasswordError extends PasswordsState {}
