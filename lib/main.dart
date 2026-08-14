import 'package:calculator_app/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalculatorModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorModel with ChangeNotifier {
  String _expression = '';
  String get expression => _expression;

  void updateExpression(String newExpression) {
    _expression = newExpression;
    notifyListeners();
  }
}