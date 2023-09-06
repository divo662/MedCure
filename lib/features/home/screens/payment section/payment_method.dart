import 'package:flutter/material.dart';
import 'package:medcure/constants/color_constants.dart';
import '../../../../constants/global_constants.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_transition.dart';
import 'credit_card_screen.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool isClicked = false;
  bool isClicked1 = false;

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: heightValue19,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: Checkbox(
                      value: isClicked,
                      activeColor: primaryAppColor,
                      shape: const CircleBorder(),
                      onChanged: (value) {
                        setState(() {
                          isClicked = value!;
                        });
                      },
                    ),
                    title: Text(
                      "Credit Card",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: heightValue20,
                          letterSpacing: 1),
                    ),
                    subtitle: Text(
                      "1214 **** **** 1234",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontSize: heightValue13,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Checkbox(
                      value: isClicked1,
                      activeColor: primaryAppColor,
                      shape: const CircleBorder(),
                      onChanged: (value) {
                        setState(() {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              "This feature is unavailable now use credit card",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: primaryAppColor,
                            behavior: SnackBarBehavior.floating,
                            showCloseIcon: true,
                          ));
                        });
                      },
                    ),
                    title: Text(
                      "PayPal",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: heightValue20,
                          letterSpacing: 1),
                    ),
                    subtitle: Text(
                      "divo234@gmail.com",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontSize: heightValue13,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: heightValue459,
              ),
              Center(
                child: CustomButton(
                    buttonText: "Continue",
                    buttonColor: primaryAppColor,
                    onTap: () {
                      Navigator.push(
                          context,
                          MyTransition(
                            oldScreen: const PaymentMethodScreen(),
                            newScreen: const PaymentPage(),
                          ));
                    },
                    buttonHeight: heightValue47,
                    buttonWidth: widthValue286,
                    textFontSize: heightValue18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
