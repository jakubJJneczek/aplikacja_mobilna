import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Cart(),
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}
