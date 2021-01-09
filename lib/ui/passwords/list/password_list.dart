import 'package:flutter/material.dart';
import 'package:flutter_testing/core/blocs/passwords_bloc.dart';
import 'package:provider/provider.dart';

class PasswordList extends StatelessWidget {
  const PasswordList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PasswordsBloc>(context);

    return Container(
      child: ListView.builder(
        itemCount: bloc.notes.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(bloc.notes[index].text),
        ),
      ),
    );
  }
}
