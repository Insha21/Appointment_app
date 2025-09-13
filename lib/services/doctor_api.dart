import 'dart:convert';
import 'package:http/http.dart' as http;

class DoctorApi {
  static const String baseUrl = "http://10.0.2.2:5058/api/Doctors"; 

  // Register a doctor
  static Future<bool> registerDoctor(Map<String, dynamic> doctor) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(doctor),
    );
    return response.statusCode == 200;
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

  // Get doctor by phone
  static Future<Map<String, dynamic>> getDoctorByPhone(String phone) async {
    final response = await http.get(Uri.parse("$baseUrl/by-phone/$phone"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Doctor not found");
    }
  }
}
