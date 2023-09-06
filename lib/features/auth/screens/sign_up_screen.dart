import 'package:flutter/material.dart';
import 'package:medcure/constants/global_constants.dart';
import 'package:medcure/features/auth/screens/login_page.dart';
import '../../../constants/color_constants.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textform_field.dart';
import '../../../widgets/custom_transition.dart';
import '../../../widgets/password_custom_textform_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                height: heightValue95,
              ),
              Image.asset(
                "assets/images/MedCure - Logo.png",
              ),
              SizedBox(
                height: heightValue20,
              ),
              Text(
                "Create a new account",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor1,
                    fontSize: heightValue24,
                    wordSpacing: 1.3,
                    letterSpacing: 1),
              ),
              Text(
                "Please put your information below to create\n"
                "a new account",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: subTitleText,
                  fontSize: heightValue15,
                ),
              ),
              SizedBox(
                height: heightValue25,
              ),
              CustomTextFormField(
                  hintText: "Name",
                  controller: nameController,
                  hintTextFontSize: heightValue18),
              SizedBox(
                height: heightValue20,
              ),
              CustomTextFormField(
                  hintText: "Email",
                  controller: emailController,
                  hintTextFontSize: heightValue18),
              SizedBox(
                height: heightValue20,
              ),
              PasswordTextFormField(
                  hintText: "Password",
                  keyboardType: TextInputType.text,
                  controller: passwordController),
              SizedBox(
                height: heightValue40,
              ),
              CustomButton(
                buttonText: "Sign Up",
                onTap: () {
                  // BlocProvider.of<AuthBloc>(context).add(SignUpEvent(
                  //     nameController.text,
                  //     emailController.text,
                  //     passwordController.text));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Your account has been created successfully",
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
                      MyTransition(
                        oldScreen: const SignUpScreen(),
                        newScreen: const LoginScreen(),
                      ));
                },
                buttonHeight: heightValue50,
                textFontSize: heightValue18,
                buttonWidth: widthValue351,
                buttonColor: primaryAppColor,
              ),
              SizedBox(height: heightValue30),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                            fontSize: heightValue14,
                            fontWeight: FontWeight.w400,
                          ),
                          children:  [
                            TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: heightValue18
                              ),
                            ),
                            TextSpan(
                              text: "Log in",
                              style: TextStyle(
                                color: primaryAppColor,
                                fontWeight: FontWeight.bold,
                                  fontSize: heightValue18
                              ),
                            ),
                          ])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
