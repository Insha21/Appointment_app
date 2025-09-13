import 'package:flutter/material.dart';
import '../../const/colors.dart';
import '../../const/fonts.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        elevation: 0,
        title: Text(
          "Dashboard",
          style: AppTextStyles.heading.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: AppColors.secondary),
              accountName: Text("Welcome User", style: AppTextStyles.regular.copyWith(color: Colors.white)),
              accountEmail: Text("user@email.com", style: AppTextStyles.small.copyWith(color: Colors.white70)),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: AppColors.secondary),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: AppColors.textDark),
              title: Text("Personal Info", style: AppTextStyles.regular),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.local_hospital, color: AppColors.textDark),
              title: Text("Doctors", style: AppTextStyles.regular),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Doctors page coming soon!")),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today, color: AppColors.textDark),
              title: Text("Appointments", style: AppTextStyles.regular),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.textDark),
              title: Text("Settings", style: AppTextStyles.regular),
              onTap: () => Navigator.pop(context),
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: Text("Logout", style: AppTextStyles.regular),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _dashboardCard(
              icon: Icons.local_hospital,
              label: "Find Doctors",
              color: AppColors.textDark,
              textStyle: AppTextStyles.regular,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Doctors feature coming soon!")),
                );
              },
            ),
            _dashboardCard(
              icon: Icons.calendar_today,
              label: "Appointments",
              color: AppColors.textDark,
              textStyle: AppTextStyles.regular,
              onTap: () {},
            ),
            _dashboardCard(
              icon: Icons.info,
              label: "Personal Info",
              color: AppColors.textDark,
              textStyle: AppTextStyles.regular,
              onTap: () {},
            ),
            _dashboardCard(
              icon: Icons.settings,
              label: "Settings",
              color: AppColors.textDark,
              textStyle: AppTextStyles.regular,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashboardCard({
    required IconData icon,
    required String label,
    required Color color,
    required TextStyle textStyle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color.withOpacity(0.1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 12),
              Text(label, style: textStyle.copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
