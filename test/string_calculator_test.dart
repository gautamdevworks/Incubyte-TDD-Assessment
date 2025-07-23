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

    test('returns the sum for multiple numbers separated by comma', () {
      final calculator = StringCalculator();
      expect(calculator.add('1,2,3'), equals(6));
      expect(calculator.add('4,5,6,7,8'), equals(30));
    });

    group('newline delimiter support', () {
      test('handles numbers separated by newline', () {
        final calculator = StringCalculator();
        expect(calculator.add('1\n2'), equals(3));
        expect(calculator.add('10\n20\n30'), equals(60));
      });

      test('handles mixed comma and newline delimiters', () {
        final calculator = StringCalculator();
        expect(calculator.add('1\n2,3'), equals(6));
        expect(calculator.add('4,5\n6'), equals(15));
      });
    });

   group('custom delimiter support', () {
      test('supports a custom delimiter specified with //delim\\n', () {
        final calculator = StringCalculator();
        expect(calculator.add('//;\n1;2'), equals(3));
        expect(calculator.add('//*\n2*3*4'), equals(9));
      });
    });
     

    group('negative number handling', () {
      test('throws an exception when a negative number is present', () {
        final calculator = StringCalculator();
        expect(
          () => calculator.add('-1'),
          throwsA(isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('negative numbers not allowed -1'),
          )),
        );
      });

      test('lists all negative numbers in the exception message', () {
        final calculator = StringCalculator();
        expect(
          () => calculator.add('1,-2,-3,4'),
          throwsA(isA<Exception>().having(
            (e) => e.toString(),
            'message',
            allOf(contains('-2'), contains('-3')),
          )),
        );
      });
    });
  });
} 