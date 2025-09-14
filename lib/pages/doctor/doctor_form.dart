import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // for date formatting
import '../../services/doctor_api.dart';
import 'doctor_dashboard.dart';

class DoctorFormPage extends StatefulWidget {
  final String email;
  final String password;

  const DoctorFormPage({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  State<DoctorFormPage> createState() => _DoctorFormPageState();
}

class _DoctorFormPageState extends State<DoctorFormPage> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final specializationCtrl = TextEditingController();
  final departmentCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final feeCtrl = TextEditingController();
  final experienceCtrl = TextEditingController();

  String? selectedGender;
  DateTime? selectedDob;
  final ageCtrl = TextEditingController();

  bool isLoading = false;

  // calculate age
  int calculateAge(DateTime dob) {
    final today = DateTime.now();
    int age = today.year - dob.year;
    if (today.month < dob.month || (today.month == dob.month && today.day < dob.day)) {
      age--;
    }
    return age;
  }

  // pick date of birth
  Future<void> _pickDob() async {
    DateTime initialDate = DateTime(1990);
    DateTime firstDate = DateTime(1900);
    DateTime lastDate = DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      setState(() {
        selectedDob = picked;
        ageCtrl.text = calculateAge(picked).toString();
      });
    }
  }

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

              // Gender Dropdown
              DropdownButtonFormField<String>(
                value: selectedGender,
                decoration: const InputDecoration(labelText: 'Gender'),
                items: const [
                  DropdownMenuItem(value: "Male", child: Text("Male")),
                  DropdownMenuItem(value: "Female", child: Text("Female")),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
                validator: (v) => v == null ? 'Select gender' : null,
              ),

              // Date of Birth picker + auto age
              GestureDetector(
                onTap: _pickDob,
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: ageCtrl,
                    decoration: InputDecoration(
                      labelText: selectedDob == null
                          ? "Select Date of Birth"
                          : "Age: ${ageCtrl.text} (DOB: ${DateFormat.yMMMd().format(selectedDob!)})",
                    ),
                    validator: (v) => v!.isEmpty ? 'Select DOB' : null,
                  ),
                ),
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

              // Experience
              TextFormField(
                controller: experienceCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Experience in Years'),
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
                              "gender": selectedGender,
                              "age": int.parse(ageCtrl.text),
                              "specialization": specializationCtrl.text,
                              "department": departmentCtrl.text,
                              "phone": phoneCtrl.text,
                              "address": addressCtrl.text,
                              "experienceYears": int.tryParse(experienceCtrl.text) ?? 0,
                              "consultationFee": double.parse(feeCtrl.text),
                              "email": widget.email,
                              "password": widget.password,
                            };

                            final success = await DoctorApi.registerDoctor(doctorData);

                            setState(() => isLoading = false);
                            if (success != null) {
                              final doctorId = success["id"] ?? success["doctorId"];
                              if (doctorId != null) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DoctorDashboard(
                                      doctorName: success["name"] ?? nameCtrl.text,
                                      specialization: success["specialization"] ?? specializationCtrl.text,
                                      doctorId: doctorId.toString(),
                                      email: success["email"] ?? widget.email,
                                      profilePic: "assets/icons/icon1.png",
                                    ),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Failed to register doctor")),
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
