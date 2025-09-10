import 'package:flutter/material.dart';
import '../const/colors.dart'; 
import 'start_page.dart';
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;
      setState(() {});
    });
  }

  List pageArr = [
    {
      "title": "Eat Well",
      "subtitle":
          "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
      "image": "assets/img/on_3.png"
    },
    {
      "title": "Track Your Goal",
      "subtitle":
          "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
      "image": "assets/img/on_1.png"
    },
    {
      "title": "Get Expert help",
      "subtitle":
          "Connect with certified doctors anytime. Book appointments, get professional guidance, and take control of your health",
      "image": "assets/images/images3.jpeg"
    },
    
    {
      "title": "Improve Lifestyle",
      "subtitle":
          "Improve the quality of your lyfestyle with us,healthy lifestyle can bring a good mood and increase your productivity",
      "image": "assets/img/on_4.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // 🔹 use your background color
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              var pObj = pageArr[index] as Map? ?? {};
              return OnBoardingPage(pObj: pObj);
            },
          ),

          // 🔹 Circular Next Button
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    color: AppColors.primary, // 🔹 your primary color
                    value: (selectPage + 1) / 4,
                    strokeWidth: 2,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primary, // 🔹 button color
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.navigate_next, color: Colors.white),
                    onPressed: () {
                      if (selectPage < 3) {
                        selectPage = selectPage + 1;
                        controller.animateToPage(
                          selectPage,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.bounceInOut,
                        );
                        setState(() {});
                      } else {
                        // 🔹 Go to Signup Page after last onboarding
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartedView()),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// 🔹 Dummy OnBoardingPage widget (make sure you already have it)
class OnBoardingPage extends StatelessWidget {
  final Map pObj;
  const OnBoardingPage({super.key, required this.pObj});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(pObj["image"], height: 250),
        const SizedBox(height: 20),
        Text(
          pObj["title"],
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            pObj["subtitle"],
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
