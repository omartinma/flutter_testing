import 'package:flutter/material.dart';
import 'package:flutter_testing/core/models/password.dart';
import 'package:flutter_testing/core/providers/passwords_provider.dart';
import 'package:provider/provider.dart';

class PasswordList extends StatelessWidget {
  const PasswordList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PasswordsProvider>(context);
    final passwords = bloc.passwords;
    return Wrap(
      children: [
        for (var i = 0; i < passwords.length; i++)
          PasswordChip(
            password: passwords[i],
          )
      ],
    );
  }
}

class PasswordListElement extends StatelessWidget {
  const PasswordListElement({Key key, this.password}) : super(key: key);

  final Password password;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(password.text),
    );
  }
}

class PasswordChip extends StatelessWidget {
  const PasswordChip({Key key, this.password}) : super(key: key);
  final Password password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        label: Text(password.text),
        elevation: 2,
      ),
    );
  }
}
