import 'package:flutter/material.dart';
import 'package:flutter_testing/core/blocs/passwords_bloc.dart';
import 'package:flutter_testing/core/models/password.dart';
import 'package:provider/provider.dart';

class PasswordList extends StatelessWidget {
  const PasswordList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PasswordsBloc>(context);

    return Container(
      child: ListView.builder(
        itemCount: bloc.notes.length,
        itemBuilder: (context, index) => PasswordListElement(
          password: bloc.notes[index],
        ),
      ),
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
