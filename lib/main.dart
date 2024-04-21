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
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (BuildContext context) => Cart(),
        builder: (context, child) {
          return const Home();
        },
      ),
    );
  }
}
