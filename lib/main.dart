import 'package:daipepass/commons/daipepass_theme.dart';
import 'package:daipepass/views/home_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DaipepassTheme theme = DaipepassTheme();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: theme.pearl,
      ),
      home: HomePage(),
    );
  }
}
