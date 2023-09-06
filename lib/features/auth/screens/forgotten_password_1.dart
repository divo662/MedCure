import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/global_constants.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textform_field.dart';
import 'otp_page.dart';

class ForgottenPassword1 extends StatefulWidget {
  const ForgottenPassword1({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgottenPassword1> createState() => _ForgottenPassword1State();
}

class _ForgottenPassword1State extends State<ForgottenPassword1> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        title: Image.asset(
          "assets/images/MedCure - Logo.png",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widthValue25),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightValue20,
                ),
                Text(
                  "Password Recovery",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: textColor1,
                      fontSize: heightValue24,
                      wordSpacing: 1.3,
                      letterSpacing: 1),
                ),
                Text(
                  "Please put your information below to sign into\n"
                  "your account",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: subTitleText,
                    fontSize: heightValue14,
                  ),
                ),
                SizedBox(
                  height: heightValue50,
                ),
                CustomTextFormField(
                  prefixIcon: Image.asset("assets/icons/email_icon.png"),
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  hintTextFontSize: heightValue17,
                ),
                SizedBox(height: heightValue450),
                CustomButton(
                  buttonText: "Send",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OTPPage(),
                      ),
                    );
                  },
                  buttonHeight: heightValue50,
                  textFontSize: heightValue23,
                  borderRadius: heightValue10,
                  buttonWidth: widthValue303,
                  buttonColor: primaryAppColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
