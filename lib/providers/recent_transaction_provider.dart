import 'package:flutter/cupertino.dart';
import 'appointment_provider.dart';
import 'doctor_profile_provider.dart';
class RecentTransactionData {
  final Doctor selectedDoctor; // The selected doctor for the recent transaction.
  final AppointmentsProvider appointmentsProvider; // The provider for appointment-related data.
  final double deductedAmount; // Added field for deducted amount
  final DateTime timestamp;
  final String status;

  RecentTransactionData({
    required this.selectedDoctor,
    required this.appointmentsProvider,
    required this.deductedAmount, // Added this field
    required this.timestamp,
    required this.status
  });
}

class RecentTransactionsProvider with ChangeNotifier {
  final List<RecentTransactionData> _recentTransactions = [];

  List<RecentTransactionData> get recentTransactions => _recentTransactions;

  void addTransaction(RecentTransactionData transaction) {
    _recentTransactions.add(transaction);
    notifyListeners();
  }
}

