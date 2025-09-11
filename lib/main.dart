import 'package:flutter/material.dart';
import 'const/colors.dart';
import 'const/fonts.dart';

import 'pages/on_board.dart';
import 'pages/user/Goal_Page.dart';
void main() {
  runApp(const DoctorAppointmentApp());
}

class DoctorAppointmentApp extends StatelessWidget {
  const DoctorAppointmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Appointment',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: "Poppins", // global font
        textTheme: TextTheme(
          bodyLarge: AppTextStyles.regular,
          bodyMedium: AppTextStyles.subtitle,
          bodySmall: AppTextStyles.small,
          titleLarge: AppTextStyles.heading,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          background: AppColors.background,
        ),
      ),
      home: const SetGoalsPage(),
    );
  }
}
