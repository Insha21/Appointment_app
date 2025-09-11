import 'package:flutter/material.dart';
import 'login_page.dart';
import 'doctor/doctor_form.dart';
import 'user/profile_setup.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignupPage> {
  bool isCheck = false;
  String role = "Patient"; // Default role

  // Simple text controllers
  final TextEditingController firstNameCtrl = TextEditingController();
  final TextEditingController lastNameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome 👋",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  "Create Your Account",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: media.width * 0.08),

                // --- First Name
                TextField(
                  controller: firstNameCtrl,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: media.width * 0.04),

                // --- Last Name
                TextField(
                  controller: lastNameCtrl,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: media.width * 0.04),

                // --- Email
                TextField(
                  controller: emailCtrl,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: media.width * 0.04),

                // --- Password
                TextField(
                  controller: passwordCtrl,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon:
                        const Icon(Icons.visibility_off, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: media.width * 0.04),

                // --- Role Selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceChip(
                      label: const Text("Patient"),
                      selected: role == "Patient",
                      onSelected: (_) {
                        setState(() {
                          role = "Patient";
                        });
                      },
                    ),
                    const SizedBox(width: 12),
                    ChoiceChip(
                      label: const Text("Doctor"),
                      selected: role == "Doctor",
                      onSelected: (_) {
                        setState(() {
                          role = "Doctor";
                        });
                      },
                    ),
                  ],
                ),

                SizedBox(height: media.width * 0.05),

                // --- Checkbox Terms
                Row(
                  children: [
                    Checkbox(
                      value: isCheck,
                      onChanged: (val) {
                        setState(() {
                          isCheck = val ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "By continuing you accept our Privacy Policy and Terms of Use",
                        style: const TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                    )
                  ],
                ),

                SizedBox(height: media.width * 0.05),

                // --- Register Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {
                      if (role == "Doctor") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DoctorFormPage(),
                          ),
                        );
                        
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CompleteProfileView(),
                          ),
                        );
                      }
                    },
                    child: const Text("Register",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),

                SizedBox(height: media.width * 0.06),

                // --- Already have account
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("Already have an account? ",
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                      Text("Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
