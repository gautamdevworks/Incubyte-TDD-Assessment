import 'package:flutter_test/flutter_test.dart';

import 'package:incubyte_tdd_assessment/string_calculator.dart';

void main() {
  group('StringCalculator.add', () {
    test('returns 0 for an empty string', () {
      final calculator = StringCalculator();
      expect(calculator.add(''), equals(0));
    });

    test('returns the number itself for a single number', () {
      final calculator = StringCalculator();
      expect(calculator.add('1'), equals(1));
      expect(calculator.add('42'), equals(42));
    });

    test('returns the sum for two numbers separated by comma', () {
      final calculator = StringCalculator();
      expect(calculator.add('1,5'), equals(6));
      expect(calculator.add('10,20'), equals(30));
    });
  });
} 