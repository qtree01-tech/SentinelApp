import 'package:flutter/material.dart';

void main() {
  runApp(const SentinelApp());
}

class SentinelApp extends StatelessWidget {
  const SentinelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sentinel',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sentinel'),
        ),
        body: const Center(
          child: Text('Sentinel APK Test Build'),
        ),
      ),
    );
  }
}
