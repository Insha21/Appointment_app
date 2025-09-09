import 'package:flutter/material.dart';
import '../../const/fonts.dart';
import '../../const/colors.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  final TextEditingController _searchController = TextEditingController();

  // Dummy doctor data
  final List<Map<String, String>> doctors = [
    {"name": "Dr. Sarah Johnson", "specialization": "Cardiologist", "image": "assets/icons/icon1.png"},
    {"name": "Dr. Ahmed Ali", "specialization": "Dermatologist", "image": "assets/icons/icon2.png"},
    {"name": "Dr. Emily Smith", "specialization": "Dentist", "image": "assets/icons/icon3.png"},
    {"name": "Dr. John Doe", "specialization": "Neurologist", "image": "assets/icons/icon4.png"},
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    // Filter doctors by search
    final filteredDoctors = doctors
        .where((doctor) =>
            doctor["name"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
            doctor["specialization"]!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors", style: AppTextStyles.heading.copyWith(color: Colors.white)),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔹 Search bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search doctor...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // 🔹 Doctor list
            Expanded(
              child: ListView.builder(
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = filteredDoctors[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(doctor["image"]!),
                      ),
                      title: Text(doctor["name"]!, style: AppTextStyles.regular.copyWith(fontWeight: FontWeight.w600)),
                      subtitle: Text(doctor["specialization"]!, style: AppTextStyles.subtitle),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.primary),
                      onTap: () {
                        // TODO: Navigate to doctor details page
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
