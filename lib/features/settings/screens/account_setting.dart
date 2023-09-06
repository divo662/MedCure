import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/global_constants.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textform_field.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({Key? key}) : super(key: key);

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  TextEditingController nameController = TextEditingController();

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
          "Account Settings",
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
              Text(
                "Profile",
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w600,
                  fontSize: heightValue27,
                ),
              ),
              SizedBox(
                height: heightValue5,
              ),
              Center(
                child: CircleAvatar(
                  radius: 68,
                  backgroundColor: Colors.grey.shade200,
                  child: const Icon(Icons.person),
                ),
              ),
              Center(
                child: Text(
                  "Change Profile Picture",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: heightValue17,
                  ),
                ),
              ),
              SizedBox(
                height: heightValue15,
              ),
              CustomTextFormField(
                  hintText: "Nzeh Divine",
                  controller: nameController,
                  hintTextFontSize: heightValue18),
              SizedBox(
                height: heightValue25,
              ),
              CustomTextFormField(
                  hintText: "divzeh002@gmail.com",
                  controller: nameController,
                  hintTextFontSize: heightValue18),
              SizedBox(
                height: heightValue25,
              ),
              CustomTextFormField(
                  hintText: "0800 000 0232",
                  controller: nameController,
                  hintTextFontSize: heightValue18),
              SizedBox(
                height: heightValue25,
              ),
              CustomTextFormField(
                  hintText: "15205 North Kierland Blvd, Sulte 100",
                  controller: nameController,
                  hintTextFontSize: heightValue18),
              SizedBox(
                height: heightValue45,
              ),
              CustomButton(
                buttonText: "Save Changes",
                onTap: () {},
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
