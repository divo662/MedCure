import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/global_constants.dart';
import '../../../../providers/appointment_provider.dart';
import '../../../../providers/balance_provider.dart';
import '../../../../providers/doctor_profile_provider.dart';
import '../../../../providers/recent_transaction_provider.dart';
import '../../../../widgets/custom_button.dart';
import '../appointment section/doctor_congratulations_screen.dart';

class ConfirmPayment extends StatefulWidget {
  final Doctor selectedDoctor;
  final BalanceProvider updatedBalance;
  final AppointmentsProvider appointmentsProvider;

  const ConfirmPayment(
      {Key? key,
      required this.selectedDoctor,
      required this.updatedBalance,
      required this.appointmentsProvider})
      : super(key: key);

  @override
  State<ConfirmPayment> createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  List<RecentTransactionData> recentTransactions = [];

  double calculateTotalCost(Doctor selectedDoctor) {
    // Parse the doctor's price (assuming it's a string like "₦X,XXX.XX")
    final doctorPrice = double.parse(
        selectedDoctor.price.replaceAll('₦', '').replaceAll(',', ''));

    // Tax amount
    const tax = 5000.0;

    // Calculate the total cost
    final totalCost = doctorPrice + tax;

    return totalCost;
  }

  void _confirmPayment() {
    final Doctor selectedDoctor = widget.selectedDoctor;
    final double totalCost = calculateTotalCost(selectedDoctor);
    print("selectedIllness: ${widget.appointmentsProvider.selectedIllness}");
    print("description: ${widget.appointmentsProvider.descController.text}");
    print("selectedDate: ${widget.appointmentsProvider.selectedDay}");
    print("selectedTime: ${widget.appointmentsProvider.selectedIndex}");

    if (widget.updatedBalance.hasEnoughBalance(totalCost)) {
      // Deduct the cost from the balance
      if (widget.updatedBalance.deductBalance(totalCost)) {
        // Add the transaction to the recentTransactions list
        RecentTransactionData transactionData = RecentTransactionData(
          selectedDoctor: selectedDoctor,
          appointmentsProvider: widget.appointmentsProvider,
          deductedAmount: totalCost,
          timestamp: DateTime.now(),
          status: 'Upcoming',
        );
        recentTransactions.add(transactionData);
        // Create SampleScreen with all the data
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DoctorCongratulationScreen(
              deductedAmount: totalCost,
              selectedDoctor: selectedDoctor,
              paymentData: widget.updatedBalance,
              recentTransactions: recentTransactions,
              appointmentsProvider: widget.appointmentsProvider);
        }));
      } else {
        // Handle deduction failure
        // Nothing here for now.
      }
    } else {
      // Show an error message indicating insufficient balance.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: primaryAppColor,
          behavior: SnackBarBehavior.floating,
          content: Text(
            "Insufficient funds. Please add money to continue.",
            style: TextStyle(
                color: Colors.white,
                fontSize: heightValue16,
                fontWeight: FontWeight.w600),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppointmentsProvider>(
      builder: (context, appointmentProvider, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.blue.shade900,
                  ),
                ),
              ),
            ),
            title: Text(
              "Payment",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: heightValue23,
                  letterSpacing: 1),
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: heightValue17,
                  ),
                  Text(
                    "Booking Info",
                    style: TextStyle(
                        color: darkPurple,
                        fontWeight: FontWeight.w500,
                        fontSize: heightValue20),
                  ),
                  SizedBox(
                    height: heightValue10,
                  ),
                  SizedBox(
                    height: heightValue17,
                  ),
                  Text(
                    "Select Appointment Type",
                    style: TextStyle(
                        color: darkPurple,
                        fontWeight: FontWeight.w500,
                        fontSize: heightValue18),
                  ),
                  SizedBox(
                    height: heightValue10,
                  ),
                  StatefulBuilder(
                    builder: (context, innerSetState) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  appointmentProvider.options.length, (index) {
                                final option =
                                    appointmentProvider.options[index];
                                final isSelected = index ==
                                    appointmentProvider.appointmentTypeIndex;
                                return GestureDetector(
                                  onTap: () {
                                    appointmentProvider.setSelectedIndex(
                                        isSelected ? -1 : index);
                                  },
                                  child: Container(
                                    width: widthValue100,
                                    height: heightValue41,
                                    margin: const EdgeInsets.all(6),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.orange.shade200
                                          : Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        option,
                                        style: TextStyle(
                                          color: isSelected
                                              ? primaryAppColor
                                              : Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: heightValue15,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            Visibility(
                              visible:
                                  appointmentProvider.appointmentTypeIndex == 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: heightValue44,
                                  width: widthValue305,
                                  decoration: BoxDecoration(
                                      color: container2,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.location_history,
                                          color: Colors.blue.shade700,
                                        ),
                                        Text(
                                          'Ojota, Mainland, Lagos State, Nigeria.',
                                          style: TextStyle(
                                              color: Colors.blue.shade700,
                                              fontSize: heightValue16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: heightValue17,
                  ),
                  Text(
                    "Payment Info",
                    style: TextStyle(
                        color: darkPurple,
                        fontWeight: FontWeight.w500,
                        fontSize: heightValue18),
                  ),
                  SizedBox(
                    height: heightValue10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500,
                            fontSize: heightValue16),
                      ),
                      Text(
                        widget.selectedDoctor.price,
                        style: TextStyle(
                            color: darkPurple,
                            fontWeight: FontWeight.w500,
                            fontSize: heightValue16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heightValue5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tax",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500,
                            fontSize: heightValue16),
                      ),
                      Text(
                        "₦5,000.00",
                        style: TextStyle(
                            color: darkPurple,
                            fontWeight: FontWeight.w500,
                            fontSize: heightValue16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heightValue25,
                  ),
                  Text(
                    "Total",
                    style: TextStyle(
                        color: darkPurple,
                        fontWeight: FontWeight.w500,
                        fontSize: heightValue18),
                  ),
                  SizedBox(
                    height: heightValue10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500,
                            fontSize: heightValue16),
                      ),
                      Text(
                        "₦${calculateTotalCost(widget.selectedDoctor).toStringAsFixed(2)}",
                        style: TextStyle(
                            color: darkPurple,
                            fontWeight: FontWeight.w500,
                            fontSize: heightValue16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heightValue47,
                  ),
                  Center(
                    child: CustomButton(
                      buttonText:
                          "Confirm and pay ${calculateTotalCost(widget.selectedDoctor).toStringAsFixed(2)}",
                      onTap: () {
                        _confirmPayment();
                      },
                      buttonHeight: heightValue50,
                      textFontSize: heightValue16,
                      buttonWidth: widthValue351,
                      buttonColor: primaryAppColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
