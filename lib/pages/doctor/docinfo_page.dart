import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DoctorInfoPage extends StatefulWidget {
  final String doctorId;

  const DoctorInfoPage({super.key, required this.doctorId});

  @override
  State<DoctorInfoPage> createState() => _DoctorInfoPageState();
}

class _DoctorInfoPageState extends State<DoctorInfoPage> {
  bool isLoading = true;
  bool isSaving = false;

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController specializationCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController feeCtrl = TextEditingController();
  final TextEditingController experienceCtrl = TextEditingController();

  Map<String, dynamic>? doctorData;

  final String baseUrl = "http://10.0.2.2:5058/api/doctors"; // 👈 update to match backend

  @override
  void initState() {
    super.initState();
    _fetchDoctor();
  }

  /// Fetch doctor by ID
  Future<void> _fetchDoctor() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/${widget.doctorId}"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          doctorData = data;
          nameCtrl.text = data["name"] ?? "";
          specializationCtrl.text = data["specialization"] ?? "";
          phoneCtrl.text = data["phone"] ?? "";
          addressCtrl.text = data["address"] ?? "";
          feeCtrl.text = data["consultationFee"].toString();
          experienceCtrl.text = data["experienceYears"].toString();
          isLoading = false;
        });
      } else {
        throw Exception("Failed to fetch doctor");
      }
    } catch (e) {
      debugPrint("Error fetching doctor: $e");
      setState(() => isLoading = false);
    }
  }

  /// Update doctor
  Future<void> _updateDoctor() async {
    setState(() => isSaving = true);

    final updatedDoctor = {
      "id": widget.doctorId,
      "name": nameCtrl.text,
      "specialization": specializationCtrl.text,
      "phone": phoneCtrl.text,
      "address": addressCtrl.text,
      "consultationFee": double.tryParse(feeCtrl.text) ?? 0,
      "experienceYears": int.tryParse(experienceCtrl.text) ?? 0,
      "email": doctorData?["email"], // keep unchanged
      "gender": doctorData?["gender"],
      "age": doctorData?["age"],
      "department": doctorData?["department"],
      "password": doctorData?["password"],
      "availableHours": doctorData?["availableHours"] ?? [],
    };

    try {
      final response = await http.put(
        Uri.parse("$baseUrl/${widget.doctorId}"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(updatedDoctor),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Profile updated successfully")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to update: ${response.body}")),
        );
      }
    } catch (e) {
      debugPrint("Error updating doctor: $e");
    } finally {
      setState(() => isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Info"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  TextField(
                    controller: nameCtrl,
                    decoration: const InputDecoration(labelText: "Name"),
                  ),
                  TextField(
                    controller: specializationCtrl,
                    decoration: const InputDecoration(labelText: "Specialization"),
                  ),
                  TextField(
                    controller: phoneCtrl,
                    decoration: const InputDecoration(labelText: "Phone"),
                  ),
                  TextField(
                    controller: addressCtrl,
                    decoration: const InputDecoration(labelText: "Address"),
                  ),
                  TextField(
                    controller: feeCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Consultation Fee"),
                  ),
                  TextField(
                    controller: experienceCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Experience Years"),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isSaving ? null : _updateDoctor,
                    child: isSaving
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Save Changes"),
                  )
                ],
              ),
            ),
    );
  }
}
