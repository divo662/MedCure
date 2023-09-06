import 'package:flutter/material.dart';

class DoctorProvider extends ChangeNotifier {
  /// Define properties for the doctor's data
  List<Doctor> doctors = [];

  /// Constructor
  DoctorProvider() {
    initializeDoctors();
  }

  /// Method to initialize doctor data
  void initializeDoctors() {
    doctors = [
      Doctor(
        docPic: "assets/images/doc6.jpg",
        rating: "5.0",
        docName: "Doc. Alexis Abarawan",
        title: "Head Consultant",
        docDay: "Wednesday Aug 23, 2023",
        price: "₦15,000.00",
        docTime: "10am-11am",
        book: "Book Appointment",
        reviews: '105',
        yearsExp: '25',
        patients: '1250',
      ),
      Doctor(
        docPic: "assets/images/doc3.jpg",
        rating: "4.9",
        docName: "Doc. Amanda Uche",
        title: "General Physician",
        docDay: "Tuesday Aug 22, 2023",
        price: "₦10,000.00",
        docTime: "11am-12pm",
        book: "Book Appointment",
        reviews: '95',
        yearsExp: '17',
        patients: '1100',
      ),
      Doctor(
        docPic: "assets/images/doc2.jpg",
        rating: "4.9",
        docName: "Doc. Temilola Daniella",
        title: "Consultant",
        docDay: "Friday Aug 25, 2023",
        price: "₦8,000.00",
        docTime: "10:30am-11:30am",
        book: "Book Appointment",
        reviews: '75',
        yearsExp: '15',
        patients: '950',
      ),
      Doctor(
        docPic: "assets/images/doc5.jpg",
        rating: "4.7",
        docName: "Doc. Micheal Chidozie",
        title: "Consultant",
        docDay: "Thursday Aug 24, 2023",
        price: "₦5,000.00",
        docTime: "09am-11am",
        book: "Book Appointment",
        reviews: '45',
        yearsExp: '10',
        patients: '600',
      ),
    ];
  }
}

/// The Doctor class represents a doctor's information
class Doctor {
  String docPic;
  String rating;
  String docName;
  String title;
  String docDay;
  String price;
  String docTime;
  String book;
  String reviews;
  String yearsExp;
  String patients;

  Doctor({
    required this.docPic,
    required this.rating,
    required this.docName,
    required this.title,
    required this.docDay,
    required this.price,
    required this.docTime,
    required this.book,
    required this.reviews,
    required this.yearsExp,
    required this.patients,
  });

  /// Named constructor for creating a Doctor with default values
  Doctor.withDefaults()
      : docPic = "default_pic.jpg",
        rating = "0.0",
        docName = "Unknown Doctor",
        title = "Unknown Title",
        docDay = "Unknown Date",
        price = "₦0.00",
        yearsExp = "Unknown",
        reviews = "Unknown",
        patients = "Unknown",
        docTime = "Unknown Time",
        book = "Book Appointment";
}
