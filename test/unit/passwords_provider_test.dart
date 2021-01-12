// Import the test package and Counter class
import 'package:flutter_testing/core/models/password.dart';
import 'package:flutter_testing/core/providers/passwords_provider.dart';
import 'package:test/test.dart';

void main() {
  final String goodPassword = "Password1";
  final String wrongPassword = "oscar123";
  group('Add password', () {
    test('Valid password should be saved', () {
      final passwordProvider = PasswordsProvider();
      passwordProvider.textPasswordController.text = goodPassword;
      passwordProvider.addPassword();
      expect(passwordProvider.passwords.contains(Password(text: goodPassword)),
          true);
    });
    test('Invalid password should not be saved', () {
      final passwordProvider = PasswordsProvider();
      passwordProvider.textPasswordController.text = wrongPassword;
      passwordProvider.addPassword();
      expect(passwordProvider.passwords.contains(Password(text: goodPassword)),
          false);
    });
  });
}
