part of 'passwords_bloc.dart';

@immutable
abstract class PasswordsEvent {}

class ClearPassword extends PasswordsEvent {}

class CreatePassword extends PasswordsEvent {
  final String newPassword;

  CreatePassword({@required this.newPassword});
}
