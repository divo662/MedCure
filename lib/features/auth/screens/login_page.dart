import 'package:flutter/material.dart';
import 'package:medcure/constants/global_constants.dart';
import 'package:medcure/features/auth/screens/sign_up_screen.dart';
import '../../../constants/color_constants.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textform_field.dart';
import '../../../widgets/custom_transition.dart';
import '../../../widgets/password_custom_textform_field.dart';
import '../../home/screens/bottom_nav.dart';
import 'forgotten_password_1.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool valued = false;
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
                "Welcome",
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
              SizedBox(height: heightValue10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            valued = !valued;
                          });
                        },
                        icon: valued
                            ? const Icon(
                                Icons.check_box_rounded,
                                color: primaryAppColor,
                              )
                            : Icon(
                                Icons.check_box_outline_blank_rounded,
                                color: Colors.grey.shade500,
                              )),
                    Text(
                      'Remember me',
                      style: TextStyle(
                        fontSize: heightValue14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade400,
                      ),
                    )
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const ForgottenPassword1(),
                        transitionDuration: const Duration(seconds: 2),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: heightValue15,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF308BF5),
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: heightValue40,
              ),
              CustomButton(
                buttonText: "Log in",
                onTap: () {
                  // BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                  //     emailController.text, passwordController.text));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Logged in successfully",
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
                        oldScreen: const LoginScreen(),
                        newScreen: const BottomNavPage(),
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
                        builder: (context) => const SignUpScreen(),
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
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: heightValue18
                              ),
                            ),
                            TextSpan(
                              text: "Sign Up",
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
