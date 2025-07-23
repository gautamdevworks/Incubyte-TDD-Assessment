# Incubyte TDD Assessment – String Calculator

This repository contains a small Flutter/Dart app and accompanying test-driven-development (TDD) kata implementation of a **String Calculator**.

The core of the project lives in `lib/string_calculator.dart`; it exposes a single public method:

```dart
int add(String numbers)
```

which returns the sum of the numbers embedded in the string.

---
## Supported rules

| #  | Requirement                                                                                                   | Implementation |
|----|---------------------------------------------------------------------------------------------------------------|----------------|
| 1  | An empty string returns **0**.                                                                                | ✔️ `"" → 0` |
| 2  | A single number returns its value.                                                                            | ✔️ `"42" → 42` |
| 3  | Two or more numbers, comma-separated, are summed.                                                             | ✔️ `"1,2,3" → 6` |
| 4  | New line characters (real new-lines **or** the literal sequence `\n`) are accepted as delimiters.            | ✔️ `"1\n2,3" → 6` |
| 5  | A custom one-character delimiter can be defined with the prefix `//<delim>\n`.                               | ✔️ `"//;\n1;2" → 3` |
| 6  | A mix of custom delimiter **plus** commas/new-lines is still valid.                                           | ✔️ `"//|\n1|2,3" → 6` |
| 7  | If **any** negative number is supplied the method throws & lists all negative values in the message.         | ✔️ `"1,-2,-3" → Exception("negative numbers not allowed -2,-3")` |

---
## Quick start

1. **Install dependencies** (Flutter SDK needed):

```bash
flutter pub get
```

2. **Run the unit tests**:

```bash
flutter test
```

All tests (see `test/string_calculator_test.dart`) should pass.

---
## Example usage

```dart
import 'package:incubyte_tdd_assessment/string_calculator.dart';

void main() {
  final calc = StringCalculator();
  print(calc.add('1,2,3'));      // → 6
  print(calc.add('1\n2,3'));    // → 6 (supports new-lines)
  print(calc.add('//;\n4;5;6')); // → 15 (custom delimiter)
}
```

---
## App UI

`lib/string_calculator_screen.dart` provides a minimal Flutter UI where you can type an expression and instantly see the result or any error message.

---
## License

This project is licensed under the MIT License – see `LICENSE` for details.