import 'dart:convert';

class Password {
  String text;
  Password({
    this.text,
  });

  Password copyWith({
    String text,
  }) {
    return Password(
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }

  factory Password.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Password(
      text: map['text'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Password.fromJson(String source) =>
      Password.fromMap(json.decode(source));

  @override
  String toString() => 'Password(text: $text)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Password && o.text == text;
  }

  @override
  int get hashCode => text.hashCode;
}
