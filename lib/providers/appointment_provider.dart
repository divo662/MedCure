import 'package:flutter/cupertino.dart';
import 'package:medcure/providers/recent_transaction_provider.dart';

import 'doctor_profile_provider.dart';

/// Model/ Provider to book appointments with a selected doctor.
class Appointment {
  final Doctor doctor;
  final DateTime date;
  final String time;
  String status;
  final String illnessDescription;

  Appointment({
    required this.doctor,
    required this.date,
    required this.time,
    required this.status,
    required this.illnessDescription,
  });
}

class AppointmentsProvider with ChangeNotifier {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now().add(const Duration(days: 1));
  List<String> times = [
    '9:00am',
    '9:30am',
    '10:00am',
    '10:30am',
    '11:00am',
    '11:30am',
    '12:00pm',
  ];
  int selectedIndex = -1;
  String? _selectedIllness; /// This will hold the selected illness description.
  TextEditingController descController = TextEditingController();

  final List<String> _options = ["Online", "Physical"];
  late int _appointmentTypeIndex = -1;

  List<String> get options => _options;

  int get appointmentTypeIndex => _appointmentTypeIndex;

  List<RecentTransactionData> recentTransactions = [];

  /// Method to add a recent transaction
  void addRecentTransaction(RecentTransactionData transaction) {
    recentTransactions.add(transaction);
    notifyListeners();
  }


  /// Getters for selectedDay and focusedDay
  DateTime get selectedDay => _selectedDay;

  DateTime get focusedDay => _focusedDay;

  /// Method to update selectedDay
  void updateSelectedDay(DateTime newSelectedDay) {
    _selectedDay = newSelectedDay;
    notifyListeners();
  }

  /// Method to update focusedDay
  void updateFocusedDay(DateTime newFocusedDay) {
    _focusedDay = newFocusedDay;
    notifyListeners();
  }

  Doctor? _selectedDoctor;

  /// Getter to access the selected doctor
  Doctor? get selectedDoctor => _selectedDoctor;

  String? get selectedIllness => _selectedIllness;

  ///Method to update the selected doctor
  void updateSelectedDoctor(Doctor doctor) {
    _selectedDoctor = doctor;
    notifyListeners();
  }

  /// Method to update selectedIndex
  void updateSelectedIndex(int newIndex) {
    selectedIndex = newIndex;
    notifyListeners();
  }

  ///Method to update the selected illness
  void updateSelectedIllness(String? illness) {
    _selectedIllness = illness;
    notifyListeners();
  }

  /// Getter for selected appointment type
  String get selectedAppointmentType =>
      _appointmentTypeIndex >= 0 ? _options[_appointmentTypeIndex] : "";

  /// Method to set the selected appointment type
  void setSelectedIndex(int index) {
    _appointmentTypeIndex = index;
    notifyListeners();
  }
  List<Appointment> appointments = []; /// List to store appointments

  /// Add method to add appointments
  void addAppointment(Appointment appointment) {
    appointments.add(appointment);
    notifyListeners();
  }

  /// Add method to update the status of an appointment
  void updateAppointmentStatus(int index, String newStatus) {
    if (index >= 0 && index < appointments.length) {
      appointments[index].status = newStatus;
      notifyListeners();
    }
  }
}


