import 'package:flutter/material.dart';
import 'example.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rating Dialog Demo',
      theme: ThemeData.dark(),
      home: ExampleScreen(),
    );
  }
}
