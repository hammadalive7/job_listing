import 'package:flutter/material.dart';
import 'package:flutter_listing/constants/strings.dart';
import 'package:flutter_listing/providers/job_provider.dart';
import 'package:provider/provider.dart';
import 'views/job_listing_screen/job_listing_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => JobProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const JobListingScreen(),
    );
  }
}
