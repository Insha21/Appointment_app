import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../const/fonts.dart';
import 'signup_page.dart';
import 'user/dashboard_page.dart';
import 'doctor/doctor_dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedRole = "User"; // default role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🔹 Logo / Image at the top
              Center(
                child: Image.asset(
                  "assets/images/image.png",
                  height: 150,
                  width: 150,
                ),
              ),
              const SizedBox(height: 30),

              // 🔹 Login heading
              Text("Welcome Back", style: AppTextStyles.heading),
              const SizedBox(height: 10),
              Text("Login to continue", style: AppTextStyles.subtitle),
              const SizedBox(height: 40),

              // 🔹 Role Selection (User / Doctor)
              DropdownButtonFormField<String>(
                value: selectedRole,
                decoration: const InputDecoration(
                  labelText: "Login as",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: "User", child: Text("User")),
                  DropdownMenuItem(value: "Doctor", child: Text("Doctor")),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedRole = value!;
                  });
                },
              ),
              const SizedBox(height: 20),

              // 🔹 Email field
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: AppTextStyles.subtitle,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),

              // 🔹 Password field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: AppTextStyles.subtitle,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 30),

              // 🔹 Login button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    if (selectedRole == "Doctor") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorDashboard(
                            doctorName: "Dr. Sarah Johnson",
                            specialization: "Cardiologist",
                            email: "sarah.johnson@example.com",
                            profilePic: "assets/icons/icon1.png",
                          ),
                        ),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardPage(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Login",
                    style: AppTextStyles.semiBoldItalic.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 OR divider
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("OR", style: AppTextStyles.subtitle),
                  ),
                  const Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 20),

              // 🔹 Google Sign-in button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: Image.asset(
                    "assets/icons/google.png",
                    height: 24,
                  ),
                  label: const Text("Sign in with Google"),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    side: BorderSide(color: AppColors.primary),
                  ),
                  onPressed: () {
                    // TODO: handle Google sign-in
                  },
                ),
              ),

              const Spacer(),

              // 🔹 Signup option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account?", style: AppTextStyles.subtitle),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignupPage()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: AppTextStyles.regular.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
