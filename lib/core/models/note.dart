import 'dart:convert';

class Note {
  String text;
  Note({
    this.text,
  });

  Note copyWith({
    String text,
  }) {
    return Note(
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Note(
      text: map['text'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));

  @override
  String toString() => 'Note(text: $text)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Note && o.text == text;
  }

  @override
  int get hashCode => text.hashCode;
}
