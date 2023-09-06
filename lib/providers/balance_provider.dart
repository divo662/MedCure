import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

class BalanceModel {
  double currentBalance;

  BalanceModel(this.currentBalance);
}


class BalanceProvider extends ChangeNotifier {
  double _currentBalance = 0; // Initial balance, you can set it to whatever you want.

  double get currentBalance => _currentBalance;

  bool updateBalance(double newBalance) {
    try {
      _currentBalance = newBalance;
      notifyListeners();
      return true; // Indicate success.
    } catch (e) {
      return false; // Indicate failure.
    }
  }

  bool hasEnoughBalance(double amount) {
    return _currentBalance >= amount;
  }

  bool deductBalance(double amount) {
    if (hasEnoughBalance(amount)) {
      // Deduct the cost
      _currentBalance -= amount;
      notifyListeners();
      return true; // Deduction successful
    } else {
      return false; // Not enough balance
    }
  }
}
