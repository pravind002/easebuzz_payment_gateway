import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/home_page.dart';

MethodChannel channel = const MethodChannel('easebuzz');
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easebuzz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //
      home: const HomePage(),
    );
  }
}
