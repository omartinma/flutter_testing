import 'package:flutter/material.dart';
import 'package:flutter_testing/core/providers/passwords_provider.dart';
import 'package:provider/provider.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PasswordsProvider>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.shouldDisplayError) {
        final snackBar = SnackBar(content: Text('Error adding password'));
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
          PasswordInstructions(),
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
      color: Colors.blue,
      textColor: Colors.white,
      child: Text("Save Password"),
      onPressed: () {
        Provider.of<PasswordsProvider>(context, listen: false).addPassword();
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
      controller: Provider.of<PasswordsProvider>(context, listen: false)
          .textPasswordController,
    );
  }
}

class PasswordInstructions extends StatelessWidget {
  const PasswordInstructions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Must have 8 characters"),
          Text("Must have at least 1 digit"),
          Text("Must have at least 1 uppercase"),
        ],
      ),
    );
  }
}
