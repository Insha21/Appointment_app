import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../const/fonts.dart';
import 'signup_page.dart';


class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  bool isColorChanged = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: media.width,
        decoration: BoxDecoration(
          gradient: isColorChanged
              ? LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // 🔹 App Title
            Text(
              "Doctor App",
              style: AppTextStyles.heading.copyWith(fontSize: 32),
            ),
            const SizedBox(height: 10),
            Text(
              "Your health, our priority",
              style: AppTextStyles.subtitle,
            ),

            const Spacer(),

            // 🔹 Get Started Button
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isColorChanged ? Colors.transparent : AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ).copyWith(
                      backgroundColor: isColorChanged
                          ? MaterialStateProperty.all<Color>(Colors.transparent)
                          : MaterialStateProperty.all<Color>(AppColors.primary),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      elevation: MaterialStateProperty.all<double>(isColorChanged ? 0 : 4),
                    ),
                    onPressed: () {
                      if (isColorChanged) {
                        // 🔹 Navigate to OnBoarding
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      } else {
                        // 🔹 First tap: change background
                        setState(() {
                          isColorChanged = true;
                        });
                      }
                    },
                    child: Text(
                      "Get Started",
                      style: AppTextStyles.semiBoldItalic.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
