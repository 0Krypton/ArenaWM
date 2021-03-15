extension GetAmountWithPrefix on String {
  String get amountWithPrefix {
    final int amount = int.parse(this);
    if (amount > 1000) {
      if (amount >= 1000 && amount < 1000000) {
        // 10k 100k
        double num = amount / 1000;
        return "${num.toStringAsFixed(1)}k";
      } else if (amount >= 1000000) {
        double num = amount / 1000000;
        return "${num.toStringAsFixed(2)}m";
      }
      return '';
      // Do something
    } else {
      return '$amount';
    }
  }
}
