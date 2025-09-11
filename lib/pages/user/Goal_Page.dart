import 'package:flutter/material.dart';
import '../../const/colors.dart';
import '../../const/fonts.dart';
import 'welcome.dart';
class SetGoalsPage extends StatefulWidget {
  const SetGoalsPage({super.key});

  @override
  State<SetGoalsPage> createState() => _SetGoalsPageState();
}

class _SetGoalsPageState extends State<SetGoalsPage> {
  final PageController _pageController = PageController(viewportFraction: 0.75);
  int _currentPage = 0;

  final List<Map<String, String>> goalArr = [
    {
      "image": "assets/img/goal_1.png",
      "title": "Lose Weight",
      "subtitle": "I want to burn fat and improve my overall fitness."
    },
    {
      "image": "assets/img/goal_2.png",
      "title": "Gain Muscle",
      "subtitle": "I want to build strength and increase muscle mass."
    },
    {
      "image": "assets/img/goal_3.png",
      "title": "Improve Sleep",
      "subtitle": "I want to sleep better and recover faster."
    },
    {
      "image": "assets/img/goal_4.jpg",
      "title": "Eat Healthier",
      "subtitle": "I want to follow a balanced and clean diet."
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            // ✅ PageView (Carousel replacement)
            PageView.builder(
              controller: _pageController,
              itemCount: goalArr.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                final gObj = goalArr[index];
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = (_pageController.page! - index).abs();
                      value = (1 - (value * 0.7)).clamp(0.4, 1.0);
                    }
                    return Center(
                      child: Transform.scale(
                        scale: value,
                        child: SizedBox(
                           height: media.height * 0.75, // shorter box (reduce height)
                           width: media.width * 0.78, 
                        
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.primary.withOpacity(0.9),
                                AppColors.secondary.withOpacity(0.9),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: media.width * 0.1,
                            horizontal: 16,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                gObj["image"]!,
                                width: media.width * 0.5,
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(height: media.width * 0.08),
                              Text(
                                gObj["title"]!,
                                style: AppTextStyles.heading.copyWith(color: Colors.white),
                              ),
                              Container(
                                width: media.width * 0.1,
                                height: 1,
                                color: Colors.white,
                              ),
                              SizedBox(height: media.width * 0.05),
                              Text(
                                gObj["subtitle"]!,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.small.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    );
                  },
                );
              },
            ),

            // ✅ Overlay (Text + Button)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: media.width,
              child: Column(
                children: [
                  SizedBox(height: media.width * 0.08),
                  Text(
                    "What is your goal?",
                    style: AppTextStyles.heading.copyWith(
                      fontSize: 20,
                      color: AppColors.textDark,
                    ),
                  ),
                  Text(
                    "It will help us to choose the best program for you",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.small.copyWith(
                      fontSize: 13,
                      color: AppColors.textLight,
                    ),
                  ),
                  const Spacer(),

                  // Page indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(goalArr.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 12 : 9,
                        height: _currentPage == index ? 10 : 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? AppColors.primary
                              : AppColors.textLight.withOpacity(0.5),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 20),

                  // Confirm Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeView(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(
                        "Confirm",
                        style: AppTextStyles.regular.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
