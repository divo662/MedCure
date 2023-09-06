import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medcure/features/home/screens/payment%20section/wallet_screen.dart';
import 'package:provider/provider.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/global_constants.dart';
import '../../../providers/appointment_provider.dart';
import '../../../providers/balance_provider.dart';
import '../../../providers/doctor_profile_provider.dart';
import '../../../providers/recent_transaction_provider.dart';
import '../../../widgets/custom_ads_widget.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_easy_steps_widget.dart';
import '../../../widgets/custom_top_doctors_widget.dart';
import 'appointment section/doctor_profile_container.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<RecentTransactionData> recentTransactions = [];
  int selectedDoctorIndex = 0;

  @override
  Widget build(BuildContext context) {
    final balanceProvider = Provider.of<BalanceProvider>(context);
    final doctorProvider = Provider.of<DoctorProvider>(context);
    final recentTransactionsProvider = Provider.of<RecentTransactionsProvider>(context);
    Doctor selectedDoctor = doctorProvider.doctors[selectedDoctorIndex];
    final appointmentsProvider = Provider.of<AppointmentsProvider>(context);

    // Check if there are any new transactions in the recentTransactionsProvider
    if (recentTransactionsProvider.recentTransactions.isNotEmpty) {
      recentTransactions = recentTransactionsProvider.recentTransactions;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: heightValue265,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: darkPurple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: heightValue49,
                    ),
                    Text(
                      "Hey, Divine!",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: heightValue25,
                          letterSpacing: 1),
                    ),
                    SizedBox(
                      height: heightValue6,
                    ),
                    Text(
                      "You have an appointment today.",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: heightValue15,
                      ),
                    ),
                    SizedBox(
                      height: heightValue15,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage("assets/images/doc3.jpg"),
                        ),
                        SizedBox(
                          width: widthValue11,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr. Amanda Uche",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: heightValue16,
                                  letterSpacing: 1),
                            ),
                            Text(
                              "General Physician",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: heightValue14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: widthValue41,
                        ),
                        CustomButton(
                          buttonText: "Attend Now",
                          onTap: () {},
                          buttonHeight: heightValue25,
                          textFontSize: heightValue14,
                          buttonColor: primaryAppColor,
                        )
                      ],
                    ),
                    SizedBox(
                      height: heightValue7,
                    ),
                    Center(
                      child: Container(
                        height: heightValue34,
                        width: widthValue290,
                        decoration: BoxDecoration(
                            color: container2,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: widthValue2,
                            ),
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: widthValue4,
                            ),
                            Text(
                              DateFormat.yMMMMd().format(DateTime.now()),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: widthValue20,
                            ),
                            const Icon(
                              Icons.timelapse_sharp,
                              color: Colors.black,
                            ),
                            const Text(
                              "11:00am-12:00pm",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: heightValue10,
                  ),
                  Text(
                    "Balance",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w600,
                      fontSize: heightValue17,
                    ),
                  ),
                  SizedBox(
                    height: heightValue7,
                  ),
                  Container(
                    height: heightValue138,
                    width: widthValue346,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: primaryAppColor,
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
                          height: heightValue3,
                        ),
                        Text(
                          "Your Balance",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: heightValue17,
                          ),
                        ),
                        SizedBox(
                          height: heightValue3,
                        ),
                        Text(
                          'Balance: ₦${balanceProvider.currentBalance.toStringAsFixed(2)}',
                          // Use balance from the provider.
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: heightValue23,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(
                          height: heightValue7,
                        ),
                        CustomButton(
                          buttonText: "Add to wallet",
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return WalletScreen(
                                    recentTransactions: recentTransactions,
                                    selectedDoctor: selectedDoctor,
                                    appointmentsProvider: appointmentsProvider,
                                  );
                                }));
                          },
                          buttonHeight: heightValue25,
                          textFontSize: heightValue14,
                          buttonColor: darkPurple,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightValue7,
                  ),
                  Text(
                    "Our Doctors",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w600,
                      fontSize: heightValue17,
                    ),
                  ),
                  SizedBox(
                    height: heightValue12,
                  ),
                  SizedBox(
                    height: heightValue200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: doctorProvider.doctors.length,
                      itemBuilder: (BuildContext context, int index) {
                        final doctor = doctorProvider.doctors[index];
                        return DoctorWidget(
                          doctor: doctor,
                          onDoctorSelected: (selectedDoctor) {
                            appointmentsProvider.updateSelectedDoctor(selectedDoctor);
                            // Navigate to the DoctorProfile screen with the selected doctor's data
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorProfile(
                                  selectedDoctor: selectedDoctor,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: heightValue5,
                  ),
                  Container(
                    height: heightValue188,
                    width: widthValue365,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(1, 3),
                              blurRadius: 4,
                              color: Colors.grey.shade500,
                              spreadRadius: 1)
                        ]),
                    child: Image.asset(
                      "assets/images/frame1.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: heightValue5,
                  ),
                  Text(
                    "Health Articles",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w600,
                      fontSize: heightValue17,
                    ),
                  ),
                  SizedBox(
                    height: heightValue5,
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        AdsWidget(),
                        AdsWidget(),
                        AdsWidget(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightValue12,
                  ),
                  Text(
                    "Book appointment in 3 easy steps",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w600,
                      fontSize: heightValue17,
                    ),
                  ),
                  const CustomStepsListWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

