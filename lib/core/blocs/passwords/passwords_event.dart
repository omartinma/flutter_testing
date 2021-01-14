part of 'passwords_bloc.dart';

@immutable
abstract class PasswordsEvent {}

class PasswordSaveTried extends PasswordsEvent {
  final String newPassword;

  PasswordSaveTried({@required this.newPassword});
}
