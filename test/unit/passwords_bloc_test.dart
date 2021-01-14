import 'package:flutter_testing/core/blocs/passwords/passwords_bloc.dart';
import 'package:flutter_testing/core/models/password.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('Passwords Bloc', () {
    blocTest('2 valid passwords should be created',
        build: () => PasswordsBloc(),
        act: (bloc) {
          bloc.add(
            PasswordSaveTried(newPassword: "Oscar123"),
          );
          bloc.add(
            PasswordSaveTried(newPassword: "Oscar1234"),
          );
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

    blocTest('Invalid password should not be added',
        build: () => PasswordsBloc(),
        act: (bloc) {
          bloc.add(
            PasswordSaveTried(newPassword: "OscarMartin"),
          );
        },
        expect: [
          PasswordLoadFailure(
            passwords: [],
          ),
        ]);
    blocTest('Invalid passwords should not be added',
        build: () => PasswordsBloc(),
        act: (bloc) {
          bloc.add(
            PasswordSaveTried(newPassword: "OscarMartin"),
          );
          bloc.add(
            PasswordSaveTried(newPassword: "oscarMartin"),
          );
        },
        expect: [
          PasswordLoadFailure(
            passwords: [],
          ),
        ]);
  });
}
