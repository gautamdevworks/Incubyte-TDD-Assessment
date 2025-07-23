import 'package:flutter/material.dart';

import 'string_calculator.dart';

class StringCalculatorScreen extends StatefulWidget {
  const StringCalculatorScreen({super.key});

  @override
  State<StringCalculatorScreen> createState() => _StringCalculatorScreenState();
}

class _StringCalculatorScreenState extends State<StringCalculatorScreen> {
  final _controller = TextEditingController();
  String? _output;

  void _calculate() {
    final input = _controller.text;
    try {
      final result = StringCalculator().add(input);
      setState(() {
        _output = 'Result: $result';
      });
    } catch (e) {
      setState(() {
        _output = e.toString();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('String Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter numbers string',
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            if (_output != null)
              Text(
                _output!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
          ],
        ),
      ),
    );
  }
} 