import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medcure/features/home/screens/payment%20section/confirm_payment.dart';
import 'package:medcure/providers/balance_provider.dart';
import 'package:provider/provider.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/global_constants.dart';
import '../../../../providers/appointment_provider.dart';
import '../../../../providers/doctor_profile_provider.dart';
import '../../../../widgets/custom_button.dart';


class DoctorProfile extends StatefulWidget {
  final Doctor selectedDoctor;
  const DoctorProfile({Key? key, required this.selectedDoctor,})
      : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
        ChangeNotifierProvider(create: (_) => AppointmentsProvider()),
      ],
      child: Consumer2<DoctorProvider, AppointmentsProvider>(
          builder: (context, doctorProvider, appointmentsProvider, _) {
            if (kDebugMode) {
              print("Selected Doctor: ${widget.selectedDoctor}");
            }
            if (kDebugMode) {
              print("Selected Illness: ${appointmentsProvider.selectedIllness}");
            }
            return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: heightValue305,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: darkPurple,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: heightValue35,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: heightValue35,
                              width: widthValue40,
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
                        SizedBox(
                          height: heightValue5,
                        ),
                        Row(
                          children: [
                            Container(
                              height: heightValue131,
                              width: widthValue110,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        widget.selectedDoctor.docPic,
                                      ))),
                            ),
                            SizedBox(
                              width: widthValue10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.selectedDoctor.docName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: heightValue17,
                                      letterSpacing: 1),
                                ),
                                Text(
                                  widget.selectedDoctor.title,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w400,
                                    fontSize: heightValue16,
                                  ),
                                ),
                                SizedBox(
                                  height: heightValue5,
                                ),
                                Container(
                                  height: heightValue26,
                                  width: widthValue63,
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.5),
                                      color: Colors.red.shade100),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        Icons.favorite_rounded,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        widget.selectedDoctor.rating,
                                        style: TextStyle(
                                          color: Colors.red.shade700,
                                          fontWeight: FontWeight.w600,
                                          fontSize: heightValue14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: heightValue9,
                        ),
                        Center(
                          child: Container(
                            height: heightValue54,
                            width: widthValue290,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        widget.selectedDoctor.reviews,
                                        style: TextStyle(
                                            color: darkPurple,
                                            fontWeight: FontWeight.w600,
                                            fontSize: heightValue17),
                                      ),
                                      Text(
                                        "Reviews",
                                        style: TextStyle(
                                            color: darkPurple,
                                            fontWeight: FontWeight.w400,
                                            fontSize: heightValue15),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        widget.selectedDoctor.yearsExp,
                                        style: TextStyle(
                                            color: darkPurple,
                                            fontWeight: FontWeight.w600,
                                            fontSize: heightValue17),
                                      ),
                                      Text(
                                        "years.exp",
                                        style: TextStyle(
                                            color: darkPurple,
                                            fontWeight: FontWeight.w400,
                                            fontSize: heightValue15),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        widget.selectedDoctor.patients,
                                        style: TextStyle(
                                            color: darkPurple,
                                            fontWeight: FontWeight.w600,
                                            fontSize: heightValue17),
                                      ),
                                      Text(
                                        "Patients",
                                        style: TextStyle(
                                            color: darkPurple,
                                            fontWeight: FontWeight.w400,
                                            fontSize: heightValue15),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: heightValue17,
                      ),
                      Text(
                        "Demography",
                        style: TextStyle(
                            color: darkPurple,
                            fontWeight: FontWeight.w700,
                            fontSize: heightValue20),
                      ),
                      SizedBox(
                        height: heightValue9,
                      ),
                      Text(
                        "Sed ut perspiciatis unde omnis iste natus error\n"
                        "Sed ut perspiciatis unde omnis iste natus error\n"
                        " sit voluptatem accusantium doloremque laudantium,\n"
                        " sit voluptatem accusantium doloremque laudantium,",
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                            fontSize: heightValue15),
                      ),
                      SizedBox(
                        height: heightValue17,
                      ),
                      Text(
                        "Choose a Date",
                        style: TextStyle(
                            color: darkPurple,
                            fontWeight: FontWeight.w700,
                            fontSize: heightValue20),
                      ),
                      SizedBox(
                        height: heightValue10,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: appointmentsProvider.selectedDay,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 1),
                            // Adjust the range as needed
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                // Customize the date picker theme
                                data: ThemeData.light().copyWith(
                                  primaryColor: darkPurple,
                                  // Customize primary color
                                  hintColor: darkPurple,
                                  // Customize accent color
                                  colorScheme: const ColorScheme.light(primary: darkPurple),
                                  // Customize primary color
                                  buttonTheme:
                                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (selectedDate != null) {
                            // Update the selected date in the provider
                            appointmentsProvider.updateSelectedDay(selectedDate);
                            // Debug print to show the selected date
                            if (kDebugMode) {
                              print('Selected Date: ${DateFormat('dd MMM yyyy').format(selectedDate)}');
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkPurple,
                          // Customize button color
                          elevation: 5,
                          // Add elevation for a shadow effect
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Add rounded corners
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.calendar_today),
                            // Add a calendar icon
                            SizedBox(width: widthValue10),
                            // Add spacing
                            Text(
                              "Choose Date",
                              style: TextStyle(fontSize: heightValue17),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: heightValue20),
                      // Display the chosen date
                      Container(
                        height: heightValue47,
                        padding: EdgeInsets.all(heightValue5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(heightValue15),
                          color: Colors.orange.shade200,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Selected Date: ${DateFormat('dd MMM yyyy').format(appointmentsProvider.selectedDay)}",
                            style: TextStyle(
                              fontSize: heightValue17,
                              color: primaryAppColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heightValue17,
                      ),
                      Text(
                        "Choose a Time",
                        style: TextStyle(
                          color: darkPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: heightValue20,
                        ),
                      ),
                      SizedBox(
                        height: heightValue10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(appointmentsProvider.times.length, (index) {
                            final time = appointmentsProvider.times[index];
                            final isSelected = index == appointmentsProvider.selectedIndex;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  appointmentsProvider.updateSelectedIndex(
                                      isSelected ? -1 : index);
                                  // Debug print to show the selected time
                                  if (kDebugMode) {
                                    print('Selected Time: $time');
                                  }
                                });
                              },
                              child: Container(
                                width: widthValue100,
                                height: heightValue41,
                                margin: const EdgeInsets.all(6),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: isSelected ? darkPurple : Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    time,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: heightValue15,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Text(
                        "Select Illness",
                        style: TextStyle(
                            color: darkPurple,
                            fontWeight: FontWeight.w700,
                            fontSize: heightValue20),
                      ),
                      SizedBox(
                        height: heightValue10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.063,
                        width: MediaQuery.of(context).size.width * 0.95,
                        padding: const EdgeInsets.all(4.9),
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: DropdownButtonFormField<String>(
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.red,
                            size: 32,
                          ),
                          value: appointmentsProvider.selectedIllness,
                          // Use selectedIllness from the provider
                          items: <String>[
                            'Cold',
                            'Flu',
                            'Headache',
                            'Stomachache',
                            'Fever',
                            'Sore Throat',
                            'Allergies',
                            'Cough',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              appointmentsProvider.updateSelectedIllness(newValue);
                              // Update the provider's selectedIllness
                              // Debug print to show the selected illness
                              if (kDebugMode) {
                                print('Selected Illness: $newValue');
                              }
                            });
                          },
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Select Your Illness",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your Illness';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(
                        height: heightValue17,
                      ),
                      Text(
                        "Description",
                        style: TextStyle(
                            color: darkPurple,
                            fontWeight: FontWeight.w700,
                            fontSize: heightValue20),
                      ),
                      SizedBox(
                        height: heightValue10,
                      ),
                      Center(
                        child: Container(
                          height: heightValue110,
                          width: heightValue350,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade600,
                              width: 1.5,
                            ),
                          ),
                          child: TextField(
                            controller: appointmentsProvider.descController,
                            // Use the descController from the provider
                            style: TextStyle(
                              fontSize: heightValue17,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            onChanged: (newValue) {
                              // Update the provider's description whenever the text changes
                              appointmentsProvider.descController.text = newValue;
                              // Debug print to show the entered text
                              if (kDebugMode) {
                                print('Entered Text: $newValue');
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heightValue17,
                      ),
                      Center(
                        child: CustomButton(
                          buttonText: "Book Appointment",
                          onTap: () {
                            if (appointmentsProvider.selectedIndex >= 0 &&
                                appointmentsProvider.selectedIllness != null &&
                                appointmentsProvider.descController.text.isNotEmpty) {
                              // Navigate to the ConfirmPayment and pass the data
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return ConfirmPayment(
                                  selectedDoctor: widget.selectedDoctor,
                                  updatedBalance: Provider.of<BalanceProvider>(context),
                                  appointmentsProvider: appointmentsProvider,// Replace with your balance provider
                                );
                              }));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: primaryAppColor,
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    "Please fill in all required information.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: heightValue15),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          buttonHeight: heightValue50,
                          textFontSize: heightValue18,
                          buttonWidth: widthValue351,
                          buttonColor: primaryAppColor,
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
