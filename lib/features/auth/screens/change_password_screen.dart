import 'package:flutter/material.dart';
import 'package:medcure/constants/global_constants.dart';
import 'package:medcure/features/auth/screens/login_page.dart';
import '../../../constants/color_constants.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/password_custom_textform_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
              Form(
                  child: Column(
                children: [
                  PasswordTextFormField(
                      hintText: "Password",
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');

                        if (value!.isEmpty) {
                          return 'Password is required';
                        }

                        if (!regex.hasMatch(value)) {
                          return 'Please enter a valid password'
                              ' (Min. 6 characters, with at least one'
                              ' uppercase letter, one lowercase letter,'
                              ' and one digit)';
                        }

                        return null;
                      }),
                  SizedBox(
                    height: heightValue20,
                  ),
                  PasswordTextFormField(
                    hintText: "Confirm Password",
                    keyboardType: TextInputType.text,
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (confirmPasswordController.text !=
                          passwordController.text) {
                        return "Password doesn't match";
                      }
                      return null;
                    },
                  ),
                ],
              )),
              SizedBox(height: heightValue350),
              Center(
                child: CustomButton(
                  buttonText: "Save Password",
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "Your Password has been changed successfully",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: primaryAppColor,
                      behavior: SnackBarBehavior.floating,
                      showCloseIcon: true,
                    ));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  buttonHeight: heightValue50,
                  textFontSize: heightValue23,
                  borderRadius: heightValue10,
                  buttonWidth: widthValue353,
                  buttonColor: primaryAppColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
