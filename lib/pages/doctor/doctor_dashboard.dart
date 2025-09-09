import 'package:flutter/material.dart';

class DoctorDashboard extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final String email;
  final String profilePic;

  const DoctorDashboard({
    super.key,
    required this.doctorName,
    required this.specialization,
    required this.email,
    required this.profilePic,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Dashboard"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(doctorName),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(profilePic), // 👈 doctor’s image
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("My Info"),
              onTap: () {
                Navigator.pop(context);
                // Open doctor info page
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text("Appointments"),
              onTap: () {
                Navigator.pop(context);
                // Open appointments page
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text("My Patients"),
              onTap: () {
                Navigator.pop(context);
                // Show patients list
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context);
                // Add logout logic
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(profilePic),
            ),
            const SizedBox(height: 10),
            Text(
              doctorName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              specialization,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Example action: View appointments
              },
              icon: const Icon(Icons.calendar_today),
              label: const Text("View Appointments"),
            ),
          ],
        ),
      ),
    );
  }
}
