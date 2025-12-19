import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(SentinelApp());
}

class SentinelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sentinel v0.1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
