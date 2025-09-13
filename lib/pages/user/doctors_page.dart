import 'package:flutter/material.dart';
import '../../../const/colors.dart';
import '../../../const/fonts.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          "Dashboard",
          style: AppTextStyles.heading.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            Text(
              "Hello, Ali 👋",
              style: AppTextStyles.heading.copyWith(
                color: AppColors.textDark,
                fontSize: 22,
                fontStyle: FontStyle.normal,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Find your specialist doctor easily",
              style: AppTextStyles.subtitle,
            ),
            const SizedBox(height: 20),

            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: AppColors.primary),
                  hintText: "Search doctors, specialties...",
                  hintStyle: AppTextStyles.regular.copyWith(
                    color: AppColors.textLight,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Categories
            Text(
              "Categories",
              style: AppTextStyles.heading.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: media.height * 0.12,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _categoryItem(Icons.favorite, "Cardiology"),
                  _categoryItem(Icons.visibility, "Ophthalmology"),
                  _categoryItem(Icons.child_care, "Pediatrics"),
                  _categoryItem(Icons.female, "Gynecology"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Top Doctors
            Text(
              "Top Doctors",
              style: AppTextStyles.heading.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Column(
              children: [
                _doctorItem("Dr. Sarah Khan", "Cardiologist", "assets/img/doc1.png"),
                _doctorItem("Dr. Ahmed Ali", "Eye Specialist", "assets/img/doc2.png"),
                _doctorItem("Dr. Fatima Noor", "Pediatrician", "assets/img/doc3.png"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryItem(IconData icon, String title) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          const SizedBox(height: 6),
          Text(
            title,
            style: AppTextStyles.small.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _doctorItem(String name, String specialty, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.heading.copyWith(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  specialty,
                  style: AppTextStyles.regular.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.textLight),
        ],
      ),
    );
  }
}
