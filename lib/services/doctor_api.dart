import 'dart:convert';
import 'package:http/http.dart' as http;

class DoctorApi {
  static const String baseUrl = "http://10.0.2.2:5058/api/Doctors"; 

  // Register a doctor → return created doctor object
  static Future<Map<String, dynamic>?> registerDoctor(Map<String, dynamic> doctor) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(doctor),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // API should return the created doctor object
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  // Get all doctors
  static Future<List<dynamic>> getAllDoctors() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to fetch doctors");
    }
  }

  // Get doctor by ID
  static Future<Map<String, dynamic>> getDoctorById(String id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Doctor not found");
    }
  }

  static Future<Map<String, dynamic>?> loginDoctor(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); 
    } else if (response.statusCode == 401) {
      throw Exception("Invalid email or password");
    } else {
      throw Exception("Failed to login. Status: ${response.statusCode}");
    }
  }


  // Update doctor
  static Future<bool> updateDoctor(String id, Map<String, dynamic> doctor) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(doctor),
    );
    return response.statusCode == 200;
  }

  // Delete doctor
  static Future<bool> deleteDoctor(String id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));
    return response.statusCode == 200;
  }
}
