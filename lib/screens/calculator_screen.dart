import 'package:calculator_app/screens/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorModel with ChangeNotifier {
  String _expression = '';
  String _result = '';
  List<String> _history = [];
  final SharedPreferences _prefs;

  CalculatorModel(this._prefs) {
    _loadHistory();
  }

  String get expression => _expression;
  String get result => _result;
  List<String> get history => _history;

  void _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    _history = prefs.getStringList('history') ?? [];
    notifyListeners();
  }

  void calculate(String input) {
    if (input == 'AC') {
      _expression = '';
      _result = '';
    } else if (input == '<') {
      _expression = _expression.substring(0, _expression.length - 1);
    } else if (input == '=') {
      try {
        _result = _calculate(_expression);
        _history.add('$_expression = $_result');
        _saveHistory();
      } catch (e) {
        _result = 'Error';
      }
    } else {
      _expression += input;
    }
    notifyListeners();
  }

  String _calculate(String expression) {
    // Implement calculation logic here
    return '0';
  }

  void _saveHistory() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('history', _history);
  }
}

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calculatorModel = Provider.of<CalculatorModel>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    calculatorModel.expression,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text(
                    calculatorModel.result,
                    style: TextStyle(fontSize: 48, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1.2,
              children: [
                CalculatorButton('7', () {
                  calculatorModel.calculate('7');
                }),
                CalculatorButton('8', () {
                  calculatorModel.calculate('8');
                }),
                CalculatorButton('9', () {
                  calculatorModel.calculate('9');
                }),
                CalculatorButton('/', () {
                  calculatorModel.calculate('/');
                }),
                CalculatorButton('4', () {
                  calculatorModel.calculate('4');
                }),
                CalculatorButton('5', () {
                  calculatorModel.calculate('5');
                }),
                CalculatorButton('6', () {
                  calculatorModel.calculate('6');
                }),
                CalculatorButton('*', () {
                  calculatorModel.calculate('*');
                }),
                CalculatorButton('1', () {
                  calculatorModel.calculate('1');
                }),
                CalculatorButton('2', () {
                  calculatorModel.calculate('2');
                }),
                CalculatorButton('3', () {
                  calculatorModel.calculate('3');
                }),
                CalculatorButton('-', () {
                  calculatorModel.calculate('-');
                }),
                CalculatorButton('0', () {
                  calculatorModel.calculate('0');
                }),
                CalculatorButton('.', () {
                  calculatorModel.calculate('.');
                }),
                CalculatorButton('=', () {
                  calculatorModel.calculate('=');
                }),
                CalculatorButton('+', () {
                  calculatorModel.calculate('+');
                }),
                CalculatorButton('AC', () {
                  calculatorModel.calculate('AC');
                }),
                CalculatorButton('<', () {
                  calculatorModel.calculate('<');
                }),
                CalculatorButton('%', () {
                  calculatorModel.calculate('%');
                }),
                CalculatorButton('History', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryScreen()),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CalculatorButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}