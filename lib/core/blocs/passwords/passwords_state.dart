part of 'passwords_bloc.dart';

@immutable
abstract class PasswordsState extends Equatable {
  @override
  List<Object> get props => [passwords];
  final List<Password> passwords;

  PasswordsState({this.passwords});
}

class PasswordLoadSuccess extends PasswordsState {
  factory PasswordLoadSuccess.initial() => PasswordLoadSuccess(passwords: []);
  PasswordLoadSuccess({List<Password> passwords}) : super(passwords: passwords);
}

class PasswordLoadFailure extends PasswordsState {
  PasswordLoadFailure({List<Password> passwords}) : super(passwords: passwords);
}
