import 'package:flutter/material.dart';
import 'package:medcure/constants/color_constants.dart';
import 'package:medcure/constants/global_constants.dart';
import 'package:medcure/features/home/screens/bottom_nav.dart';
import '../../../../widgets/custom_button.dart';

class CongratulationScreen extends StatefulWidget {
  final double updatedBalance;

  const CongratulationScreen({
    Key? key,
    required this.updatedBalance,
  }) : super(key: key);

  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
}

class _CongratulationScreenState extends State<CongratulationScreen> {
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
                spreadRadius: 1,
              ),
            ],
          ),
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
                    letterSpacing: 0.7,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Your Top-up has been successfully done",
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
                  "Total Top-up",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: subTitleText,
                    fontSize: heightValue14,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "₦${widget.updatedBalance.toStringAsFixed(2)}",
                  /// Display updated balance
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
              Text(
                "Total Top-up",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: subTitleText,
                  fontSize: heightValue14,
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: Container(
                        height: heightValue45,
                        width: widthValue50,
                        decoration: BoxDecoration(
                          color: primaryAppColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.payments_sharp,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        "United Bank Of Africa",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const BottomNavPage();
                    }));
                  },
                  buttonHeight: heightValue54,
                  buttonWidth: widthValue290,
                  textFontSize: heightValue18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
