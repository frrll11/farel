import 'package:flutter/material.dart';
import 'pages/profile_pages.dart';
import 'pages/edit_profile_pages.dart';

void main() {
  runApp(EduApp());
}

class EduApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Learning App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ProfileScreen(),
        '/edit': (context) => EditProfileScreen(),
      },
    );
  }
}