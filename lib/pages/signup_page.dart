import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../const/fonts.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // ✅ Prevent bottom overflow
      body: SafeArea(
        child: SingleChildScrollView( // ✅ Make page scrollable
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
                      // TODO: Handle Signup
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
