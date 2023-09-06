import 'package:flutter/material.dart';
import 'package:medcure/features/home/screens/appointment%20section/doctor_profile_container.dart';
import 'package:provider/provider.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/global_constants.dart';
import '../../../providers/doctor_profile_provider.dart';
import '../../../widgets/custom_textform_field.dart';
import '../../../widgets/custom_top_doctors_widget.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<Doctor> filteredDoctors = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    filteredDoctors = [];
  }

  void filterDoctors(String query) {
    final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
    filteredDoctors.clear();

    if (query.isNotEmpty) {
      filteredDoctors.addAll(doctorProvider.doctors.where((doctor) =>
          doctor.docName.toLowerCase().contains(query.toLowerCase()) ||
          doctor.title.toLowerCase().contains(query.toLowerCase())));
    }

    setState(() {
      isSearching = query.isNotEmpty;
    });
  }

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
                "Find Doctor",
                style: TextStyle(
                  color: darkPurple,
                  fontWeight: FontWeight.w600,
                  fontSize: heightValue27,
                ),
              ),
              SizedBox(
                height: heightValue25,
              ),
              Center(
                child: CustomTextFormField(
                  hintText: "Search",
                  controller: searchController,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade400,
                  ),
                  hintTextFontSize: heightValue18,
                  onChanged: (query) {
                    filterDoctors(query);
                  },
                ),
              ),
              SizedBox(
                height: heightValue25,
              ),
              Text(
                "Results",
                style: TextStyle(
                  color: Colors.orange.shade700,
                  fontWeight: FontWeight.w400,
                  fontSize: heightValue18,
                ),
              ),
              SizedBox(
                height: heightValue15,
              ),
              isSearching
                  ? Column(
                      children: filteredDoctors.isNotEmpty
                          ? filteredDoctors
                              .map(
                                (doctor) => DoctorWidget(
                                  doctor: doctor,
                                  onDoctorSelected: (selectedDoctor) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DoctorProfile(
                                            selectedDoctor: doctor),
                                      ),
                                    );
                                  },
                                ),
                              )
                              .toList()
                          : [
                              Center(
                                child: Text(
                                  "No results found.",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: heightValue18,
                                  ),
                                ),
                              ),
                            ],
                    )
                  : SizedBox(
                      height: heightValue100,
                      child: Center(
                        child: Text(
                          "Make a search now.",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: heightValue18,
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: heightValue20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
