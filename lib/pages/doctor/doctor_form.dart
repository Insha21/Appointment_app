import 'package:flutter/material.dart';
import 'doctor_dashboard.dart'; // after submit go here

class DoctorFormPage extends StatefulWidget {
  const DoctorFormPage({super.key});

  @override
  State<DoctorFormPage> createState() => _DoctorFormPageState();
}

class _DoctorFormPageState extends State<DoctorFormPage> {
  final _formKey = GlobalKey<FormState>();

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
              // Name
              TextFormField(
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) => value!.isEmpty ? 'Enter name' : null,
              ),

              // Gender
              TextFormField(
                decoration: const InputDecoration(labelText: 'Gender'),
                validator: (value) => value!.isEmpty ? 'Enter gender' : null,
              ),

              // Age
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Age'),
                validator: (value) => value!.isEmpty ? 'Enter age' : null,
              ),

              // Specialization
              TextFormField(
                decoration: const InputDecoration(labelText: 'Specialization'),
                validator: (value) => value!.isEmpty ? 'Enter specialization' : null,
              ),

              // Department
              TextFormField(
                decoration: const InputDecoration(labelText: 'Department'),
                validator: (value) => value!.isEmpty ? 'Enter department' : null,
              ),

              // Phone
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) => value!.isEmpty ? 'Enter phone number' : null,
              ),

              // Address
              TextFormField(
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) => value!.isEmpty ? 'Enter address' : null,
              ),

              // Joining Date
              TextFormField(
                decoration: const InputDecoration(labelText: 'Joining Date (yyyy-mm-dd)'),
                validator: (value) => value!.isEmpty ? 'Enter joining date' : null,
              ),

              // Consultation Fee
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Consultation Fee'),
                validator: (value) => value!.isEmpty ? 'Enter consultation fee' : null,
              ),

              // Qualification
              TextFormField(
                decoration: const InputDecoration(labelText: 'Qualification'),
                validator: (value) => value!.isEmpty ? 'Enter qualification' : null,
              ),

              // Languages
              TextFormField(
                decoration: const InputDecoration(labelText: 'Languages (comma separated)'),
              ),

              const SizedBox(height: 30),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // ✅ For now, just navigate to dashboard
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DoctorDashboard(doctorName: "Dr. Example", // later replace with form values
            specialization: "Cardiologist",
            email: "doctor@example.com",
            profilePic: "assets/icons/icon1.png", 
            ),
                        ),
                      );
                    }
                  },
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
