import 'package:flutter/material.dart';
import 'package:medcure/features/home/screens/payment%20section/wallet_screen.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/global_constants.dart';
import '../../../../providers/appointment_provider.dart';
import '../../../../providers/balance_provider.dart';
import '../../../../providers/doctor_profile_provider.dart';
import '../../../../providers/recent_transaction_provider.dart';
import '../../../../widgets/custom_button.dart';

class DoctorCongratulationScreen extends StatefulWidget {
  final double deductedAmount;
  final Doctor selectedDoctor;
  final BalanceProvider paymentData;
  final AppointmentsProvider appointmentsProvider;
  final List<RecentTransactionData> recentTransactions;

  const DoctorCongratulationScreen(
      {Key? key,
      required this.deductedAmount,
      required this.selectedDoctor,
      required this.paymentData,
      required this.recentTransactions,
      required this.appointmentsProvider})
      : super(key: key);

  @override
  State<DoctorCongratulationScreen> createState() =>
      _DoctorCongratulationScreenState();
}

class _DoctorCongratulationScreenState
    extends State<DoctorCongratulationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryAppColor,
      body: Center(
        child: Container(
          height: heightValue600,
          width: widthValue326,
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(1, 3),
                    blurRadius: 4,
                    color: Colors.grey.shade800,
                    spreadRadius: 1)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset("assets/images/flowers.png")),
              Center(
                child: Container(
                  height: heightValue46,
                  width: widthValue60,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.payments_sharp,
                    color: primaryAppColor,
                  ),
                ),
              ),
              SizedBox(
                height: heightValue14,
              ),
              Center(
                child: Text(
                  "Transaction Successful",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: darkPurple,
                      fontSize: heightValue24,
                      wordSpacing: 1.3,
                      letterSpacing: 0.7),
                ),
              ),
              Center(
                child: Text(
                  "You've successfully booked an appointment",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: subTitleText,
                    fontSize: heightValue14,
                  ),
                ),
              ),
              SizedBox(
                height: heightValue19,
              ),
              Center(
                child: Text(
                  "Appointment fee",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: subTitleText,
                    fontSize: heightValue14,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "₦${widget.deductedAmount.toStringAsFixed(2)}",
                  // Display deducted amount
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: darkPurple,
                    fontSize: heightValue24,
                    wordSpacing: 1.3,
                    letterSpacing: 0.7,
                  ),
                ),
              ),
              SizedBox(
                height: heightValue19,
              ),
              Center(
                child: Text(
                  "------------------------------------------------",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w600,
                    fontSize: heightValue15,
                  ),
                ),
              ),
              SizedBox(
                height: heightValue19,
              ),
              Center(
                child: Container(
                  height: heightValue64,
                  width: widthValue290,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Continue to your Appointment",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15.5,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: heightValue35,
              ),
              Center(
                child: CustomButton(
                    buttonText: "Continue",
                    buttonColor: primaryAppColor,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return WalletScreen(
                            recentTransactions: widget.recentTransactions,
                            selectedDoctor: widget.selectedDoctor,
                            appointmentsProvider: widget.appointmentsProvider
                        );
                      }));
                    },
                    buttonHeight: heightValue54,
                    buttonWidth: widthValue290,
                    textFontSize: heightValue18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
