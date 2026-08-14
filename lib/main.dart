import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const CalculatorApp(),
    ),
  );
}
class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Calculator App',
          theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: const CalculatorPage(),
        );
      },
    );
  }
}
class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}
class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = TextEditingController();
  String _result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '0',
                    ),
                  ),
                  Text(
                    _result,
                    style: const TextStyle(fontSize: 24),
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
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    _controller.text += '7';
                  },
                  child: const Text('7'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    _controller.text += '8';
                  },
                  child: const Text('8'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    _controller.text += '9';
                  },
                  child: const Text('9'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    _controller.text += '/';
                  },
                  child: const Text('/'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    _controller.text += '4';
                  },
                  child: const Text('4'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    _controller.text += '5';
                  },
                  child: const Text('5'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    _controller.text += '6';
                  },
                  child: const Text('6'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    _controller.text += '*';
                  },
                  child: const Text('*'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    _controller.text += '1';
                  },
                  child: const Text('1'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    _controller.text += '2';
                  },
                  child: const Text('2'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    _controller.text += '3';
                  },
                  child: const Text('3'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    _controller.text += '-';
                  },
                  child: const Text('-'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    _controller.text += '0';
                  },
                  child: const Text('0'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    _controller.text += '.';
                  },
                  child: const Text('.'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    _controller.text += '=';
                  },
                  child: const Text('='),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    _controller.text += '+';
                  },
                  child: const Text('+'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}