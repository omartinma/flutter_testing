// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_testing/main.dart';
import 'package:flutter_testing/ui/passwords/create/password_form.dart';
import 'package:flutter_testing/ui/passwords/list/password_list.dart';

void main() {
  group('Find widgets', () {
    testWidgets('Check we can find the password textfield',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      final widget1 = find.byType(PasswordTextField);
      expect(widget1, findsOneWidget);

      final widget2 = find.byKey(Key("PasswordTextField"));
      expect(widget2, findsOneWidget);
    });

    testWidgets('Check we can find the save password button',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      final widget1 = find.byType(SaveButtonPassword);
      expect(widget1, findsOneWidget);

      final widget2 = find.byKey(Key("SaveButtonPassword"));
      expect(widget2, findsOneWidget);
    });
  });

  group('Interaction with widgets', () {
    testWidgets('Check we can type in the textfield',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      var password = 'Oscar123';
      expect(find.text(password), findsNothing);

      await tester.enterText(find.byType(PasswordTextField), password);
      await tester.pump();

      // Expect to find the item on screen.
      expect(find.text(password), findsOneWidget);
    });

    testWidgets('Check we can press the save password button',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      var password = 'Oscar123';

      await tester.enterText(find.byType(PasswordTextField), password);
      expect(find.byType(PasswordListElement), findsNothing);
      expect(find.widgetWithText(PasswordTextField, password), findsOneWidget);

      final widget1 = find.byType(SaveButtonPassword);
      await tester.press(widget1);
      await tester.pump();

      //We should find textfield empty and listtile with the password added
      //TODO: TEST FAILING
      expect(find.widgetWithText(PasswordTextField, ''), findsOneWidget);
      expect(find.byType(PasswordListElement), findsOneWidget);
    });
  });
}
