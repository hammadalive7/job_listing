import 'package:flutter/material.dart';
import 'package:flutter_listing/constants/strings.dart';
import 'package:flutter_listing/providers/job_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'views/job_listing_screen/job_listing_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => JobProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.leagueSpartanTextTheme(),
      ),
      home: const JobListingScreen(),
    );
  }
}
