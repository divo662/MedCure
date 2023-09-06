import 'package:flutter/material.dart';
import 'package:medcure/features/auth/screens/change_password_screen.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/global_constants.dart';
import '../../../widgets/custom_transition.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final List<TextEditingController?> _otpControllerList =
      List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _otpControllerList) {
      controller!.dispose();
    }
    super.dispose();
  }

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
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightValue20,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: darkPurple,
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
                    fontSize: heightValue14,
                  ),
                ),
                SizedBox(
                  height: heightValue50,
                ),
                Text(
                  'Enter the 4-digit code sent to your Email',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.040,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.079),
                Form(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 64,
                      width: 68,
                      child: TextFormField(
                        autofocus: true,
                        onSaved: (pin1) {},
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        decoration: const InputDecoration(
                          counterText: "",
                        ),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(
                      height: 64,
                      width: 68,
                      child: TextFormField(
                        autofocus: true,
                        onSaved: (pin2) {},
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        decoration: const InputDecoration(
                          counterText: "",
                        ),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(
                      height: 64,
                      width: 68,
                      child: TextFormField(
                        autofocus: true,
                        onSaved: (pin3) {},
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        decoration: const InputDecoration(
                          counterText: "",
                        ),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(
                      height: 64,
                      width: 68,
                      child: TextFormField(
                        autofocus: true,
                        onSaved: (pin4) {},
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        decoration: const InputDecoration(
                          counterText: "",
                        ),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.049),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Resend Code',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.041,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        )),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MyTransition(
                              oldScreen: const OTPPage(),
                              newScreen: const ChangePasswordScreen(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        backgroundColor: primaryAppColor,
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.049),
                Text(
                  'Resend  code in 15 seconds',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
