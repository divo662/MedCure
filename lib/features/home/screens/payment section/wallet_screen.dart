import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medcure/features/home/screens/bottom_nav.dart';
import 'package:medcure/features/home/screens/appointment%20section/meeting_section.dart';
import 'package:medcure/providers/appointment_provider.dart';
import 'package:provider/provider.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/global_constants.dart';
import '../../../../providers/balance_provider.dart';
import '../../../../providers/doctor_profile_provider.dart';
import '../../../../providers/recent_transaction_provider.dart';
import '../../../../widgets/custom_Attend_now _Widget.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_transition.dart';
import 'payment_method.dart';

class WalletScreen extends StatefulWidget {
  final List<RecentTransactionData> recentTransactions;
  final Doctor selectedDoctor;
  final AppointmentsProvider appointmentsProvider;

  const WalletScreen({
    Key? key,
    required this.recentTransactions,
    required this.selectedDoctor,
    required this.appointmentsProvider,
  }) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    // Inside your build method
    if (kDebugMode) {
      print("Number of Transactions: ${widget.recentTransactions.length}");
    }
    final balanceProvider = Provider.of<BalanceProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const BottomNavPage();
              }));
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: heightValue19,
              ),
              Container(
                height: heightValue188,
                width: widthValue365,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: darkPurple,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(1, 3),
                          blurRadius: 4,
                          color: Colors.grey.shade500,
                          spreadRadius: 1)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: heightValue9,
                    ),
                    Text(
                      "Your Balance",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w600,
                        fontSize: heightValue15,
                      ),
                    ),
                    Text(
                      'Balance: ₦${balanceProvider.currentBalance.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: heightValue23,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(
                      height: heightValue49,
                    ),
                    Center(
                      child: CustomButton(
                          buttonText: "Add Payment",
                          buttonColor: primaryAppColor,
                          onTap: () {
                            Navigator.push(
                                context,
                                MyTransition(
                                  oldScreen: WalletScreen(
                                    recentTransactions:
                                        widget.recentTransactions,
                                    appointmentsProvider:
                                        widget.appointmentsProvider,
                                    selectedDoctor: widget.selectedDoctor,
                                  ),
                                  newScreen: const PaymentMethodScreen(),
                                ));
                          },
                          buttonHeight: heightValue37,
                          buttonWidth: widthValue276,
                          textFontSize: heightValue18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: heightValue23,
              ),
              Text(
                "------------------- Recent Transactions -------------------",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w600,
                  fontSize: heightValue15,
                ),
              ),
              SizedBox(
                height: heightValue15,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.recentTransactions.length,
                itemBuilder: (context, index) {
                  final recentTransaction = widget.recentTransactions[index];
                  // Determine the 'options' based on the selected index
                  return AttendNowWidget(
                    status: recentTransaction.status,
                    description: recentTransaction
                        .appointmentsProvider.descController.text,
                    selectedDate:
                        recentTransaction.appointmentsProvider.selectedDay,
                    selectedTime: recentTransaction.appointmentsProvider.times[
                        recentTransaction.appointmentsProvider.selectedIndex],
                    options: (recentTransaction.appointmentsProvider
                                    .appointmentTypeIndex >=
                                0 &&
                            recentTransaction
                                    .appointmentsProvider.appointmentTypeIndex <
                                recentTransaction.appointmentsProvider
                                    .selectedAppointmentType.length)
                        ? recentTransaction
                                .appointmentsProvider.selectedAppointmentType[
                            recentTransaction
                                .appointmentsProvider.appointmentTypeIndex]
                        : 'Online.',
                    // Provide a default value or handle the out-of-bounds case appropriately
                    recentTransactions: widget.recentTransactions,
                    selectedDoctor: widget.selectedDoctor,
                    onDoctorSelected: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MeetingSection(
                                recentTransactions: widget.recentTransactions,
                                selectedDoctor: widget.selectedDoctor,
                                appointmentsProvider: widget.appointmentsProvider)),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
