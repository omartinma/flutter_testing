import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/ui/passwords/create/password_form.dart';
import 'package:flutter_testing/ui/passwords/list/password_list.dart';
import 'package:integration_test/integration_test.dart';

// The application under test.
import 'package:flutter_testing/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Create a new password', () {
    setUpAll(() async {
      // Docs says to put this here but in that case everything fails
      //IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    });

    Future<void> _inputPassword(String newPassword, WidgetTester tester) async {
      //Write text in textfield
      final Finder textField = find.byType(PasswordTextField);
      await tester.tap(textField);
      await tester.enterText(textField, newPassword);
      await tester.pumpAndSettle();
    }

    Future<void> _clickSavePassword(WidgetTester tester) async {
      final Finder saveButton = find.byType(SaveButtonPassword);
      await tester.tap(saveButton);
      await tester.pumpAndSettle();
    }

    testWidgets('Create a new password if it is valid',
        (WidgetTester tester) async {
      //Init
      app.main();
      await tester.pumpAndSettle();
      //Input password
      final newPassword = 'Oscar123';
      await _inputPassword(newPassword, tester);
      expect(find.text(newPassword), findsOneWidget);

      //Click on save password button
      expect(find.byType(PasswordChip), findsNothing);
      await _clickSavePassword(tester);
      expect(find.byType(PasswordChip), findsOneWidget);
    });

    testWidgets('Dont create a new password if it is not valid',
        (WidgetTester tester) async {
      //Init
      app.main();
      await tester.pumpAndSettle();

      //Input password
      final newPassword = 'oscar123';
      await _inputPassword(newPassword, tester);
      expect(find.text(newPassword), findsOneWidget);

      //Click on save password button
      expect(find.byType(PasswordChip), findsNothing);
      await _clickSavePassword(tester);
      expect(find.byType(PasswordChip), findsNothing);
    });
  });
}
