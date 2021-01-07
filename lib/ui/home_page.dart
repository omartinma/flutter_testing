import 'package:flutter/material.dart';
import 'package:flutter_testing/ui/notes/create/note_form.dart';
import 'package:flutter_testing/ui/notes/list/note_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: NoteForm()),
            Container(
              color: Colors.black,
              height: 1,
            ),
            Expanded(child: NoteList()),
          ],
        ),
      ),
    );
  }
}
