import 'package:flutter_testing/core/blocs/passwords/passwords_bloc.dart';
import 'package:flutter_testing/core/models/password.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('Passwords Bloc', () {
    PasswordsBloc passwordsBloc;
    final String goodPassword = "Password1";
    final String wrongPassword = "oscar123";

    setUp(() {
      passwordsBloc = PasswordsBloc();
    });

    blocTest('first test',
        build: () => PasswordsBloc(),
        act: (bloc) => bloc.add(ChangePassword(newPassword: 'Chicago123')),
        expect: [
          PasswordsInitial(),
        ]);
    /*  test('Valid password should be saved', () {
      //expect(passwordsBloc.state, PasswordsInitial);
      final expectedResponse = [
        PasswordsInitial(),
        PasswordSaved(),
      ];

      passwordsBloc.add(ChangePassword(newPassword: goodPassword));
      passwordsBloc.add(CreatePassword());
      passwordsBloc.add(ChangePassword(newPassword: wrongPassword));

      //expectLater(passwordsBloc, emitsInOrder(expectedResponse));

      expect(
          passwordsBloc.state.passwords.contains(Password(text: goodPassword)),
          true);
    });*/
  });
}
