import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/global_constants.dart';
import '../../../../providers/balance_provider.dart';
import '../../../../widgets/custom_button.dart';
import 'deposition_congratulation_screen.dart';


class AmountToPayScreen extends StatefulWidget {
  const AmountToPayScreen({Key? key}) : super(key: key);

  @override
  State<AmountToPayScreen> createState() => _AmountToPayScreenState();
}

class _AmountToPayScreenState extends State<AmountToPayScreen> {
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final balanceProvider = Provider.of<BalanceProvider>(context);

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
            letterSpacing: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: heightValue19),
              Form(
                child: Container(
                  height: heightValue47,
                  padding: EdgeInsets.all(heightValue5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(heightValue15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: heightValue16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF595959),
                    ),
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      // Allow only digits
                    ],
                    decoration: InputDecoration(
                      hintText: "Enter Amount",
                      hintStyle: TextStyle(
                        fontSize: heightValue16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF595959),
                      ),
                      contentPadding: EdgeInsets.all(heightValue10),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: heightValue90),
              Center(
                child: CustomButton(
                  buttonText: "Add to wallet",
                  onTap: () {
                    final amountText = amountController.text.trim();
                    if (amountText.isNotEmpty) {
                      final double? amountToAdd = double.tryParse(amountText);
                      if (amountToAdd != null) {
                        final double updatedBalance = balanceProvider.currentBalance + amountToAdd;
                        balanceProvider.updateBalance(updatedBalance); // Use await here
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return CongratulationScreen(updatedBalance: updatedBalance);
                        }));
                        amountController.clear();
                      } else {
                        if (kDebugMode) {
                          print("Error parsing amount");
                        }
                      }
                    } else {
                      if (kDebugMode) {
                        print("Input is empty");
                      }
                    }
                  },
                  buttonHeight: heightValue54,
                  buttonWidth: widthValue356,
                  textFontSize: heightValue18,
                  buttonColor: primaryAppColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
