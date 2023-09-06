import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medcure/features/auth/screens/login_page.dart';
import 'package:medcure/features/settings/screens/account_setting.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/global_constants.dart';
import 'change_password.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightValue60,
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                    color: darkPurple,
                    fontWeight: FontWeight.w600,
                    fontSize: heightValue27,
                  ),
                ),
                SizedBox(
                  height: heightValue10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 34,
                      backgroundColor: Colors.grey.shade200,
                      child: const Icon(Icons.person),
                    ),
                    SizedBox(
                      width: widthValue6,
                    ),
                    Text(
                      "Nzeh Divine",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w600,
                        fontSize: heightValue20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: heightValue5,
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading: Container(
                          height: heightValue44,
                          width: widthValue50,
                          decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.wallet,
                            color: primaryAppColor,
                          )),
                      title: Text(
                        "Wallet",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: heightValue15,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    ListTile(
                      leading: Container(
                          height: heightValue44,
                          width: widthValue50,
                          decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.settings,
                            color: primaryAppColor,
                          )),
                      title: Text(
                        "Account Settings",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: heightValue15,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.grey.shade600,
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const AccountSetting();
                        }));
                      },
                    ),
                    ListTile(
                      leading: Container(
                          height: heightValue44,
                          width: widthValue50,
                          decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            CupertinoIcons.padlock_solid,
                            color: primaryAppColor,
                          )),
                      title: Text(
                        "Change Password",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: heightValue15,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.grey.shade600,
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ChangePasswordPage();
                        }));
                      },
                    ),
                    SizedBox(
                      height: heightValue20,
                    ),
                    ListTile(
                      leading: Container(
                          height: heightValue44,
                          width: widthValue50,
                          decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.note_add,
                            color: primaryAppColor,
                          )),
                      title: Text(
                        "Terms and Conditions",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: heightValue15,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    ListTile(
                      leading: Container(
                          height: heightValue44,
                          width: widthValue50,
                          decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.newspaper,
                            color: primaryAppColor,
                          )),
                      title: Text(
                        "News & Blogs",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: heightValue15,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    ListTile(
                      leading: Container(
                          height: heightValue44,
                          width: widthValue50,
                          decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            CupertinoIcons.headphones,
                            color: primaryAppColor,
                          )),
                      title: Text(
                        "Support",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: heightValue15,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: heightValue30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  },
                  child: Center(
                    child: Container(
                      height: heightValue54,
                      width: widthValue100,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              color: primaryAppColor,
                              fontSize: heightValue19,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: heightValue10,
                ),
                Divider(
                  color: Colors.grey.shade400,
                  thickness: 0.5,
                ),
                SizedBox(
                  height: heightValue10,
                ),
                Center(
                  child: Text(
                    "@2023 MedCure -v216 All right reserved.",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: heightValue15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
