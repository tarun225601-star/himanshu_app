import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calculatorModel = Provider.of<CalculatorModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: ListView.builder(
        itemCount: calculatorModel.history.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(calculatorModel.history[index]),
          );
        },
      ),
    );
  }
}