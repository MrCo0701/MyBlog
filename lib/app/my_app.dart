import 'package:flutter/material.dart';
import 'package:my_blog/features/authentication/presentation/pages/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Blog',
      debugShowCheckedModeBanner: false,
      home: LoginScreen()
    );
  }
}
