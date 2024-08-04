import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Listings',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Container(),
    );
  }
}

