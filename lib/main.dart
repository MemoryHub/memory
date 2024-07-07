import 'package:flutter/material.dart';
import 'package:memory/pages/home/home_page.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Memory',
    home: MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
