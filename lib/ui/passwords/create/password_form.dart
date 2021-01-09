import 'package:flutter/material.dart';
import 'package:flutter_testing/core/blocs/passwords_bloc.dart';
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
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Text',
            ),
            controller: controller.textPasswordController,
          ),
          RaisedButton(
            child: Text("Save Password"),
            onPressed: () {
              Provider.of<PasswordsBloc>(context, listen: false).addPassword();
            },
          ),
        ],
      ),
    );
  }
}
