import 'package:flutter/material.dart';
import 'package:ecopatch_app/screens/main_navigation_screen.dart';
import 'package:ecopatch_app/theme/app_theme.dart';

void main() {
  runApp(const EcoPatchApp());
}

class EcoPatchApp extends StatelessWidget {
  const EcoPatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoPatch',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const MainNavigationScreen(),
    );
  }
}
