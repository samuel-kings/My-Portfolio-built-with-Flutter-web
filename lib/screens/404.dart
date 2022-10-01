// ignore_for_file: file_names
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  final String name;
  const NotFoundPage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Page not found: $name', style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}