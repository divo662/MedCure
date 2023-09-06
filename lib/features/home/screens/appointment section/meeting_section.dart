import 'package:flutter/material.dart';
import 'package:medcure/constants/global_constants.dart';
import 'package:medcure/features/home/screens/bottom_nav.dart';
import '../../../../constants/color_constants.dart';
import '../../../../providers/appointment_provider.dart';
import '../../../../providers/doctor_profile_provider.dart';
import '../../../../providers/recent_transaction_provider.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/feedback_congrats_message.dart';

class MeetingSection extends StatefulWidget {
  final List<RecentTransactionData> recentTransactions;
  final Doctor selectedDoctor;
  final AppointmentsProvider appointmentsProvider;

  const MeetingSection(
      {Key? key,
      required this.recentTransactions,
      required this.selectedDoctor,
      required this.appointmentsProvider})
      : super(key: key);

  @override
  State<MeetingSection> createState() => _MeetingSectionState();
}

class _MeetingSectionState extends State<MeetingSection> {
  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: heightValue78,
              ),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(widget.selectedDoctor.docPic),
                ),
              ),
              SizedBox(
                height: heightValue23,
              ),
              Center(
                child: Text(
                  "Your meeting with ${widget.selectedDoctor.docName}\n "
                  "is completed",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: heightValue17,
                    letterSpacing: 1,
                  ),
                ),
              ),
              SizedBox(
                height: heightValue63,
              ),
              Text(
                "We would love to hear from you.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: heightValue17,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: heightValue10,
              ),
              Row(
                children: List.generate(5, (index) {
                  return const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  );
                }),
              ),
              SizedBox(
                height: heightValue17,
              ),
              Text(
                "Feedback",
                style: TextStyle(
                    color: darkPurple,
                    fontWeight: FontWeight.w700,
                    fontSize: heightValue20),
              ),
              SizedBox(
                height: heightValue10,
              ),
              Container(
                height: heightValue110,
                width: heightValue350,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade600,
                    width: 1.5,
                  ),
                ),
                child: TextField(
                  controller: feedbackController,
                  style: TextStyle(
                    fontSize: heightValue17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: heightValue30,
              ),
              CustomButton(
                buttonText: "Submit",
                buttonColor: primaryAppColor,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FeedbackCongratsMessage();
                  }));
                },
                buttonHeight: heightValue50,
                textFontSize: heightValue18,
                buttonWidth: widthValue349,
              ),
              SizedBox(
                height: heightValue10,
              ),
              CustomButton(
                buttonText: "Skip & return to Dashboard",
                buttonColor: darkPurple,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const BottomNavPage();
                  }));
                },
                buttonHeight: heightValue50,
                textFontSize: heightValue18,
                buttonWidth: widthValue349,
              )
            ],
          ),
        ),
      ),
    );
  }
}
