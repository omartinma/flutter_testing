import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testing/core/blocs/passwords/passwords_bloc.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordsBloc, PasswordsState>(
      listener: (context, state) {
        if (state is PasswordError) {
          final snackBar = SnackBar(content: Text('Error adding password'));
          Scaffold.of(context).showSnackBar(snackBar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PasswordTextField(),
            SaveButtonPassword(),
            PasswordInstructions(),
          ],
        ),
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
        BlocProvider.of<PasswordsBloc>(context).add(CreatePassword());
      },
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key key}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordsBloc, PasswordsState>(
      listener: (context, state) {
        if (state is PasswordSaved) {
          _textEditingController.clear();
        }
      },
      child: TextField(
        key: Key("PasswordTextField"),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Text',
        ),
        onChanged: (value) {
          BlocProvider.of<PasswordsBloc>(context)
              .add(ChangePassword(newPassword: value));
        },
        controller: _textEditingController,
      ),
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
