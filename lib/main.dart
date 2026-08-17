import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Simple Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _num1Controller = TextEditingController();
  final _num2Controller = TextEditingController();
  String _result = '';

  void _add() {
    final num1 = double.parse(_num1Controller.text);
    final num2 = double.parse(_num2Controller.text);
    setState(() {
      _result = (num1 + num2).toString();
    });
  }

  void _subtract() {
    final num1 = double.parse(_num1Controller.text);
    final num2 = double.parse(_num2Controller.text);
    setState(() {
      _result = (num1 - num2).toString();
    });
  }

  void _multiply() {
    final num1 = double.parse(_num1Controller.text);
    final num2 = double.parse(_num2Controller.text);
    setState(() {
      _result = (num1 * num2).toString();
    });
  }

  void _divide() {
    final num1 = double.parse(_num1Controller.text);
    final num2 = double.parse(_num2Controller.text);
    if (num2 != 0) {
      setState(() {
        _result = (num1 / num2).toString();
      });
    } else {
      setState(() {
        _result = 'Error: Division by zero';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              decoration: const InputDecoration(
                labelText: 'Number 1',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _num2Controller,
              decoration: const InputDecoration(
                labelText: 'Number 2',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _add,
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: _subtract,
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: _multiply,
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: _divide,
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}