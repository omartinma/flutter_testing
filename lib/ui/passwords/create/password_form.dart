import 'package:flutter/material.dart';
import 'package:flutter_testing/core/providers/passwords_provider.dart';
import 'package:provider/provider.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PasswordsBloc>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.shouldDisplayError) {
        final snackBar = SnackBar(content: Text('Error adding note'));
        Scaffold.of(context).showSnackBar(snackBar);
        controller.shouldDisplayError = false;
      }
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PasswordTextField(),
          SaveButtonPassword(),
        ],
      ),
    );
  }
}

class SaveButtonPassword extends StatelessWidget {
  const SaveButtonPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      key: Key("SaveButtonPassword"),
      child: Text("Save Password"),
      onPressed: () {
        Provider.of<PasswordsBloc>(context, listen: false).addPassword();
      },
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: Key("PasswordTextField"),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Text',
      ),
      controller: Provider.of<PasswordsBloc>(context, listen: false)
          .textPasswordController,
    );
  }
}
