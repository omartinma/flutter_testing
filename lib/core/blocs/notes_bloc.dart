import 'package:flutter/material.dart';
import 'package:flutter_testing/core/models/note.dart';

class NotesBloc extends ChangeNotifier {
  List<Note> _notes;
  List<Note> get notes => _notes;

  bool shouldDisplayError = false;

  TextEditingController textNoteController = TextEditingController();

  NotesBloc() {
    _notes = List<Note>();
  }

  addNote() {
    final note = Note(
      text: textNoteController.text,
    );
    bool isValidNote = checkValidNote();
    if (isValidNote) {
      _notes.add(note);
      textNoteController.clear();
    } else {
      shouldDisplayError = true;
    }
    notifyListeners();
  }

  checkValidNote() {
    //Whatever business logic
    return false;
  }
}
