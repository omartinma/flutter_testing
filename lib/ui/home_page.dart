import 'package:flutter/material.dart';
import 'package:flutter_testing/ui/passwords/create/password_form.dart';
import 'package:flutter_testing/ui/passwords/list/password_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: PasswordForm()),
            Container(
              color: Colors.black,
              height: 1,
            ),
            Expanded(
              child: PasswordList(),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
