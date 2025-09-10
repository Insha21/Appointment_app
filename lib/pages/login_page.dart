import 'signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginPage> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: media.height * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Text(
                  "Hey there,",
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: media.width * 0.08),

                // --- Email field
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

                // --- Password field
                TextField(
                  controller: passwordCtrl,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),

                const SizedBox(height: 10),

                // --- Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        decoration: TextDecoration.underline),
                  ),
                ),

                const Spacer(),

                // --- Login button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Logged in successfully!"),
                      ));
                    },
                    child: const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                SizedBox(height: media.width * 0.06),

                // --- Divider
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    )),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Or",
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    )),
                  ],
                ),

                SizedBox(height: media.width * 0.06),

                // --- Social logins
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialButton("assets/img/google.png"),
                    SizedBox(width: media.width * 0.05),
                    _socialButton("assets/img/facebook.png"),
                  ],
                ),

                const Spacer(),

                // --- Register option
                TextButton(
                  onPressed: () {
                     Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                        // go back to sign-up
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("Don’t have an account yet? ",
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                      Text("Register",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),

                SizedBox(height: media.width * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(String assetPath) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Image.asset(assetPath, width: 22, height: 22),
      ),
    );
  }
}
