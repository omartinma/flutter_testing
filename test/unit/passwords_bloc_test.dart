import 'package:flutter_testing/core/blocs/passwords/passwords_bloc.dart';
import 'package:flutter_testing/core/models/password.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('Passwords Bloc', () {
    blocTest('first test',
        build: () => PasswordsBloc(),
        skip: 0,
        act: (bloc) {
          bloc.add(CreatePassword(newPassword: "Oscar123"));
          bloc.add(CreatePassword(newPassword: "Oscar1234"));
        },
        expect: [
          PasswordLoadSuccess(
            passwords: [
              Password(text: "Oscar123"),
            ],
          ),
          PasswordLoadSuccess(
            passwords: [
              Password(text: "Oscar123"),
              Password(text: "Oscar1234"),
            ],
          ),
        ]);
  });
}
