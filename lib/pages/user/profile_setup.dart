import 'package:flutter/material.dart';
import '../../../const/colors.dart';
import '../../../const/fonts.dart';
import 'Goal_Page.dart';
class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  String? gender;
  final TextEditingController dobController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Complete Your Profile", style: AppTextStyles.heading),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Image
              Image.asset(
                "assets/img/complete_profile.png",
                width: media.width * 0.7,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),

              Text("Let’s complete your profile", style: AppTextStyles.heading),
              const SizedBox(height: 5),
              Text("It will help us know more about you!",
                  style: AppTextStyles.subtitle),
              const SizedBox(height: 20),

              // Gender Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person, color: AppColors.primary),
                  labelText: "Gender",
                  labelStyle: AppTextStyles.regular,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: ["Male", "Female"]
                    .map((g) => DropdownMenuItem(
                          value: g,
                          child: Text(g, style: AppTextStyles.regular),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              const SizedBox(height: 15),

              // Date of Birth
              TextField(
                controller: dobController,
                style: AppTextStyles.regular,
                decoration: InputDecoration(
                  labelText: "Date of Birth",
                  labelStyle: AppTextStyles.regular,
                  prefixIcon:
                      const Icon(Icons.calendar_today, color: AppColors.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      dobController.text =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    });
                  }
                },
              ),
              const SizedBox(height: 15),

              // Weight
              TextField(
                controller: weightController,
                style: AppTextStyles.regular,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Your Weight (KG)",
                  labelStyle: AppTextStyles.regular,
                  prefixIcon: const Icon(Icons.fitness_center,
                      color: AppColors.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Height
              TextField(
                controller: heightController,
                style: AppTextStyles.regular,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Your Height (CM)",
                  labelStyle: AppTextStyles.regular,
                  prefixIcon:
                      const Icon(Icons.height, color: AppColors.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Next Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                     Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SetGoalsPage(),
                          ),
                        );
                  },
                  child: Text("Next >", style: AppTextStyles.regular.copyWith(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
