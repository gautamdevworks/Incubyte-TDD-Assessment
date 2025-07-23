class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    // Convert any literal "\n" sequences (backslash + n) into real new-line
    // characters so that input like "1\n2,3" is handled the same as
    // "1<newline>2,3" typed over multiple lines.
    numbers = numbers.replaceAll(r'\n', '\n');

    String delimiterPattern = '[,\n]';
    String numbersSection = numbers;

    // Check for custom delimiter prefix.
    if (numbers.startsWith('//')) {
      final newlineIndex = numbers.indexOf('\n');
      if (newlineIndex == -1) {
        throw FormatException('Invalid custom delimiter format');
      }

      final customDelimiter = numbers.substring(2, newlineIndex);
      // Allow newline and comma along with custom delimiter.
      delimiterPattern = '(${RegExp.escape(customDelimiter)}|[,\n])';
      numbersSection = numbers.substring(newlineIndex + 1);
    }

    final parts = numbersSection.split(RegExp(delimiterPattern));

    // Convert to integers, tracking negatives.
    final List<int> numbersList = [];
    final List<int> negativeNumbers = [];

    for (final part in parts) {
      if (part.trim().isEmpty) continue;
      final value = int.parse(part.trim());
      numbersList.add(value);
      if (value < 0) negativeNumbers.add(value);
    }

    if (negativeNumbers.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negativeNumbers.join(',')}');
    }

    final sum = numbersList.fold<int>(0, (total, value) => total + value);
    return sum;
  }
} 