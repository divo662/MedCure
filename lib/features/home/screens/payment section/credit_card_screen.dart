import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/global_constants.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_transition.dart';
import 'amount_screen.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isInputValid = false;
  final TextEditingController cardNumberController = TextEditingController();
  CardType cardType = CardType.invalid;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    cardNumberController.addListener(
      () {
        getCardTypeFrmNumber();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    super.dispose();
  }

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
      body: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightValue35,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Credit Card Number",
                        style: TextStyle(
                            fontSize: heightValue18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: heightValue5,
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: heightValue15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        controller: cardNumberController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a card number';
                          }

                          // Remove any whitespace from the card number
                          value = value.replaceAll(RegExp(r'\s+\b|\b\s'), '');

                          // Check if the card number has a minimum length
                          if (value.length < 16) {
                            return 'Invalid card number';
                          }

                          return null; // Return null for valid input
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                          CardNumberInputFormatter(),
                        ],
                        decoration: InputDecoration(
                          hintText: "Card number",
                          hintStyle: TextStyle(
                            fontSize: heightValue15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600,
                          ),
                          suffix: CardUtils.getCardIcon(cardType),
                        ),
                      ),
                      SizedBox(
                        height: heightValue10,
                      ),
                      Text(
                        "Full Name",
                        style: TextStyle(
                            fontSize: heightValue17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: heightValue5,
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: heightValue15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null; // Return null for valid input
                        },
                        decoration: InputDecoration(
                          hintText: "Full name",
                          hintStyle: TextStyle(
                            fontSize: heightValue15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      SizedBox(height: heightValue18),
                      Row(
                        children: [
                          Text(
                            "CVV",
                            style: TextStyle(
                                fontSize: heightValue18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          SizedBox(width: widthValue151),
                          Text(
                            "Expiry Date",
                            style: TextStyle(
                                fontSize: heightValue18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: heightValue16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter CVV';
                                }
                                if (value.length != 3) {
                                  return 'CVV must be 3 digits';
                                }
                                return null; // Return null for valid input
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                // Limit the input
                                LengthLimitingTextInputFormatter(3),
                              ],
                              decoration: InputDecoration(
                                hintText: "CVV",
                                hintStyle: TextStyle(
                                    fontSize: heightValue16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade600),
                              ),
                            ),
                          ),
                          SizedBox(width: widthValue14),
                          Expanded(
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: heightValue16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                // Expiry date validation
                                if (value == null || value.isEmpty) {
                                  setState(() {
                                    isInputValid = false;
                                  });
                                  return 'Please enter expiry date';
                                }

                                // Validate the format of the date (MM/YY)
                                final RegExp regex = RegExp(r'^\d{2}/\d{2}$');
                                if (!regex.hasMatch(value)) {
                                  setState(() {
                                    isInputValid = false;
                                  });
                                  return 'Invalid date format';
                                }
                                // Split the date into month and year
                                final dateParts = value.split('/');
                                final month = int.tryParse(dateParts[0]);
                                final year = int.tryParse(dateParts[1]);

                                // Check if the month and year are valid
                                if (month == null ||
                                    month < 1 ||
                                    month > 12 ||
                                    year == null ||
                                    year < 0) {
                                  setState(() {
                                    isInputValid = false;
                                  });
                                  return 'Invalid expiry date';
                                }

                                setState(() {
                                  isInputValid = true;
                                });
                                return null; // Return null for valid input
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                                CardMonthInputFormatter(),
                              ],
                              decoration: InputDecoration(
                                hintText: "MM/YY",
                                hintStyle: TextStyle(
                                    fontSize: heightValue16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: heightValue359,
                ),
                Center(
                  child: CustomButton(
                      buttonText: "Continue",
                      buttonColor: primaryAppColor,
                      onTap: () {
                        Navigator.push(
                            context,
                            MyTransition(
                              oldScreen: const PaymentPage(),
                              newScreen: const AmountToPayScreen(),
                            ));
                      },
                      buttonHeight: heightValue47,
                      buttonWidth: widthValue286,
                      textFontSize: heightValue18),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  //the pay now function........................
  void getCardTypeFrmNumber() {
    if (cardNumberController.text.length <= 6) {
      String input = CardUtils.getCleanedNumber(cardNumberController.text);
      CardType type = CardUtils.getCardTypeFrmNumber(input);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }
}

// Card number placement class.
class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    // Check if the cursor is at the beginning (position 0), and if so, return the new value unchanged.
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();

    // Iterate through each character in the input text.
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;

      // Add double spaces every 4 characters, except for the last group.
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();

    // Return the new value with formatted text and the cursor moved to the end.
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

// Expiry date class.
class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;

    // Check if the cursor is at the beginning (position 0), and if so, return the new value unchanged.
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();

    // Iterate through each character in the input text.
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;

      // Add a forward slash (/) every 2 characters, except for the last group.
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();

    // Return the new value with formatted text and the cursor moved to the end.
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

// Credit card class.
class CardUtils {
  // Determine the card type based on the card number.
  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;

    // Check the card number against regular expressions to identify the card type.
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.master;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = CardType.visa;
    } else if (input.startsWith(RegExp(r'((506([01]))|(507([89]))|(6500))'))) {
      cardType = CardType.verve;
    } else if (input.startsWith(RegExp(r'((34)|(37))'))) {
      cardType = CardType.americanExpress;
    } else if (input.startsWith(RegExp(r'((6[45])|(6011))'))) {
      cardType = CardType.discover;
    } else if (input.startsWith(RegExp(r'((30[0-5])|(3[89])|(36)|(3095))'))) {
      cardType = CardType.dinersClub;
    } else if (input.startsWith(RegExp(r'(352[89]|35[3-8][0-9])'))) {
      cardType = CardType.jcb;
    } else if (input.length <= 8) {
      cardType = CardType.others;
    } else {
      cardType = CardType.invalid;
    }

    return cardType;
  }

  // Remove non-numeric characters from a card number.
  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  // Get an icon or widget representing the card type.
  static Widget? getCardIcon(CardType? cardType) {
    String img = "";
    Icon? icon;

    // Determine the image or icon based on the card type.
    switch (cardType) {
      case CardType.master:
        img = 'cards/mastercard.png';
        break;
      case CardType.visa:
        img = 'cards/visa.png';
        break;
      case CardType.verve:
        img = 'cards/verve.png';
        break;
      case CardType.americanExpress:
        img = 'cards/ae.png';
        break;
      case CardType.discover:
        img = "cards/discover.png";
        break;
      case CardType.dinersClub:
        img = 'cards/diners.png';
        break;
      case CardType.jcb:
        img = 'cards/jcb.png';
        break;
      case CardType.others:
        icon = const Icon(
          Icons.credit_card,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
      default:
        icon = const Icon(
          Icons.warning,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
    }

    Widget? widget;
    if (img.isNotEmpty) {
      widget = Image.asset(
        img,
        width: 40.0,
      );
    } else {
      widget = icon;
    }

    return widget;
  }

  // Validate a card number.
  static String? validateCardNum(String? input) {
    if (input == null || input.isEmpty) {
      return "This field is required";
    }
    input = getCleanedNumber(input);
    if (input.length < 8) {
      return "Card is invalid";
    }
    int sum = 0;
    int length = input.length;

    // Validate the card number using the Luhn algorithm.
    for (var i = 0; i < length; i++) {
      int digit = int.parse(input[length - i - 1]);

      // Double every second digit.
      if (i % 2 == 1) {
        digit *= 2;
      }

      // Add digits and subtract 9 if the result is greater than 9.
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null; // Valid card number.
    }
    return "Card is invalid";
  }

  // Validate a CVV number.
  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid";
    }
    return null; // Valid CVV.
  }

  // Validate an expiry date.
  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    int year;
    int month;

    // Check if the date contains a forward slash (/).
    if (value.contains(RegExp(r'(/)'))) {
      var split = value.split(RegExp(r'(/)'));
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Use an invalid year intentionally.
    }

    if ((month < 1) || (month > 12)) {
      return 'Expiry month is invalid';
    }

    var fourDigitsYear = convertYearTo4Digits(year);

    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      return 'Expiry year is invalid';
    }

    if (!hasDateExpired(month, year)) {
      return "Card has expired";
    }

    return null; // Valid expiry date.
  }

  // Convert a two-digit year to a four-digit year.
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  // Check if a card date has expired.
  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  // Check if a card year has passed.
  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date have not passed.
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  // Extract the month and year from an expiry date.
  static List<int> getExpiryDate(String value) {
    var split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  // Check if a card month has passed.
  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();

    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month has passed.
    // 2. Card's month (plus another month) is more than the current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  // Check if a card year has passed.
  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();

    // The year has passed if the year we are currently in is more than the card's year.
    return fourDigitsYear < now.year;
  }
}

// Enum for card types.
enum CardType {
  master,
  visa,
  verve,
  americanExpress,
  discover,
  dinersClub,
  jcb,
  others,
  invalid,
}
