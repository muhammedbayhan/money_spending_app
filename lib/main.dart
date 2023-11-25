import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_spending_app/views/billionaires_view.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money Spending App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(centerTitle: true),
      // fontFamily: GoogleFonts.lexend().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: false,
      ),
      home: const BillionairesView(),
    );
  }
}

