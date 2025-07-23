class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    final parts = numbers.split(RegExp('[,\n]'));

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