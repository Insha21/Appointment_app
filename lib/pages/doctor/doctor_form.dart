import 'package:flutter/material.dart';
import '../../services/doctor_api.dart';
import 'doctor_dashboard.dart';

class DoctorFormPage extends StatefulWidget {
  const DoctorFormPage({super.key});

  @override
  State<DoctorFormPage> createState() => _DoctorFormPageState();
}

class _DoctorFormPageState extends State<DoctorFormPage> {
  final _formKey = GlobalKey<FormState>();
  final DoctorApi _doctorService = DoctorApi();

  // controllers for each field
  final nameCtrl = TextEditingController();
  final genderCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final specializationCtrl = TextEditingController();
  final departmentCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final feeCtrl = TextEditingController();
  final qualificationCtrl = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Doctor Details")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Full Name
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (v) => v!.isEmpty ? 'Enter name' : null,
              ),
              // Gender
              TextFormField(
                controller: genderCtrl,
                decoration: const InputDecoration(labelText: 'Gender'),
                validator: (v) => v!.isEmpty ? 'Enter gender' : null,
              ),
              // Age
              TextFormField(
                controller: ageCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Age'),
                validator: (v) => v!.isEmpty ? 'Enter age' : null,
              ),
              // Specialization
              TextFormField(
                controller: specializationCtrl,
                decoration: const InputDecoration(labelText: 'Specialization'),
                validator: (v) => v!.isEmpty ? 'Enter specialization' : null,
              ),
              // Department
              TextFormField(
                controller: departmentCtrl,
                decoration: const InputDecoration(labelText: 'Department'),
                validator: (v) => v!.isEmpty ? 'Enter department' : null,
              ),
              // Phone
              TextFormField(
                controller: phoneCtrl,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (v) => v!.isEmpty ? 'Enter phone' : null,
              ),
              // Address
              TextFormField(
                controller: addressCtrl,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (v) => v!.isEmpty ? 'Enter address' : null,
              ),
              // Consultation Fee
              TextFormField(
                controller: feeCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Consultation Fee'),
                validator: (v) => v!.isEmpty ? 'Enter fee' : null,
              ),
              // Qualification
              TextFormField(
                controller: qualificationCtrl,
                decoration: const InputDecoration(labelText: 'Qualification'),
              ),

              const SizedBox(height: 30),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => isLoading = true);

                            final doctorData = {
                              "name": nameCtrl.text,
                              "gender": genderCtrl.text,
                              "age": int.parse(ageCtrl.text),
                              "specialization": specializationCtrl.text,
                              "department": departmentCtrl.text,
                              "phone": phoneCtrl.text,
                              "address": addressCtrl.text,
                              "experienceYears": 0,
                              "consultationFee":
                                  double.parse(feeCtrl.text),
                              "email": "temp@email.com" // later link with signup
                            };

                            final success = await DoctorApi
                                .registerDoctor(doctorData);

                            setState(() => isLoading = false);

                            if (success) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DoctorDashboard(
                                    doctorName: nameCtrl.text,
                                    specialization: specializationCtrl.text,
                                    email: doctorData["email"] as String,
                                    profilePic: "assets/icons/icon1.png",
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Failed to register doctor")),
                              );
                            }
                          }
                        },
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
