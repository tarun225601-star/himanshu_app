import 'package:calculator_app/screens/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _controller = TextEditingController();
  String _history = '';
  String _expression = '';

  void _calculate() {
    try {
      Provider.of<CalculatorModel>(context, listen: false).updateExpression(_expression);
      final result = _calculateResult(_expression);
      _controller.text = result.toString();
      _saveHistory(_expression + ' = ' + result.toString());
    } catch (e) {
      _controller.text = 'Error';
    }
  }

  void _saveHistory(String expression) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _history += expression + '\n';
    });
    prefs.setString('history', _history);
  }

  String _calculateResult(String expression) {
    // Implement calculation logic here
    // For example:
    if (expression.contains('+')) {
      final parts = expression.split('+');
      return (double.parse(parts[0]) + double.parse(parts[1])).toString();
    } else if (expression.contains('-')) {
      final parts = expression.split('-');
      return (double.parse(parts[0]) - double.parse(parts[1])).toString();
    } else if (expression.contains('*')) {
      final parts = expression.split('*');
      return (double.parse(parts[0]) * double.parse(parts[1])).toString();
    } else if (expression.contains('/')) {
      final parts = expression.split('/');
      return (double.parse(parts[0]) / double.parse(parts[1])).toString();
    } else {
      return '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 1.2,
                children: [
                  // Implement calculator buttons here
                  // For example:
                  ElevatedButton(
                    onPressed: () {
                      _expression += '7';
                      _controller.text = _expression;
                    },
                    child: Text('7'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _expression += '8';
                      _controller.text = _expression;
                    },
                    child: Text('8'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _expression += '9';
                      _controller.text = _expression;
                    },
                    child: Text('9'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _expression += '/';
                      _controller.text = _expression;
                    },
                    child: Text('/'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _expression += '4';
                      _controller.text = _expression;
                    },
                    child: Text('4'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _expression += '5';
                      _controller.text = _expression;
                    },
                    child: Text('5'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _expression += '6';
                      _controller.text = _expression;
                    },
                    child: Text('6'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _expression += '*';
                      _controller.text = _expression;
                    },
                    child: Text('*'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _expression += '1';
                      _controller.text = _expression;
                    },
                    child: Text('1'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _expression += '2';
                      _controller.text = _expression;
                    },
                    child: Text('2'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _expression += '3';
                      _controller.text = _expression;
                    },
                    child: Text('3'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _expression += '-';
                      _controller.text = _expression;
                    },
                    child: Text('-'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _expression += '0';
                      _controller.text = _expression;
                    },
                    child: Text('0'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _expression += '.';
                      _controller.text = _expression;
                    },
                    child: Text('.'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _expression += '=';
                      _calculate();
                    },
                    child: Text('='),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _expression += '+';
                      _controller.text = _expression;
                    },
                    child: Text('+'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryScreen()),
                );
              },
              child: Text('History'),
            ),
          ],
        ),
      ),
    );
  }
}