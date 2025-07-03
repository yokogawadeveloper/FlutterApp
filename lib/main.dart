import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kaam_dekho/login.dart';
import 'package:kaam_dekho/providers/language_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaam Dekho',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: LoginPage(),
    );
  }
}
