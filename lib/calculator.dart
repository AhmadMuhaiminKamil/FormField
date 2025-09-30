import 'package:flutter/material.dart';

void main() => runApp(const Kabataku());

class Kabataku extends StatelessWidget {
  const Kabataku({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Calculator Kabataku')),
        body: const MyCalc(),
      ),
    );
  }
}

class MyCalc extends StatefulWidget {
  const MyCalc({super.key});

  @override
  State<MyCalc> createState() => _MyCalcState();
}

class _MyCalcState extends State<MyCalc> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  double? result;

  void _calculate(String operator) {
    final double num1 = double.tryParse(_num1Controller.text) ?? 0;
    final double num2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      switch (operator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '×':
          result = num1 * num2;
          break;
        case '÷':
          result = num2 != 0 ? num1 / num2 : double.nan;
          break;
      }
    });
  }

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Masukkan Angka ke-1'),
          const SizedBox(height: 10),
          TextField(
            controller: _num1Controller,
            decoration: const InputDecoration(
              labelText: 'Angka Pertama',
              hintText: '0',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          const Text('Masukkan Angka ke-2'),
          const SizedBox(height: 10),
          TextField(
            controller: _num2Controller,
            decoration: const InputDecoration(
              labelText: 'Angka Kedua',
              hintText: '0',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: [
              ElevatedButton(
                onPressed: () => _calculate('+'),
                child: const Text('+'),
              ),
              ElevatedButton(
                onPressed: () => _calculate('-'),
                child: const Text('-'),
              ),
              ElevatedButton(
                onPressed: () => _calculate('×'),
                child: const Text('×'),
              ),
              ElevatedButton(
                onPressed: () => _calculate('÷'),
                child: const Text('÷'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            result == null ? 'Hasil: -' : 'Hasil: $result',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
