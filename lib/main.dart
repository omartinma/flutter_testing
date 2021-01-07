import 'package:flutter/material.dart';
import 'package:flutter_testing/ui/home_page.dart';
import 'package:provider/provider.dart';

import 'core/blocs/notes_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotesBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: HomePage(),
      ),
    );
  }
}
