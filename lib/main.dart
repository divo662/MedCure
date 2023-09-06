import 'package:flutter/material.dart';
import 'package:medcure/providers/appointment_provider.dart';
import 'package:medcure/providers/balance_provider.dart';
import 'package:medcure/providers/doctor_profile_provider.dart';
import 'package:medcure/providers/recent_transaction_provider.dart';
import 'package:provider/provider.dart';

import 'features/auth/screens/sign_up_screen.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BalanceProvider()),
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
        ChangeNotifierProvider(create: (_) => AppointmentsProvider()),
        ChangeNotifierProvider(create: (_) => RecentTransactionsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MedCure',
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
