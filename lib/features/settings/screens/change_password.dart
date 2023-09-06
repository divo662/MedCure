import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/global_constants.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/password_custom_textform_field.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
              child: const Icon(
                Icons.arrow_back,
                color: darkPurple,
              ),
            ),
          ),
        ),
        title: Text(
          "Change Password",
          style: TextStyle(
              color: darkPurple,
              fontWeight: FontWeight.w500,
              fontSize: heightValue23,
              letterSpacing: 1),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: heightValue40,
              ),
              PasswordTextFormField(
                  hintText: "Old Password",
                  keyboardType: TextInputType.text,
                  controller: passwordController),
              SizedBox(
                height: heightValue25,
              ),
              PasswordTextFormField(
                  hintText: "New Password",
                  keyboardType: TextInputType.text,
                  controller: passwordController),
              SizedBox(
                height: heightValue25,
              ),
              PasswordTextFormField(
                  hintText: "Confirm Password",
                  keyboardType: TextInputType.text,
                  controller: passwordController),
              SizedBox(
                height: heightValue45,
              ),
              CustomButton(
                buttonText: "Save Changes",
                onTap: () {
                },
                buttonHeight: heightValue50,
                textFontSize: heightValue18,
                buttonWidth: widthValue351,
                buttonColor: primaryAppColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
