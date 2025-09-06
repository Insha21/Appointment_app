import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../const/fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                    // TODO: handle login
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
                    "assets/icons/google.png", // keep google logo in assets/icons/
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
                      // TODO: Navigate to Signup page
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
