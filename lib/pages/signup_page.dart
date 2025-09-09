import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../const/fonts.dart';
import 'doctor/doctor_form.dart'; // ⬅️ import your doctor form page
import 'user/dashboard_page.dart';  // ⬅️ import your user dashboard

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String selectedRole = "User";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🔹 App logo/image
                Center(
                  child: Image.asset(
                    "assets/images/image.png",
                    height: 150,
                    width: 150,
                  ),
                ),
                const SizedBox(height: 30),

                // 🔹 Heading
                Text("Create Account", style: AppTextStyles.heading),
                const SizedBox(height: 10),
                Text("Sign up to get started", style: AppTextStyles.subtitle),
                const SizedBox(height: 40),

                // 🔹 Role Selection
                DropdownButtonFormField<String>(
                  value: selectedRole,
                  decoration: const InputDecoration(
                    labelText: "Sign up as",
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

                // 🔹 Full Name
                TextField(
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    labelStyle: AppTextStyles.subtitle,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Email
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: AppTextStyles.subtitle,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Password
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: AppTextStyles.subtitle,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Confirm Password
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: AppTextStyles.subtitle,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock_outline),
                  ),
                ),
                const SizedBox(height: 30),

                // 🔹 Sign Up button
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
                            builder: (_) => const DoctorFormPage(),
                          ),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DashboardPage(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Sign Up",
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

                // 🔹 Google Sign-up button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    icon: Image.asset(
                      "assets/icons/google.png",
                      height: 24,
                    ),
                    label: const Text("Sign up with Google"),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      side: BorderSide(color: AppColors.primary),
                    ),
                    onPressed: () {
                      // TODO: Handle Google Sign-up
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Already have an account? Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style: AppTextStyles.subtitle),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // back to login
                      },
                      child: Text(
                        "Login",
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
      ),
    );
  }
}
