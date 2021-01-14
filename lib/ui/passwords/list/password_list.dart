import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing/core/blocs/passwords/passwords_bloc.dart';
import 'package:flutter_testing/core/models/password.dart';

class PasswordList extends StatelessWidget {
  const PasswordList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordsBloc, PasswordsState>(
      buildWhen: (previous, current) => current is PasswordLoadSuccess,
      builder: (context, state) {
        final passwords = state.passwords;
        return Wrap(
          children: [
            for (var i = 0; i < passwords.length; i++)
              PasswordChip(
                password: passwords[i],
              )
          ],
        );
      },
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
